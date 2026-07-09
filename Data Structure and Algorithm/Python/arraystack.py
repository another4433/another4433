class ArrayStack:
    name = ""
    def __init__(self, name):
        self.name = name
        self.capacity = 100
        self.stack = [None] * self.capacity
        self.size = -1

    def push(self, item):
        if self.size < self.capacity:
            self.size += 1
            self.stack[self.size] = item
        else:
            self.reallocate()

    def pop(self):
        if not self.isEmpty():
            self.stack[self.size] = None
            self.size -= 1
            return self.stack[self.size]
        else:
            return "pop from empty stack"

    def peek(self):
        if not self.isEmpty():
            return self.stack[self.size]
        else:
            return "peek from empty stack"

    def isEmpty(self):
        return self.size == 0
    
    def getName(self):
        return self.name
    
    def reallocate(self):
        self.capacity *= 2
        new_stack = [None] * self.capacity
        for i in range(self.size + 1):
            new_stack[i] = self.stack[i]
        self.stack = new_stack