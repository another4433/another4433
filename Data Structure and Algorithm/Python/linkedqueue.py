class LinkedQueue:
    class Node:
        def __init__(self, data):
            self.data = data
            self.next = None

    name = ""

    def __init__(self, name):
        self.name = name
        self.front = None
        self.rear = None
        self.size = 0

    def enqueue(self, item):
        new_node = self.Node(item)
        if self.isEmpty():
            self.front = new_node
            self.rear = new_node
        elif self.isFull():
            self.rear.next = new_node
            self.rear = new_node
            self.front.next = self.rear
        else:
            self.rear.next = new_node
            self.rear = new_node
        self.size += 1

    def dequeue(self):
        if not self.isEmpty():
            item = self.front.data
            self.front.data = None
            self.front = self.front.next
            if self.front is None:
                self.rear = None
            self.size -= 1
            return item
        else:
            return "dequeue from empty queue"

    def peek(self):
        if not self.isEmpty():
            return self.front.data

    def isEmpty(self):
        return self.size == 0

    def getSize(self):
        return self.size
    
    def getName(self):
        return self.name
    
    def isFull(self):
        return self.head == self.tail and self.head != None