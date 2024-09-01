from ArrayList import ArrayList


class Stack(ArrayList):
    top = -1

    def __init__(self, initial):
        super().__init__(initial)

    def getTop(self):
        return self.top

    def push(self, item):
        self.top = self.top + 1
        self.addLast(item)
        return self.get(self.getTop())

    def pop(self):
        if not self.empty_status():
            self.top = self.top - 1
        return self.deleteLast()

    def peek(self):
        return self.get(self.getTop())
