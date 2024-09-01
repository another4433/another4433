class Queue:
    def __init__(self):
        self.queue = ()
        self.front = -1
        self.back = -1

    def getFront(self):
        return self.front

    def getBack(self):
        return self.back

    def Queue(self):
        return self.Queue()

    def offer(self, item):
        self.Queue().add(item)
        if self.getFront() == -1 and not (self.Queue().get(0) is None):
            self.front = 0
        self.back = self.back + 1
        return self.Queue().get(self.getBack())

    def poll(self):
        backup = self.Queue().get(self.getFront())
        self.front = self.front + 1
        return backup

    def peek(self):
        return self.Queue().get(self.getFront())

    def display(self):
        print("\n")
        string = "List: "
        for location in range(self.getFront(), self.getBack()+1):
            if location == self.getBack():
                string = string + self.Queue().get(location)
            else:
                string = string + self.Queue().get(location) + ", "
        print(string, "\n")
