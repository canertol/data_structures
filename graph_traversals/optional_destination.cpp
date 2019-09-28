#include <iostream>
#include <stdlib.h>
#include <string>
#include <fstream>
#include <cstdio>
#include <algorithm>
using namespace std;

//QUEUE declaration
const int MaxQSize=50;

template <class T>
class Queue

{
private:

// queue array and its parameters

int front, rear, length;
T qlist[ MaxQSize] ;

public:

//constructor

Queue(void); // initialize data members

//queue modification operations
void QInsert(const T& item);

T QDelete(void);

void ClearQueue(void);
// queue access

T QFront(void) const;
// queue test methods

int QLength(void) const;

int QEmpty(void) const;

int QFull(void) const;
};
//QUEUE Implementation
 // Queue constructor

//initialize queue front, rear, count
template <class T>
Queue<T>::Queue(void): front(0), rear (0), length(0)
{}
//Queue Operations
// QInsert: insert item into the queue

template <class T>
void Queue<T>::QInsert(const T& item)
{
// terminate if queue is full
if (length==MaxQSize)
{
cerr<<"Queue overflow!" <<endl;
exit(1);
}
//increment count, assign item to qlist and update rear
length++;
qlist[ rear] =item;
rear=(rear+1)% MaxQSize;
}


//QDelete : delete element from the front of the queue and return its value
template <class T>
T Queue<T>::QDelete(void)
{
T temp;
// if qlist is empty, terminate the program
if (length==0)
{
cerr<<"Deleting from an empty queue!"<<endl;
}
//record value at the front of the queue
temp=qlist[ front] ;
//decrement count, advance front and return former front
length --;
front=(front+1) % MaxQSize;
return temp;
}
template <class T>
void Queue<T>::ClearQueue(void)
{
    rear = 0;
    front = 0;
    length = 0;
}

template <class T>
T Queue<T>::QFront(void) const
{
    return front;
}

template <class T>
int Queue<T>::QLength(void) const
{
    return length;
}

template <class T>
int Queue<T>::QEmpty(void) const
{
    return length==0;
}

template <class T>
int Queue<T>::QFull(void) const
{
    return length==MaxQSize;
}
// STACK declaration
const int MaxStackSize=50;
template <class T>
class Stack
{
private:
T stacklist[MaxStackSize];
int top;
public:
Stack(void); // constructor to initialize top
//modification operations
void Push(const T& item);
T Pop(void);
void ClearStack(void);
//just copy top item without modifying stack contents
T Peek(void) const;
//check stack state returns top element value without removal
int StackEmpty(void) const;
//returns true if the stack is empty
int StackFull(void) const;
//returns true if the stack is full
};
//STACK Implemetation
template <class T>
Stack<T>::Stack(void):top(-1)
{}

template <class T>
//Push
void Stack<T>::Push(const T& item)//
{
//can not push if stack has exceeded its limits
if (top==MaxStackSize-1)
{
cerr<<"Stack overflow"<<endl;
exit(1);
}
// increment top ptr and copy item into list
top++;
stacklist[top] =item;
}
template <class T>
//pop
T Stack<T>::Pop(void)
{
T temp;
// is stack empty nothing to pop
if (top==-1)
{ cerr<<"Stack empty"<<endl;
exit(1);
}
//record the top element
temp=stacklist[ top] ;
//decrement top and return the earlier top element
top--;
return temp;
}

template <class T>
//peek
T Stack<T>::Peek(void) const
{
T temp;
// is stack empty nothing to pop
if (top==-1)
{ cerr<<"Stack empty"<<endl;
exit(1);
}
//record the top element
temp=stacklist[ top] ;
return temp;
}

template <class T>
int Stack<T>::StackEmpty(void) const
{
    return top==-1;
}

template <class T>
int Stack<T>::StackFull(void) const
{
    return top==MaxStackSize-1;
}

int visit(int vertex, int& k, char destination)
{   char v;
    int mul;
    switch(vertex)
    {
    case 0: v = 'A';
            mul = 2;
            break;
    case 1: v = 'B';
            mul = 3;
            break;
    case 2: v = 'C';
            mul = 5;
            break;
    case 3: v = 'D';
            mul = 7;
            break;
    case 4: v = 'E';
            mul = 11;
            break;
    case 5: v = 'F';
            mul = 13;
            break;
    }

    if(k%mul!=0) // if this node is visited before, return without visiting
    {
        if(destination==v)
       {
        return -1;
       }
       else return k*mul; // mark as visited with the corresponding prime number
    }
    else return k;


}

template <class T>
void bft(T  currentNode,int graph[6][6],char destination){
    cout<<"BFT -> ";
    int temp;
    int array[7];
    fill_n(array, 7, -1);
    const int MUL = 510510; // 2*3*5*7*11*13*17 each prime number represents one of 6 vertices
    int k = 17;
    int i = 0;
    Queue<T> Q; // construct a QueueLast for keeping the last visited vertices
    k = visit(currentNode,k, destination); // visit the current node

    Q.QInsert(currentNode); // add the visited node to the QueueLast
    array[i]=currentNode;
    i++;
    while(k<MUL&&k>0) // execute below until all nodes are visited
    {   if(Q.QEmpty()==1)  // if the QueueLAST is empty, return from BFT.
            break;
        currentNode = Q.QDelete(); // get currentNode  from the QueueLAST
        for(int y = 0; y<6; y++)
        {
           if(graph[currentNode][y] == 1)       // if there is a path, ATTEMPT VISITING!
            {
                temp = k;
                k = visit(y,k,destination);       // if the entry is 1, visit next entry from the currentNode
                if(k==-1)
                    {array[i]=y;
                    array[i+1]=-1;
                    break;}
                if(temp!=k)                     // check if visiting happened
                {Q.QInsert(y);        // insert it to the QueueLast
                 array[i] = y;

                 i++;}
                else
                temp = 1;
            }
        }
    }
//*************************************************************
//THIS BLOCK REDUCES THE PATH SIZE IF POSSIBLE
    int b = destination;
    b = b-65;
    //Check if a short path exists to the destination from the previous nodes
    for(i = 0; i<7;i++)
      { temp = array[i];
        if(array[i]==-1)
            break;
        if(graph[temp][b]==1)
            {
             array[++i]=b;
             array[++i]=-1;
             break;
            }
      }
      i = i - 2; // index of previous node of destination node
      int tempi = i;
      b = array[i];
    //Check if a short path exists AMONG the previous nodes
     for(i = 0; i<7;i++)
      { temp = array[i];
        if(array[i]==-1)
            break;
        if(graph[temp][b]==1)
            {
             copy(array + tempi, // copy everything starting here
                    array + 7, // and ending here, not including it,
                    array + i+1); // to this destination
             break;
            }
      }
//*************************************************************
    i=0;
// PRINT OUT THE PATH ARRAY until seeing -1
    while(array[i]!=-1)
     {
       int vertex = array[i];
         switch(vertex)
        {
        case 0: cout<<"A ";
                break;
        case 1: cout<<"B ";
                break;
        case 2: cout<<"C ";
                break;
        case 3: cout<<"D ";
                break;
        case 4: cout<<"E ";
                break;
        case 5: cout<<"F ";
                break;
        }
        i++;
     }

    cout<<endl;
}
template <class T>
void dft(T  currentNode,int graph[6][6], char destination)
{   cout<<"DFT -> ";
    int x = 0;
    int y = 0;
    char v;
    const int MUL = 510510; // 2*3*5*7*11*13*17 each prime number represents one of 6 vertices
    int k = 17;
    int temp,flag;
    Stack<T> Stack, Stack2;
    k = visit(currentNode,k,destination); // visit the current node

    Stack.Push(currentNode); // add the visited node to the stack
    while(k<MUL&&k>0) // execute below until all nodes are visited
    {   if(Stack.StackEmpty()==1)  // if the Stack is empty, return from DFT.
           break;
        if(flag==1)
         currentNode = Stack.Pop(); // get currentNode  from the stack
        else
         currentNode = Stack.Peek(); // get currentNode  from the stack
        for(int y = 0; y<6; y++)
        {     //  cout<<"("<<currentNode<<")";
             if(graph[currentNode][y] == 1)
             {
                temp = k;
                k = visit(y,k,destination);       // if the entry is 1, visit next entry from the currentNode

                if(temp!=k)
                {
                 if(flag==1)
                  Stack.Push(currentNode);
                 Stack.Push(y);        // push it to the stack if it visited
               //  cout<<"{"<<y<<"}";
                 flag = 0;
                 break;
                }
                else
                {flag=1;
                }
             }
        }
    }
   // PRINT OUT THE NODES IN THE PATH FROM STARTING TO DESTINATION
   //Revert the stack order to print from starting node
    while(Stack.StackEmpty()==0)
    {
       int vertex = Stack.Pop();
       Stack2.Push(vertex);
    }

     while(Stack2.StackEmpty()==0)
     {
       int vertex = Stack2.Pop();

         switch(vertex)
        {
        case 0: cout<<"A ";
                break;
        case 1: cout<<"B ";
                break;
        case 2: cout<<"C ";
                break;
        case 3: cout<<"D ";
                break;
        case 4: cout<<"E ";
                break;
        case 5: cout<<"F ";
                break;
        }
     }
}

int main()
{
     int x, y = 5, number;
     int graph[6][6];

     char destination;

    // READS and PARSES the text file into a MATRIX
     ifstream in("edges.txt", ios::binary);
      if (!in) {
        cout << "Cannot open file.\n";
        return 0;
      }
        for (x = 0; x < 6; x++)
        {
            in >> graph[x][0];
        }
      in.close();
        for(x=0; x < 6; x++)
        {
            number = graph[x][0];
            y = 5;
            while(y > -1)
            {
                graph[x][y] = number %10;
                y--;
                number /= 10;
            }
        }
    cout<<"You are in A now."<<endl;
    cout<<"Choose your destination from A, B, C, D, E or F : ";
    cin>>destination; // read the destination node
    cout<<endl;

    bft( 0, graph , destination);
    dft( 0, graph , destination);

    cout<<"Press enter to exit.";
    getchar();
    return 0;
}
