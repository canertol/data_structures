#ifndef TREENODE_CLASS
#define TREENODE_CLASS

#ifndef NULL
const int NULL = 0;
#endif  // NULL

template <class T>
class TreeNode
{
    public:
        // points to the left and right children of the node
        TreeNode<T> *left;
        TreeNode<T> *right;

        T data;

        // constructor
        TreeNode(const T& item, TreeNode<T> *lptr = NULL, TreeNode<T> *rptr = NULL);

        // destructor
        ~TreeNode(void);

};

// constructor. initialize the data and pointer fields.
// the pointer NULL assigns an empty tree
template <class T>
TreeNode<T>::TreeNode(const T& item, TreeNode<T> *lptr, TreeNode<T> *rptr)
    : data(item), left(lptr), right(rptr)
{}

template <class T>
TreeNode<T>::~TreeNode(void)
{}

#endif  // TREENODE_CLASS
