#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>
#include "queue.h"

struct Queue *QueueInitialize(int size, int radAmount, int radRange)
{
	{	
                struct Queue *Q = (struct Queue*) malloc(sizeof(struct Queue));
   		Q->MaxSize = size;
      		Q->FrontIndex = 0;
		Q->CurrentSize = 0;
      		Q->RearIndex = 0;
		Q->RadAmount = radAmount;
		Q->RadRange = radRange;
		Q->Array = (int*) malloc(Q->MaxSize * sizeof(int));																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																						
		     
		return Q;
	}
}

void QueueInsert(void *arg, int member )
{ 
		struct Queue *Q= (struct Queue *) arg;
	 	Q->CurrentSize++;
		Q->RearIndex = (Q->RearIndex + 1);
		Q->Array[Q->RearIndex] = member;
 		if(Q->RearIndex == Q->MaxSize) // CIRCULAR QUEUE OPERATION
	 	   {Q->RearIndex = 0;}
 		return;
}


int QueueRemove(struct Queue *Q)
{
		int member;
 		if(Q->CurrentSize ==0 )
		   {return(-1);}
 		else
		   {	 Q->CurrentSize--;	
 			 Q->FrontIndex++;
  			 member = FrontMember((struct Queue *)Q);
			 
			 if(Q->FrontIndex == Q->MaxSize) // CIRCULAR QUEUE OPERATION
  		 	   {Q->FrontIndex=0;}  
			 
  		   }
	        return member;
}


int FrontMember(struct Queue *Q)  // FUNCTION TO GET THE MEMBER IN THE FRONT
{
   		if(Q->CurrentSize == Q->MaxSize)
		   {return(-1);}

   		return Q->Array[Q->FrontIndex];
}
 

int RearMember(struct Queue *Q)  // FUNCTION TO GET THE MEMBER IN THE REAR
{
    		if(Q->CurrentSize ==0 )
		   {return(-1);}

		else
    		   {return Q->Array[Q->RearIndex];}
}
 


void QueueDestroy(struct Queue *Q)  
{
		free((struct Queue*) Q);
		return;
}






