class ArrayQueue:
    def __init__(self):
        self.capacity = 100
        self.queue = [None] * self.capacity
        self.size = 0
        self.front = 0
        self.rear = -1

    def enqueue(self, item):
        if self.size < self.capacity or self.rear < self.capacity:
            self.rear = self.rear + 1
            self.queue[self.rear] = item
            self.size += 1
        else:
            self.reallocate()

    def dequeue(self):
        if not self.isEmpty():
            item = self.queue[self.front]
            self.queue[self.front] = None
            self.front = (self.front + 1) % self.capacity
            self.size -= 1
            return item
        else:
            return "dequeue from empty queue"

    def isEmpty(self):
        return self.size == 0

    def peek(self):
        return self.queue[self.front]

    def reallocate(self):
        self.capacity *= 2
        new_queue = [None] * self.capacity
        for i in range(self.size):
            new_queue[i] = self.queue[(self.front + i) % (self.capacity // 2)]
        self.queue = new_queue
        self.front = 0
        self.rear = self.size - 1