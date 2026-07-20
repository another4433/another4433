import random as r
from linkedqueue import LinkedQueue
from linkedstack import LinkedStack
from kwarraylist import KWArrayList

class TheGraph:
    class Node:
        def __init__(self, value):
            self.value = value
            self.edges = [None] * 4  # Initialize with 4 None edges

    def __init__(self):
        self.nodes = None

    def insert(self, value):
        new_node = self.Node(value)
        if self.nodes is None:
            self.nodes = new_node
        else:
            current = self.nodes
            while True:
                direction = r.randint(0, 3)  # Randomly choose a direction (0-3)
                if current.edges[direction] is None:
                    current.edges[direction] = new_node
                    break
                else:
                    current = current.edges[direction]

    def display(self):
        if self.nodes is None:
            print("The graph is empty.")
            return

        visited = LinkedStack()
        queue = LinkedQueue()
        queue.enqueue(self.nodes)

        while not queue.isEmpty():
            current = queue.dequeue()
            if current in visited:
                continue
            visited.push(current)
            print(f"Node Value: {current.value}, Edges: {[edge.value if edge else None for edge in current.edges]}")
            for edge in current.edges:
                if edge is not None and edge not in visited:
                    queue.enqueue(edge)

    def search(self, value):
        if self.nodes is None:
            return False

        visited = LinkedStack()
        queue = LinkedQueue()
        queue.enqueue(self.nodes)

        while not queue.isEmpty():
            current = queue.dequeue()
            if current in visited:
                continue
            visited.push(current)
            if current.value == value:
                while not visited.isEmpty():
                    visited.pop()  # Clear the visited stack
                return True
            for edge in current.edges:
                if edge is not None and edge not in visited:
                    queue.enqueue(edge)

        while not visited.isEmpty():
            visited.pop()  # Clear the visited stack after the search
        return False
    
    def get_random_node(self):
        if self.nodes is None:
            return None

        visited = LinkedStack()
        queue = LinkedQueue()
        queue.enqueue(self.nodes)
        all_nodes = []

        while not queue.isEmpty():
            current = queue.dequeue()
            if current in visited:
                continue
            visited.push(current)
            all_nodes.append(current)
            for edge in current.edges:
                if edge is not None and edge not in visited:
                    queue.enqueue(edge)

        while not visited.isEmpty():
            visited.pop()  # Clear the visited stack after the search
        return r.choice(all_nodes) if all_nodes else None
    
    def remove(self, value):
        if self.nodes is None:
            return False

        visited = LinkedStack()
        queue = LinkedQueue()
        queue.enqueue(self.nodes)
        parent_map = {self.nodes: None}

        while not queue.isEmpty():
            current = queue.dequeue()
            if current in visited:
                continue
            visited.push(current)

            if current.value == value:
                # Remove the node by updating the parent's edge
                parent = parent_map[current]
                if parent is not None:
                    for i in range(4):
                        if parent.edges[i] == current:
                            parent.edges[i] = None
                            break
                else:
                    # If the node to remove is the root node
                    self.nodes = None
                while not visited.isEmpty():
                    visited.pop()  # Clear the visited stack after the search
                return True

            for edge in current.edges:
                if edge is not None and edge not in visited:
                    queue.enqueue(edge)
                    parent_map[edge] = current

        while not visited.isEmpty():
            visited.pop()  # Clear the visited stack after the search
        return False
    
    def count_nodes(self):
        if self.nodes is None:
            return 0

        visited = LinkedStack()
        queue = LinkedQueue()
        queue.enqueue(self.nodes)
        count = 0

        while not queue.isEmpty():
            current = queue.dequeue()
            if current in visited:
                continue
            visited.push(current)
            count += 1
            for edge in current.edges:
                if edge is not None and edge not in visited:
                    queue.enqueue(edge)

        while not visited.isEmpty():
            visited.pop()  # Clear the visited stack after the search
        return count
    
    def findShortestPath(self, start_value, end_value):
        if self.nodes is None:
            return None

        current = self.nodes
        while current is not None and current.value != start_value:
            if current.value != start_value:
                for edge in current.edges:
                    if edge is not None:
                        current = edge
                        if current.value == start_value:
                            break
                else:
                    return None  # Start value not found
                
        visited = LinkedStack()
        queue = LinkedQueue()
        count1 = 0
        final_list = KWArrayList()
        
        while current is not None:
            visited.push(current)
            if current.value == end_value:
                while not visited.isEmpty():
                    queue.enqueue(visited.pop())
                    count1 += 1
                current = None  # Exit the loop after finding the end value
                break
            else:
                theIndex = r.randint(0, 3)
                if current.edges[theIndex] is not None:
                    current = current.edges[theIndex]
                else:
                    # If the randomly chosen edge is None or already visited, try other edges
                    for edge in current.edges:
                        if edge is not None and edge not in visited:
                            current = edge
                            break
                        else:
                            # If no unvisited edges are found, backtrack
                            if not visited.isEmpty():
                                current = visited.pop()
                            else:
                                break  # No path found

        other_queue = LinkedQueue()
        count2 = 0

        current = self.nodes 
        while current is not None and current.value != start_value:
            if current.value != start_value:
                for edge in current.edges:
                    if edge is not None:
                        current = edge
                        if current.value == start_value:
                            break
                else:
                    return None  # Start value not found
                
        while current is not None:
            visited.push(current)
            if current.value == end_value:
                while not visited.isEmpty():
                    other_queue.enqueue(visited.pop())
                    count2 += 1
                current = None  # Exit the loop after finding the end value
                break
            else:
                theIndex = r.randint(0, 3)
                if current.edges[theIndex] is not None:
                    current = current.edges[theIndex]
                else:
                    # If the randomly chosen edge is None or already visited, try other edges
                    for edge in current.edges:
                        if edge is not None and edge not in visited:
                            current = edge
                            break
                        else:
                            # If no unvisited edges are found, backtrack
                            if not visited.isEmpty():
                                current = visited.pop()
                            else:
                                break  # No path found
        
        if count2 < count1:
            while not other_queue.isEmpty():
                final_list.add(other_queue.dequeue())
        else: 
            while not queue.isEmpty():
                final_list.add(queue.dequeue())
        return final_list.theList
    
    def shortestPathLength(self, start_value, end_value):
        path = self.findShortestPath(start_value, end_value)
        if path is not None:
            return len(path) - 1  # Length of the path is number of edges
        else:
            return -1  # Return -1 if no path exists
        
    def shortestPath(self, value):
        if self.nodes is None:
            return []

        visited = LinkedStack()
        queue = LinkedQueue()
        queue.enqueue((self.nodes, [self.nodes.value]))  # Store the path along with the node

        while not queue.isEmpty():
            current, path = queue.dequeue()
            if current in visited:
                continue
            visited.push(current)

            if current.value == value:
                while not visited.isEmpty():
                    visited.pop()  # Clear the visited stack
                return path

            for edge in current.edges:
                if edge is not None and edge not in visited:
                    queue.enqueue((edge, path + [edge.value]))

        while not visited.isEmpty():
            visited.pop()  # Clear the visited stack
        return []  # Return an empty list if no path exists