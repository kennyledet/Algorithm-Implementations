#ifndef _BINARY_SEARCH_TREE
#define _BINARY_SEARCH_TREE

#include <iostream>
#include <string>
#include <stack>

template<typename Type>
class BinarySearchTree {
private:
    struct BinaryNode
    {
        Type element;
        BinaryNode* left;
        BinaryNode* right;
        bool marked;

        BinaryNode(const Type & _element, BinaryNode* _left, BinaryNode* _right)
            :element{ _element }, left{ _left }, right{ _right }
        {
            marked = false;
        }

        BinaryNode(const Type && _element, BinaryNode* _left, BinaryNode* _right)
            :element{ _element }, left{ _left }, right{ _right }
        {
            marked = false;
        }
    };

    BinaryNode* root; // root node of the tree

    /**/
    void insert(const Type & x, BinaryNode*& t) {
        if (t == nullptr)
            t = new BinaryNode{ x, nullptr, nullptr };
        else if (x < t->element) {
            insert(x, t->left);
        }
        else if (x > t->element) {
            insert(x, t->right);
        }
        else{}; // do nothing
    }

    /**/
    void remove(const Type * x, BinaryNode* & t) {
        if(t == nullptr){
            return;
        }
        else if(x < t->element){
            return this->remove(t->left);
        }
        else if(x > t->element){
            return this->remove(t->right);
        }
        else if(x == t->element && t->right == nullptr && t->left == nullptr){
            delete t;
        }
    }

    // Finds the smallest node in the tree
    BinaryNode* findMin(BinaryNode* t) const {
        if(t == nullptr){
            return nullptr;
        }
        if(t->left == nullptr){
            return t;
        }
        else{
            return findMin(t->left);
        }
    }

    // Finds the smallest element in the tree
    BinaryNode* findMax(BinaryNode* t) const {
        if(t == nullptr){
            return nullptr;
        }

        if(t->right == nullptr){
            return t;
        }
        else{
            return findMax(t->right);
        }
    }

    // Checks the tree for a node.
    // returns true if it does and false otherwise
    bool contains(const Type& x, BinaryNode* t) const {
        if (t == nullptr) {
            return false;
        }
        else if (x < t->element) {
            return contains(x, t->left);
        }
        else if (x > t->element) {
            return contains(x, t->right);
        }
        else
            return true;
    }

public:
    BinarySearchTree() {this->root = nullptr; }
    ~BinarySearchTree() {}

    // Finds the smallest element in a BST
    // It starts left and continues as long as there is a child
    const Type & findMin() const {
        return findMin(root)->element;
    }

    const Type & findMax() const {
        return findMax(root)->element;
    }

    bool contains(const Type& x) const {
        return contains(x, root);
    }

    void insert(const Type& x) {
        this->insert(x, root);
    }

    void remove(const Type& x) {
        this->remove(x, root);
    }
};

#endif
