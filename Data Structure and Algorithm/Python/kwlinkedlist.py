class KWLinkedList:
    class Node:
        def __init__(self, data):
            self.data = data
            self.next = None
            self.prev = None

    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0 

    def add(self, data):
        new_node = self.Node(data)
        if self.head is None:
            self.head = new_node
            self.tail = new_node
        elif self.head == self.tail:
            new_node.prev = self.head = self.tail
            self.head.next, self.tail.next = new_node
            self.tail = new_node
        else:
            new_node.prev = self.tail
            self.tail.next = new_node
            self.tail = new_node
        self.size += 1

    def remove(self, data):
        current = self.head
        while current is not None:
            if current.data == data:
                if current.prev is not None:
                    current.prev.next = current.next
                else:
                    self.head = current.next
                if current.next is not None:
                    current.next.prev = current.prev
                else:
                    self.tail = current.prev
                self.size -= 1
                return True
            current = current.next
        return False
    
    def getSize(self):
        return self.size
    
    def get(self, index):
        if index < 0 or index >= self.size:
            return "Index out of bounds"
        current = self.head
        for _ in range(index):
            current = current.next
        return current.data
    
    def search(self, data):
        current = self.head
        index = 0
        while current is not None:
            if current.data == data:
                return index
            current = current.next
            index += 1
        return -1
    
    def sort(self):
        if self.size < 2:
            return
        current = self.head
        while current is not None:
            next_node = current.next
            while next_node is not None:
                if current.data > next_node.data:
                    current.data, next_node.data = next_node.data, current.data
                next_node = next_node.next
            current = current.next

    def set(self, index, data):
        if index < 0 or index >= self.size:
            return "Index out of bounds"
        current = self.head
        for _ in range(index):
            current = current.next
        current.data = data

    def replace(self, old_data, new_data):
        current = self.head
        while current is not None:
            if current.data == old_data:
                current.data = new_data
                return True
            current = current.next
        return False
    
    def indexOf(self, data):
        current = self.head
        index = 0
        while current is not None:
            if current.data == data:
                return index
            current = current.next
            index += 1
        return -1
    
    def clear(self):
        self.head = None
        self.tail = None
        self.size = 0

    def isEmpty(self):
        return self.size == 0
    
    def print(self):
        current = self.head
        while current is not None:
            print(current.data, end=" ")
            current = current.next
        print()