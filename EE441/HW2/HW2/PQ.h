#ifndef PRIORITYQ_CLASS
#define PRIORITYQ_CLASS
#include "node.h"
#include "link.h"

template <class T>
class PriorityQueue
{
private:
    // assume T is a data type where > (greater than), < (less than) and == (equal to)
    // operators that allow comparison are defined and overloaded.
    LinkedList<T> Q;

public:
    // constructors
    PriorityQueue(void); // PROVIDED BELOW
    PriorityQueue(const PriorityQueue<T>& PQ); // Copy Constructor

    // destructor
    ~ PriorityQueue(void);

    int QSize(void) const;   // Returns the number of items stored in the Priority Queue
    int QEmpty(void) const; // PROVIDED BELOW

    void ShowQ(); // PROVIDED BELOW

    void QInsert(const T& item); // Inserts the item at the correct location in the Q List

    // Deletion methods
    T QDelete(void); // Deletes and returns the item with the highest priority

};

template <class T>
PriorityQueue<T>::PriorityQueue(void)
{}

template <class T>
int  PriorityQueue<T>::QEmpty(void) const
{
    return Q.ListEmpty();
}


template <class T>
void PriorityQueue<T>::ShowQ()
{
    for(Q.Reset(); !Q.EndOfList(); Q.Next())
        cout<<Q.Data()<<" ";
    cout<<"\n";
}
/* Copy Constr
template <class T>
PriorityQueue<T>::PriorityQueue(const PriorityQueue<T>& PQ)
{
       for(PQ.Q.Reset(); !PQ.Q.EndOfList(); PQ.Q.Next())
       QInsert(PQ.Q.Data());
}*/
// Destructor
template <class T>
PriorityQueue<T>::~PriorityQueue(void)
{
    Q.ClearList();
}

template <class T>
int PriorityQueue<T>::QSize(void) const  // Returns the number of items stored in the Priority Queue
{
    return Q.ListSize();
}

template <class T>
void PriorityQueue<T>::QInsert(const T& item)
{   // insert item if the current node has less priority
    for(Q.Reset(0); !Q.EndOfList();Q.Next())
        if(Q.Data()>=item)
            {
                Q.InsertAt(item);
                return;
            }
        Q.InsertAt(item); // insert to the last.
}

template <class T>
T PriorityQueue<T>::QDelete(void)
{
        // test for an empty queue and terminate if true
    if (Q.ListEmpty())
    {
    cerr << "Empty queue!" << endl;
    exit(1);
    }
    return Q.DeleteFront(); // delete and return the node with highest priority
}

#endif  // PRIORITYQ_CLASS
