import random


class Tree:
    class Node:
        left = None
        data = None
        right = None

        def __init__(self, data):
            self.left = None
            self.data = data
            self.right = None

        def getData(self):
            return self.data
    root = None

    def __init__(self, data):
        self.root = Tree.Node(data)

    def add(self, item):
        current = self.root
        after = self.root
        selector = random.Random()
        while not (after is None):
            current = after
            index = selector.randint(0, 2)
            if index == 0:
                after = after.left
            else:
                after = after.right
        location = selector.randint(0, 2)
        if location == 0:
            current.left = item
        else:
            current.right = item

    @staticmethod
    def leaf(node):
        return (node.left is None and node.right is None) and not (node is None)

    def Root(self, node):
        return node == self.root

    def getLeftSubTree(self):
        return self.root.left

    def getRightSubTree(self):
        return self.root.right

    def getRoot(self):
        return self.root

    def count(self, node):
        if node is None:
            return 0
        else:
            return 1+self.count(node.left)+self.count(node.right)

    def CountElements(self):
        return self.count(self.getRoot())

    def sum(self, node):
        if node is None:
            return 0
        else:
            return node.getData()+self.sum(node.left)+self.sum(node.right)

    def TotalElementValues(self):
        return self.sum(self.getRoot())

    @staticmethod
    def max(a, b):
        if a > b:
            return a
        else:
            return b

    def maximum(self, node):
        if self.leaf(node):
            return node.getData()
        else:
            return self.maximum(self.max(self.maximum(node.left), self.maximum(node.right)))

    def MaximumElement(self):
        return self.maximum(self.getRoot())

    @staticmethod
    def min(a, b):
        if a < b:
            return a
        else:
            return b

    def minimum(self, node):
        if self.leaf(node):
            return node.getData()
        else:
            return self.minimum(self.min(self.minimum(node.left), self.minimum(node.right)))

    def MinimumElement(self):
        return self.minimum(self.getRoot())

    def multiply(self, node):
        if node is None:
            return 1
        else:
            return node.getData()*self.multiply(node.left)*self.multiply(node.right)

    def MultipliedElements(self):
        return self.multiply(self.getRoot())

    def preTravel(self, node):
        string = "\nPre-traverse: "
        string = string + node.getData() + "\t"
        self.preTravel(node.left)
        self.preTravel(node.right)
        print(string, "\n")

    def Travel(self, node):
        string = "\nIn-traverse: "
        self.Travel(node.left)
        string = string + node.getData() + "\t"
        self.Travel(node.right)
        print(string, "\n")

    def postTravel(self, node):
        string = "\nPost-traverse: "
        self.postTravel(node.left)
        self.postTravel(node.right)
        string = string + node.getData() + "\t"
        print(string, "\n")
