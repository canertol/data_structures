#include <stdio.h>
#include <stdlib.h>
#include <ucontext.h>
#include <signal.h>
#include <stdbool.h>
#include <unistd.h>

#define STACK_SIZE 4096
ucontext_t c3;
volatile sig_atomic_t flag = false;
unsigned int period = 1; // context switching period in seconds
int turn = 1;
int deadThread = 0;
int threadNumber = 0;
int assignedThreads = 0;
int deadThreadTemp = 0;
int finishMark=0;
char* threads[10000];
void scheduler();
// 0: empty 1: ready 2: running 3: finished
struct ThreadInfo 
{
	ucontext_t context;
	int state;
};
struct ThreadInfo Array[5];

void signal_handler(int sig)
{ 
	flag = true;
	scheduler();
}

void counter(int n, int x)
{	
	for(int i=0; i<n; i++)
     	     {  
		printf("\nThread #%d -> %d",x,i);
		sleep(0.1);
		if(flag)
		     {
			flag = false;
		  	swapcontext(&Array[turn].context, &Array[0].context);
		     }
   	     }	
	finishMark = 1;
	deadThread++;
	setcontext(&Array[0].context);
}

void scheduler()
{	if(deadThread == threadNumber)
		     {	
			return;
		     }
	
	if (finishMark == 1 && Array[turn].state != 0)
	     {
		Array[turn].state = 3;
		free(Array[turn].context.uc_stack.ss_sp); 
		Array[turn].state = 0;
		finishMark = 0;
	     }
	
	  	     
	turn++;	
	if(turn > 4 || turn > threadNumber)
	     {	turn = 1;
	     }
	
	if(Array[turn].state == 1)
	     {
		Array[turn].state = 2; 	
		printf("\n");
		alarm(1);			
		swapcontext(&Array[0].context, &Array[turn].context);
		Array[turn].state = 1;
	     }
	
}


int main(int argc, char* argv[])
{ 	
	threadNumber = argc - 1;
	signal( SIGALRM, signal_handler);
	
	if(threadNumber == 0) 
	     {  printf("ERROR: There is nothing to schedule.\n");		
		return(0);
	     }
	printf("\nEE442 - HW#3\nSchedule ");
	for(int i = 0; i<threadNumber+1; i++)
		{	threads[i] = argv[i];
			if(i>0) printf("%d ", atoi(threads[i]) );
		}
	
	getcontext(&Array[0].context);

	for(int i=1; (i<5) ; i++) 
   	     {  		
		
		Array[i].state = 0;
	     }

	for(int i=1; (i<=threadNumber) && (i<5) ; i++) 
   	     {  		
		getcontext(&Array[i].context);
		Array[i].context.uc_link = &Array[0].context;
		Array[i].context.uc_stack.ss_sp = malloc(STACK_SIZE);
		Array[i].context.uc_stack.ss_size = STACK_SIZE;
		makecontext(&Array[i].context, (void (*)(void))counter, 2, atoi(threads[i]), i);	
		assignedThreads++;
		Array[i].state = 1;
	     }

	alarm(period);	

	while(1)
	     { 	
		if(deadThread == threadNumber)
		     {
			break;
		     }

		if(flag == 1)
		     {
			flag = false;
			alarm(period);	
		     }	
		
		if(assignedThreads < threadNumber && Array[turn].state == 0) 
		     {	assignedThreads++;
			if(assignedThreads <= threadNumber)
			     {
							
				getcontext(&Array[turn].context);
				Array[turn].context.uc_link = &Array[0].context;
				Array[turn].context.uc_stack.ss_sp = malloc(STACK_SIZE);
				Array[turn].context.uc_stack.ss_size = STACK_SIZE;
				makecontext(&Array[turn].context, (void (*)(void))counter,2, atoi(threads[assignedThreads]), assignedThreads);					
				Array[turn].state= 1;
				finishMark = 0;
				
		             } 
			 		
	    	     }	
	    }

return(0);
}
