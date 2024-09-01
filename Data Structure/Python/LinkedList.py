class SLL:
    @staticmethod
    class Node:
        data = None
        next = None

        def __init__(self, data):
            self.data = data
            self.next = None

        def __getitem__(self):
            return self.data

    def __init__(self):
        self.head = None
        self.size = 0

    def Size(self):
        return self.size

    def range(self, index):
        return 0 <= index < self.Size()

    def empty_status(self):
        return self.size == 0

    def __index__(self, item):
        node = self.head
        for i in range(0, self.Size()) and not (node.next is None):
            if node.__getitem__() == item:
                return i
            else:
                node = node.next
        return -1

    def search(self, item):
        return not (self.__index__(item) == -1)

    def __getitem__(self, location):
        if self.range(location):
            node = self.head
            count = 0
            while count <= location and not (node.next is None):
                node = node.next
                count = count + 1
            return node.__getitem__()

    def __add__(self, other, location):
        node = SLL.Node(other)
        if self.empty_status():
            self.head = node
            self.size = self.size + 1
            return True
        elif self.range(location):
            if location == 0:
                node.next = self.head
                self.head = node
                self.size = self.size + 1
            else:
                temp1 = self.head
                temp2 = temp1.next
                count = 0
                while count < location and not (temp1.next is None) and not (temp2 is None):
                    temp1 = temp1.next
                    temp2 = temp2.next
                temp1.next = node
                node.next = temp2
                self.size = self.size + 1
            return True
        return False

    def addFirst(self, item):
        if self.empty_status():
            self.head = SLL.Node(item)
        else:
            node = SLL.Node(item)
            node.next = self.head
            self.head = node
        self.size = self.size + 1

    def addLast(self, item):
        if self.empty_status():
            self.head = SLL.Node(item)
        else:
            temp = self.head
            node = SLL.Node(item)
            while not (temp.next is None):
                temp = temp.next
            temp.next = node
        self.size = self.size + 1

    def __delete__(self, instance):
        if self.empty_status():
            return False
        elif self.search(instance):
            location = self.__index__(instance)
            if location == 0:
                self.head = self.head.next
            else:
                temp1 = self.head
                temp2 = temp1.next
                count = 0
                while count < location and not (temp1.next is None) and (temp2.next is None):
                    temp1 = temp1.next
                    temp2 = temp2.next
                    count = count + 1
                temp1.next = temp2.next
            self.size = self.size - 1
            return True
        return False

    def deleteFirst(self):
        if self.empty_status():
            return False
        else:
            self.head = self.head.next
            self.size = self.size - 1
            return True

    def deleteLast(self):
        if self.empty_status():
            return False
        else:
            temp = self.head
            while not (temp.next is None):
                temp = temp.next
            temp.next = None
            self.size = self.size - 1
            return True


class DLL:
    @staticmethod
    class Node:
        prev = None
        data = None
        next = None

        def __init__(self, data):
            self.prev = None
            self.data = data
            self.next = None

    def __init__(self):
        self.head = DLL.Node
        self.tail = DLL.Node
        self.size = 0

    def getSize(self):
        return self.size

    def isEmpty(self):
        return self.getSize() == 0

    def isRange(self, index):
        return 0 <= index < self.getSize()

    def __getitem__(self, item):
        if self.isRange(item):
            temp = self.head
            for index in range(0, self.getSize()) and not (temp.next is None):
                if index == item:
                    return temp.data
        return -1

    def __add__(self, other, location):
        node = DLL.Node(other)
        if self.isRange(location):
            if self.isEmpty():
                self.head = node
                self.tail = node
            else:
                temp1 = self.head
                temp2 = self.tail
                for i in range(0, location) and not (temp1.next is None) and not (temp2.prev is None):
                    temp1 = temp1.next
                    temp2 = temp2.prev
                temp1.next = node
                node.prev = temp1
                temp2.prev = node
                node.next = temp2
            self.size = self.size + 1
        else:
            print("Index out of range")

    def __delete__(self, instance):
        if self.isEmpty():
            return False
        temp1 = self.head
        temp2 = temp1.next
        backup = None
        while not (temp1 is None) and not (temp2.next is None):
            if temp1.data == instance and temp1 == self.head:
                backup = self.head.data
                self.head = self.head.next
                self.size = self.size - 1
                break
            elif temp2.data == instance:
                backup = temp2.data
                temp1.next = temp2.next
                self.size = self.size - 1
                break
            else:
                temp1 = temp1.next
                temp2 = temp2.next
        return backup

    def __set__(self, index, value):
        if self.isRange(index):
            temp = self.head
            for i in range(0, index+1) and not (temp.next is None):
                temp = temp.next
            backup = temp.data
            temp.data = value
            return backup
        return False

    def __index__(self, item):
        temp = self.head
        for i in range(0, self.getSize()) and not (temp.next is None):
            if temp.data == item:
                return i
        return -1

    def replace(self, old, new):
        return self.__set__(self.__index__(old), new)

