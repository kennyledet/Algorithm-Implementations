package roman_kachanovsky

import "testing"

func TestNewTree(t *testing.T) {
	if NewTree() == nil {
		t.Error("NewTree() == nil, want &pointer")
	}
}

func TestTree_Insert(t *testing.T) {
	tree := NewTree()

	for _, v := range []int{8, 3, 10, 1, 6, 4, 7, 14, 13} {
		tree.Insert(v)
	}

	if tree.root.value != 8 {
		t.Errorf("tree.root.value == %d want %d", tree.root.value, 8)
	}

	if tree.root.left.value != 3 {
		t.Errorf("tree.root.left.value == %d want %d", tree.root.left.value, 3)
	}

	if tree.root.left.left.value != 1 {
		t.Errorf("tree.root.left.left.value == %d want %d", tree.root.left.left.value, 1)
	}

	if tree.root.left.right.value != 6 {
		t.Errorf("tree.root.left.right.value == %d want %d", tree.root.left.right.value, 6)
	}

	if tree.root.left.right.left.value != 4 {
		t.Errorf("tree.root.left.right.left.value == %d want %d", tree.root.left.right.left.value, 4)
	}

	if tree.root.left.right.right.value != 7 {
		t.Errorf("tree.root.left.right.right.value == %d want %d", tree.root.left.right.right.value, 7)
	}

	if tree.root.right.value != 10 {
		t.Errorf("tree.root.right.value == %d want %d", tree.root.right.value, 10)
	}

	if tree.root.right.right.value != 14 {
		t.Errorf("tree.root.right.right.value == %d want %d", tree.root.right.right.value, 14)
	}

	if tree.root.right.right.left.value != 13 {
		t.Errorf("tree.root.right.right.left.value == %d want %d", tree.root.right.right.left.value, 13)
	}
}

func TestTree_Exists(t *testing.T) {
	tree := NewTree()

	// Check empty tree
	res, node := tree.Exists(5)

	if res {
		t.Errorf("tree.Exists(%d) == %v, %v want %v, %v", 5, res, node, false, nil)
	}

	for _, v := range []int{8, 3, 10, 1, 6, 4, 7, 14, 13} {
		tree.Insert(v)
	}

	// Check existed nodes
	for _, v := range []int{8, 3, 10, 1, 6, 4, 7, 14, 13} {
		res, node := tree.Exists(v)

		if !res || node == nil {
			t.Errorf("tree.Exists(%d) == %v, %d want %v, %d", v, res, node.value, true, v)
		}
	}

	// Check unexisted nodes
	for _, v := range []int{9, 0, 100} {
		res, node := tree.Exists(v)

		if res || node != nil {
			t.Errorf("tree.Exists(%d) == %v, %v want %v, %v", v, res, node, false, nil)
		}
	}
}

func TestTree_Root(t *testing.T) {
	tree := NewTree()

	// Check empty tree
	if tree.Root() != nil {
		t.Errorf("tree.Root() == %v want %v", tree.Root(), nil)
	}

	for _, v := range []int{8, 3, 10} {
		tree.Insert(v)
	}

	root := tree.Root()

	if root.value != 8 {
		t.Errorf("tree.Root() == %d want %d", root.value, root.value)
	}
}

func TestTree_Delete(t *testing.T) {
	tree := NewTree()

	//Check empty tree
	res := tree.Delete(5)

	if res {
		t.Errorf("tree.Delete(%d) == %v want %v", 5, res, false)
	}

	for _, v := range []int{8, 3, 10} {
		tree.Insert(v)
	}

	for _, v := range []int{8, 3, 10} {
		res := tree.Delete(v)

		if !res {
			t.Errorf("tree.Delete(%d) == %v want %v", v, res, true)
		}
	}
}

func TestTree_Size(t *testing.T) {
	tree := NewTree()

	// Check empty tree
	if tree.Size() != 0 {
		t.Errorf("tree.Size() == %d want %d", tree.Size(), 0)
	}

	for _, v := range []int{8, 3, 10} {
		tree.Insert(v)
	}

	if tree.Size() != 3 {
		t.Errorf("tree.Size() == %d want %d", tree.Size(), 3)
	}

	tree.Delete(3)

	if tree.Size() != 2 {
		t.Errorf("tree.Size() == %d want %d", tree.Size(), 2)
	}
}
