class LinkedStack:
    class Node: 
        def __init__(self, data):
            self.data = data
            self.next = None

    name = ""

    def __init__(self, name):
        self.name = name
        self.top = None
        self.size = 0

    def push(self, item):
        new_node = self.Node(item)
        if self.isEmpty():
            self.top = new_node
        else: 
            new_node.next = self.top
            self.top = new_node

    def pop(self):
        if not self.isEmpty():
            data = self.top.data
            self.top = self.top.next
            return data
        else:
            return "pop from empty stack"

    def peek(self):
        if not self.isEmpty():
            return self.top.data
        else:
            return "peek from empty stack"

    def isEmpty(self):
        return self.top is None
    
    def getName(self):
        return self.name