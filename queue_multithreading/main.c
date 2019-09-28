#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>
#include "queue.h"

// SYNCRONAZITON VARIABLES FOR CRITICAL REGIONS
sem_t fullCount; 
sem_t emptyCount;
sem_t mutex;

void *generator(void *arg)
{
	struct Queue *Q = (struct Queue *) arg;
	int maxRand = Q->RadAmount;
	int rangeRand = Q->RadRange;
	int NewMember,i=0;
	srand(time(NULL));
 while(1)
    { 
	while(i<maxRand)
  	  {
		NewMember = rand()%rangeRand;
		if (NewMember == 0) continue;

		sem_wait(&emptyCount);
		sem_wait(&mutex);
		
		QueueInsert((struct Queue*) Q, (int) NewMember); //CRITICAL REGION

		sem_post(&mutex);
		sem_post(&fullCount);

		i++;
	  }
 	pthread_exit(0);
    }
}


void *worker(void *arg)
{
	struct Queue *Q = (struct Queue *) arg;
 	int Number;
  	int T;
  	int k=0;
 	float t[10];
 	t[0]=0.1;
  	for(int i=0; i<10;i++)
	    {t[i+1] = t[i] + 0.1; }
  	srand(time(NULL));
  
  while(1)
   {   
 		T = t[rand() % 10 ];
		sem_wait(&mutex);
		
		if(Q->CurrentSize ==0) //CRITICAL REGION
	   	{
		    sem_post(&mutex);
		    sleep(2);	
		    if(k>0) 
	               pthread_exit(0);
		    else 
		       k++;
	  	}
		else {
			sem_wait(&fullCount);
			Number = QueueRemove((struct Queue*) Q ); //CRITICAL REGION -- Read the first number in the queue.
			sleep(T);	 //WAIT FOR A RANDOM TIME
     			sem_post(&emptyCount);
		
		     }
		sem_post(&mutex);
   	   	

        

		if(Number<=0)    //INTEGERS MUST BE POSITIVE
		   {continue;}
		
		else
		  {
        	   printf("\nThread ID: %lu, Number: %d, Divisors: ",pthread_self(),Number);
	           for (int i=1;i<=Number;i++)
    	 	      if (Number%i==0)
          	         printf("%d ",i);
  		   Number=0;
	          }
	
   }

}

int main(int argc, char **argv)
{
	int genStatus; 
	//DEFAULT COMMAND-LINE ARGUMENTS
	int workerNumber = 5;
	int queueSize = 10;
	int maxRand = 20;
	int rangeRand = 100;
	int c;

while ((c = getopt (argc, argv, "t:q:r:m:")) != -1)
    switch (c)
      {
      case 't':
        workerNumber =atoi (optarg);

	
        break;
      case 'q':
        queueSize = atoi (optarg);
        break;
      case 'r':
        maxRand = atoi (optarg);
        break;
      case 'm':
	rangeRand = atoi (optarg);	
	break;

        return 1;
      default:
        abort ();
      }

	sem_init(&mutex,0,1);  	 // CRITICAL REGION LOCK
	sem_init(&fullCount,0,0); //COUNT THE NUMBER OF FULL PLACES IN THE QUEUE

	struct Queue *Q = QueueInitialize(queueSize, maxRand, rangeRand); 

	sem_init(&emptyCount,0,(Q->MaxSize)-(Q->CurrentSize)); //COUNT THE NUMBER OF EMPTY PLACES IN THE QUEUE

	pthread_t gen,work[workerNumber];
	pthread_create(&gen, 0, generator, Q);
	for(int i = 0; i<workerNumber; i++)
  		{ pthread_create(&work[i], NULL, worker,  Q);}
    
 while(1) //WAIT FOR THE END OF THREADS AND RELEASE THE ALLOCATED MEMORY FOR THE QUEUE
    {
	for(int i=0; i<workerNumber; i++)
	   {pthread_join( work[i], NULL);}
    
	genStatus = pthread_join( gen, NULL);
	if ((genStatus==0)||Q->CurrentSize==0)
    	   {	QueueDestroy((struct Queue*) Q );
		break;
	   }
	
    }

exit(0);
}



