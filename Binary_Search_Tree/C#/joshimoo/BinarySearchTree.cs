using System;
using System.Collections;
using System.Collections.Generic;

namespace JamLib.DataStructures.Trees
{
    public enum TraversalMethod
    {
        Preorder,
        Inorder,
        Postorder
    }

    public class BinarySearchTree<T> : ICollection<T>
    {
        private int count;
        public int Count { get { return count; } }
        public bool IsReadOnly { get { return false; } }

        // Root
        private BinarySearchTreeNode<T> root;
        private readonly Comparer<T> comparer;

        public BinarySearchTree(Comparer<T> comparer) { this.comparer = comparer; }
        public BinarySearchTree() { comparer = Comparer<T>.Default; }

        public void Add(T item)
        {
            // Create a new Node for this item
            BinarySearchTreeNode<T> node = new BinarySearchTreeNode<T>(item);
            BinarySearchTreeNode<T> current = root, parent = null;

            // Find the right spot to insert the element
            while (current != null)
            {
                int c = comparer.Compare(current.Value, item);

                // exit. the bst requires unique elements
                if (c == 0) { return; }
                else if (c > 0)
                {
                    parent = current;
                    current = current.Left;
                }
                else if (c < 0)
                {
                    parent = current;
                    current = current.Right;
                }
            }

            // Ready to add the node if the tree is empty add it as the root
            if (parent == null) { root = node; }
            else
            {
                int c = comparer.Compare(parent.Value, item);
                if (c > 0) { parent.Left = node; }
                else { parent.Right = node; }
            }
            count++;
        }

        public bool Remove(T item)
        {
            // No Items in the tree 
            if (root == null) { return false; }
            BinarySearchTreeNode<T> current = root, parent = null;

            /* HACK: This feels dirty, we can differentiate beetwen root node and not found by checking if the node is actually the root node 
            // If parent is null, we are the root node // 
            var parent = FindParent(item);
            if (parent != null)
            {
                int c = comparer.Compare(parent.Value, item);
                if (c > 0) { current = parent.Left; }
                else if (c < 0) { current = parent.Right; }
            }
            else
            {
                // Make sure we are actually the root node, if not then we could not find the item.
                if (comparer.Compare(root.Value, item) != 0) { return false; }
            }*/

            // Find the node in the tree
            while (current != null)
            {
                int c = comparer.Compare(current.Value, item);

                // found the node to delete
                if (c == 0) { break; }
                else if (c > 0)
                {
                    parent = current;
                    current = current.Left;
                }
                else if (c < 0)
                {
                    parent = current;
                    current = current.Right;
                }
            }

            // Could not find the node
            if (current == null) { return false; }

            RemoveNode(current, parent);
            return true;
        }

        public void Clear()
        {
            root = null;
            count = 0;
        }


        public bool Contains(T item) { return Find(item) != null; }
        private BinarySearchTreeNode<T> Find(T item)
        {
            BinarySearchTreeNode<T> current = root;

            // Search for the element in the tree
            while (current != null)
            {
                int c = comparer.Compare(current.Value, item);

                // Found the element
                if (c == 0) { return current; }
                else if (c > 0) { current = current.Left; }
                else if (c < 0) { current = current.Right; }
            }

            return null;
        }
        private BinarySearchTreeNode<T> FindParent(T item)
        {
            BinarySearchTreeNode<T> current = root, parent = null;

            // Find the item
            while (current != null)
            {
                int c = comparer.Compare(current.Value, item);

                // exit. we found the item, return it's parent
                if (c == 0) { return parent; }
                else if (c > 0)
                {
                    parent = current;
                    current = current.Left;
                }
                else if (c < 0)
                {
                    parent = current;
                    current = current.Right;
                }
            }

            return null;
        }
        private void RemoveNode(BinarySearchTreeNode<T> node, BinarySearchTreeNode<T> parent)
        {
            // delete the item and fix up the tree
            if (node == null) { throw new ArgumentNullException("node"); }
            BinarySearchTreeNode<T> target = null;
            count--;

            // Case 1: current has only smaller children, therefore the left side replaces current
            if (node.Right == null) { target = node.Left; }

            // Case 2: right side has only bigger children, therefore right side replaces current
            else if (node.Right.Left == null)
            {
                // Attach the left branch to the right branch
                target = node.Right;
                target.Left = node.Left;
            }

            // Case 3: right side has smaller children, find the smallest and replace current
            else
            {
                BinarySearchTreeNode<T> leftParent = node.Right;
                target = node.Right.Left;
                while (target.Left != null)
                {
                    leftParent = target;
                    target = target.Left;
                }

                // the parent's left subtree becomes the targets right subtree
                leftParent.Left = target.Right;

                // assign target's left and right to current's left and right children
                target.Left = node.Left;
                target.Right = node.Right;
            }

            // Attach the remaining
            if (parent == null) { root = target; }
            else
            {
                int c = comparer.Compare(parent.Value, node.Value);
                if (c > 0) { parent.Left = target; }
                else if (c < 0) { parent.Right = target; }
            }
        }

        #region NOTE: Idea/Code Provided by: http://msdn.microsoft.com/en-US/library/ms379572(v=vs.80).aspx this is a brilliant way to implement this enumerator
        #region GetEnumerator
        /// <summary>
        /// Copies the contents of the BST to an appropriately-sized array of type T, using the Inorder traversal method.
        /// </summary>
        public void CopyTo(T[] array, int index) { CopyTo(array, index, TraversalMethod.Inorder); }

        /// <summary>
        /// Copies the contents of the BST to an appropriately-sized array of type T, using a specified traversal method.
        /// </summary>
        public void CopyTo(T[] array, int index, TraversalMethod traversalMethod)
        {
            IEnumerable<T> enumerable = null;

            // Determine which Enumerator-returning property to use, based on the TraversalMethod input parameter
            if (traversalMethod == TraversalMethod.Preorder) { enumerable = Preorder; }
            else if (traversalMethod == TraversalMethod.Inorder) { enumerable = Inorder; }
            else { enumerable = Postorder; }

            // dump the contents of the tree into the passed-in array
            int i = 0;
            foreach (T value in enumerable)
            {
                array[i + index] = value;
                i++;
            }
        }


        IEnumerator IEnumerable.GetEnumerator() { return GetEnumerator(); }
        public IEnumerator<T> GetEnumerator() { return GetEnumerator(TraversalMethod.Inorder); }
        public IEnumerator<T> GetEnumerator(TraversalMethod TraversalMethod)
        {
            // The traversal approaches are defined as public properties in the BST class...
            // This method simply returns the appropriate property.
            if (TraversalMethod == TraversalMethod.Preorder) { return Preorder.GetEnumerator(); }
            else if (TraversalMethod == TraversalMethod.Inorder) { return Inorder.GetEnumerator(); }
            else { return Postorder.GetEnumerator(); }
        }
        #endregion

        #region Enumerable Properties
        public IEnumerable<T> Preorder
        {
            get
            {
                // A single stack is sufficient here - it simply maintains the correct
                // order with which to process the children.
                var toVisit = new Stack<BinarySearchTreeNode<T>>(Count);
                var current = root;
                if (current != null) { toVisit.Push(current); }

                while (toVisit.Count != 0)
                {
                    // take the top item from the stack
                    current = toVisit.Pop();

                    // add the right and left children, if not null
                    if (current.Right != null) { toVisit.Push(current.Right); }
                    if (current.Left != null) { toVisit.Push(current.Left); }

                    // return the current node
                    yield return current.Value;
                }
            }
        }

        public IEnumerable<T> Inorder
        {
            get
            {
                // A single stack is sufficient - this code was made available by Grant Richins:
                // http://blogs.msdn.com/grantri/archive/2004/04/08/110165.aspx
                var toVisit = new Stack<BinarySearchTreeNode<T>>(Count);
                for (BinarySearchTreeNode<T> current = root; current != null || toVisit.Count != 0; current = current.Right)
                {
                    // Get the left-most item in the subtree, remembering the path taken
                    while (current != null)
                    {
                        toVisit.Push(current);
                        current = current.Left;
                    }

                    current = toVisit.Pop();
                    yield return current.Value;
                }
            }
        }

        public IEnumerable<T> Postorder
        {
            get
            {
                // maintain two stacks, one of a list of nodes to visit,
                // and one of booleans, indicating if the nodee has been processed or not.
                var toVisit = new Stack<BinarySearchTreeNode<T>>(Count);
                var hasBeenProcessed = new Stack<bool>(Count);

                BinarySearchTreeNode<T> current = root;
                if (current != null)
                {
                    toVisit.Push(current);
                    hasBeenProcessed.Push(false);
                    current = current.Left;
                }

                while (toVisit.Count != 0)
                {
                    if (current != null)
                    {
                        // add this node to the stack with a false processed value
                        toVisit.Push(current);
                        hasBeenProcessed.Push(false);
                        current = current.Left;
                    }
                    else
                    {
                        // see if the node on the stack has been processed
                        bool processed = hasBeenProcessed.Pop();
                        BinarySearchTreeNode<T> node = toVisit.Pop();

                        if (!processed)
                        {
                            // if it's not been processed, "recurse" down the right subtree
                            toVisit.Push(node);
                            hasBeenProcessed.Push(true);    // it's now been processed
                            current = node.Right;
                        }
                        else { yield return node.Value; }
                    }
                }
            }
        }
        #endregion
        #endregion

        // TODO: Think about implementing a base node class, that we can reuse in all trees
        private class BinarySearchTreeNode<T>
        {
            private readonly BinarySearchTreeNode<T>[] nodes;
            public T Value { get; private set; }

            public BinarySearchTreeNode<T> Left
            {
                get { return nodes[0]; }
                set { nodes[0] = value; }
            }
            public BinarySearchTreeNode<T> Right
            {
                get { return nodes[1]; }
                set { nodes[1] = value; }
            }

            public BinarySearchTreeNode(T value)
            {
                Value = value;
                nodes = new BinarySearchTreeNode<T>[2];
            }
            public BinarySearchTreeNode(T value, BinarySearchTreeNode<T> left, BinarySearchTreeNode<T> right)
            {
                Value = value;
                nodes = new BinarySearchTreeNode<T>[2] { left, right };
            }
        }
    }
}
