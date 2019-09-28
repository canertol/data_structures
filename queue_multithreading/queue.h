#ifndef HOMEWORK_IKI
#define HOMEWORK_IKI

struct Queue
{
	int CurrentSize;
	int FrontIndex;
	int RearIndex;
	int MaxSize;
	int RadAmount;
	int RadRange;
	int *Array;

};

struct Queue *QueueInitialize(int size, int radAmount, int radRange );
void QueueInsert(void *arg, int member );
int QueueRemove(struct Queue *Q);
void QueueDestroy();
int FrontMember(struct Queue *Q);
int RearMember(struct Queue *Q);

#endif
