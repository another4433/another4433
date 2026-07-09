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