package roman_kachanovsky

type Node struct{
	left *Node
	right *Node
	value int
}

type Tree struct{
	root *Node
	size int
}

func (tree *Tree) Size() int {
	return tree.size
}

func (tree *Tree) Root() *Node {
	return tree.root
}

// Constructor
func NewTree() *Tree {
	tree := new(Tree)
	tree.size = 0
	return tree
}

func (root *Node) insert(node *Node) {
	if node.value > root.value {
		if root.right == nil {
			root.right = node
		} else {
			root.right.insert(node)
		}
	} else if node.value < root.value {
		if root.left == nil {
			root.left = node
		} else {
			root.left.insert(node)
		}
	}
}

func (tree *Tree) Insert(value int) {
	if tree.root == nil {
		tree.root = &Node{nil, nil, value}
	} else {
		tree.root.insert(&Node{nil, nil, value})
	}

	tree.size++
}

func search(root *Node, value int) (bool, *Node) {
	if root != nil {
		if root.value == value {
			return true, root
		} else if root.value < value {
			return search(root.right, value)
		} else {
			return search(root.left, value)
		}
	}

	return false, nil
}

func (tree *Tree) Exists(value int) (bool, *Node) {
	return search(tree.root, value)
}

// Find the left most node
func minValue(node *Node) int {
	if node.left == nil {
		return node.value
	}

	return minValue(node.right)
}

func changeLinks(parent *Node, node *Node) {
	if parent.left == node {
		if node.left != nil {
			parent.left = node.left
		} else {
			parent.left = node.right
		}
	} else if parent.right == node {
		if node.left != nil {
			parent.right = node.left
		} else {
			parent.right = node.right
		}
	}
}

func del(node *Node, parent *Node, value int) bool {
	switch {
	case node.value == value:
		if node.left != nil && node.right != nil {
			node.value = minValue(node.right)
			return del(node.right, node, node.value)
		}
		changeLinks(parent, node)
		return true
	case node.value > value:
		if node.left == nil {
			return false
		}
		return del(node.left, node, node.value)
	case node.value < value:
		if node.right == nil {
			return false
		}
		return del(node.right, node, node.value)
	}

	return false
}

func (tree *Tree) Delete(value int) bool {
	res, _ := tree.Exists(value)
	if !res || tree.root == nil {
		return false
	}

	if tree.root.value == value {
		tmpRoot := &Node{nil, nil, 0}
		tmpRoot.left = tree.root
		res := del(tree.root, tmpRoot, value)
		tree.root = tmpRoot.left

		if res {
			tree.size--
		}

		return res
	}

	if del(tree.root.left, tree.root, value) || del(tree.root.right, tree.root, value) {
		tree.size--
		return true
	}

	return false
}
