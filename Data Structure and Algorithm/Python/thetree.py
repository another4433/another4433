import random as r

class TheTree:
    class Node:
        def __init__(self, data):
            self.data = data
            self.left = None
            self.right = None

    name = ""

    def __init__(self, name):
        self.name = name
        self.root = None
        self.size = 0

    def insert(self, data):
        new_node = self.Node(data)
        if self.isEmpty():
            self.root = new_node
            self.size += 1
            return "Tree Initialized with root node"
        else:
            current = self.root
            while current != None:
                the_index = r.randint(0, 1)
                if the_index == 0:
                    if current.left is None:
                        current.left = new_node
                        self.size += 1
                        return "Item added to the left of the tree"
                    else:
                        current = current.left
                else:
                    if current.right is None:
                        current.right = new_node
                        self.size += 1
                        return "Item added to the right of the tree"
                    else:
                        current = current.right
            return "Item could not be added to the tree"
        
    def getSize(self):
        return self.size
    
    def getName(self):
        return self.name
    
    def getRoot(self):
        return self.root.data
    
    def isEmpty(self):
        return self.size == 0
    
    def getBottomRandomNode(self):
        if self.isEmpty():
            return "Tree is empty"
        else:
            current = self.root
            while current != None:
                the_index = r.randint(0, 1)
                if the_index == 0:
                    if current.left is not None:
                        current = current.left
                    else:
                        return current.data
                else:
                    if current.right is not None:
                        current = current.right
                    else:
                        return current.data
                    
    def getTopRandomNode(self):
        if self.isEmpty():
            return "Tree is empty"
        else:
            current = self.root
            the_index = r.randint(0, 1)
            if the_index == 0:
                if current.left is not None:
                    current = current.left
                    return current.data
                else:
                    return self.root.data
            else:
                if current.right is not None:
                    current = current.right
                    return current.data
                else:
                    return self.root.data
                
    def getRandomNode(self):
        if self.isEmpty():
            return "Tree is empty"
        else:
            current = self.root
            while current != None:
                the_index = r.randint(0, 1)
                if the_index == 0:
                    if current.left is not None:
                        current = current.left
                    else:
                        return current.data
                else:
                    if current.right is not None:
                        current = current.right
                    else:
                        return current.data
                    
    def BST(self, item):
        if self.isEmpty():
            return "Tree is empty"
        else:
            current = self.root
            while current != None:
                if item < current.data:
                    if current.left is not None:
                        current = current.left
                    else:
                        return False
                elif item > current.data:
                    if current.right is not None:
                        current = current.right
                    else:
                        return False
                else:
                    return True
            return False
        
    def traverse(self, node):
        if node is not None:
            print(node.data)
            self.traverse(node.left)
            self.traverse(node.right)

    def printTree(self):
        if self.isEmpty():
            return "Tree is empty"
        else:
            self.traverse(self.root)

    def getHeight(self, node):
        if node is None:
            return 0
        else:
            left_height = self.getHeight(node.left)
            right_height = self.getHeight(node.right)
            return max(left_height, right_height) + 1
        
    def deleteTree(self):
        self.root = None
        self.size = 0
        return "Tree deleted"
    
    def remove(self, item):
        if self.isEmpty():
            return "Tree is empty"
        else:
            current = self.root
            parent = None
            while current != None:
                if item < current.data:
                    parent = current
                    current = current.left
                elif item > current.data:
                    parent = current
                    current = current.right
                else:
                    if current.left is None and current.right is None:
                        if parent is None:
                            self.root = None
                        elif parent.left == current:
                            parent.left = None
                        else:
                            parent.right = None
                        self.size -= 1
                        return "Item removed from the tree"
                    elif current.left is None:
                        if parent is None:
                            self.root = current.right
                        elif parent.left == current:
                            parent.left = current.right
                        else:
                            parent.right = current.right
                        self.size -= 1
                        return "Item removed from the tree"
                    elif current.right is None:
                        if parent is None:
                            self.root = current.left
                        elif parent.left == current:
                            parent.left = current.left
                        else:
                            parent.right = current.left
                        self.size -= 1
                        return "Item removed from the tree"
                    else:
                        successor_parent = current
                        successor = current.right
                        while successor.left is not None:
                            successor_parent = successor
                            successor = successor.left
                        if successor_parent != current:
                            successor_parent.left = successor.right
                        else:
                            successor_parent.right = successor.right
                        current.data = successor.data
                        self.size -= 1
                        return "Item removed from the tree"
            return "Item not found in the tree"
        
    def countNodes(self, node):
        if node is None:
            return 0
        else:
            return 1 + self.countNodes(node.left) + self.countNodes(node.right)