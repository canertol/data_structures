#include <iostream>
#include "bstree.h"
#include "treenode.h"

using namespace std;

int main()
{
    BinSTree<int> MyTree;
    TreeNode<int> * TreeP1, * TreeP2, *p1, *p2;
    MyTree.Insert(90);

    MyTree.Insert(150);

    MyTree.Insert(180);

    MyTree.Insert(75);

    MyTree.Insert(100);

    MyTree.Insert(120);

    MyTree.Insert(130);
    MyTree.Insert(110);
    MyTree.Insert(40);

    TreeP1=MyTree.FindNode(90,TreeP2);
    //cout<<TreeP1->data;

    BinSTree<int> Yours;
    Yours = MyTree;
    p1 = Yours.FindNode(110,p2);
    //cout<<p2->data;

    //cout<<Yours.TreeEmpty();

    Yours.Delete(40);
    p1 = Yours.FindNode(75,p2);
    cout<<Yours.TreeSize();
    cout<<endl<<p2->data;
    return 0;
}
