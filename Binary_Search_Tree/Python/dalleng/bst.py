
class TreeNode:
    def __init__(self, value):
        self.value = value
        self.right = None
        self.left = None


class BinarySearchTree:
    def __init__(self):
        self.root = None

    def insert(self, value):
        if self.root is None:
            self.root = TreeNode(value)
        else:
            current = self.root
            while True:
                if value <= current.value:
                    if current.left:
                        current = current.left
                    else:
                        current.left = TreeNode(value)
                        break
                else:
                    if current.right:
                        current = current.right
                    else:
                        current.right = TreeNode(value)
                        break

    @staticmethod
    def find_min(node):
        if not node:
            return None
        else:
            current = node
            parent = None
            while True:
                if current.left:
                    parent = current
                    current = current.left
                else:
                    break
            return current, parent

    def delete_node(self, node, parent):
        if node.right and node.left:
            min_node, min_parent = self.find_min(node.right)
            node.value = min_node.value
            if min_parent is None:
                min_parent = node
            self.delete_node(min_node, min_parent)
        elif node.left:
            if parent.right == node:
                parent.right = node.left
            else:
                parent.left = node.left
        elif node.right:
            if parent.right == node:
                parent.right = node.right
            else:
                parent.left = node.right
        else:
            if parent.right == node:
                parent.right = None
            else:
                parent.left = None

    def delete(self, value):
        if not self.root:
            return None
        else:
            current = self.root
            parent = None
            while True:
                if value == current.value:
                    break
                elif value <= current.value:
                    if current.left:
                        parent = current
                        current = current.left
                    else:
                        return
                else:
                    if current.right:
                        parent = current
                        current = current.right
                    else:
                        return

            self.delete_node(current, parent)

    def search(self, value):
        if not self.root:
            return None
        else:
            current = self.root
            while True:
                if value == current.value:
                    return current
                elif value <= current.value:
                    if current.left:
                        current = current.left
                    else:
                        return None
                else:
                    if current.right:
                        current = current.right
                    else:
                        return None
