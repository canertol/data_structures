#include <iostream>
#include "link.h"
#include "node.h"
#include "PQ.h"

using namespace std;

int main()
{
/*
    LinkedList<char> MyList;
    for(int i=1;i<105;i++)
        MyList.InsertAfter(i);
    for(MyList.Reset(0); !MyList.EndOfList();MyList.Next())
        {cout<<MyList.Data()<<" ";
        }

    LinkedList<int> Mylist;
    LinkedList<int> List;
    for(int i=1;i<10;i++)
        Mylist.InsertAt(i);

    for(Mylist.Reset(0); !Mylist.EndOfList();Mylist.Next())
        cout<<Mylist.Data()<<" ";
        cout<<endl;

    cout<<"Current position is "<<Mylist.CurrentPosition()<<endl;
    List.CopyList(Mylist);
    cout<<"List size is "<<List.ListSize()<<" ";
    for(List.Reset(0); !List.EndOfList();List.Next())
        cout<<List.Data()<<" ";
        cout<<endl;
    List.Reset(5);
    cout<<"Current position is "<<List.CurrentPosition();
    cout<<endl;
    List.Next();
    cout<<"Current position is "<<List.CurrentPosition();
    cout<<endl;
    List.InsertFront(44);
     for(List.Reset(0); !List.EndOfList();List.Next())
        cout<<List.Data()<<" ";
        cout<<endl;
        cout<<"Current position is "<<List.CurrentPosition();
    cout<<endl;
    List.InsertRear(44);
     for(List.Reset(0); !List.EndOfList();List.Next())
        cout<<List.Data()<<" ";
        cout<<endl;
    cout<<"Current position is "<<List.CurrentPosition();
    cout<<endl;
    List.Reset(10);
    List.InsertAt(77);
      for(List.Reset(0); !List.EndOfList();List.Next())
        cout<<List.Data()<<" ";
        cout<<endl;
    List.Reset(7);
    List.InsertAfter(88);
     for(List.Reset(0); !List.EndOfList();List.Next())
        cout<<List.Data()<<" ";
        cout<<endl;
    List.Reset(11);
    List.DeleteAt();
    for(List.Reset(0); !List.EndOfList();List.Next())
        cout<<List.Data()<<" ";
        cout<<endl;
    */
    PriorityQueue<int> MyQ;


    MyQ.QInsert(15);
    MyQ.QInsert(10);
    MyQ.QInsert(15);
    MyQ.ShowQ();
    MyQ.QInsert(30);
    MyQ.QInsert(20);
    MyQ.QInsert(5);

    MyQ.ShowQ();
    int most_important=MyQ.QDelete();

    cout<<most_important<<endl;
    MyQ.ShowQ();

 //  PriorityQueue<int> YQ = MyQ;
 //  YQ.ShowQ();

    /*




    Mylist.Reset(3);
    Mylist.DeleteAt();
     for(Mylist.Reset(0); !Mylist.EndOfList();Mylist.Next())
        cout<<Mylist.Data()<<" ";
        cout<<endl;
    Mylist.Reset(3);
    Mylist.InsertAt(9);
     for(Mylist.Reset(0); !Mylist.EndOfList();Mylist.Next())
        cout<<Mylist.Data()<<" ";
        cout<<endl;
    Mylist.Reset(0);
    Mylist.InsertAt(10);
    //Mylist.InsertAt(9);
     for(Mylist.Reset(0); !Mylist.EndOfList();Mylist.Next())
        cout<<Mylist.Data()<<" ";
        cout<<endl;
*/
    return 0;
}
