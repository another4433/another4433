def min(a, b, c):
    if a < b < c:
        return a
    elif b < a < c:
        return b
    else:
        return c


def gcd(a, b):
    r = 0
    while b != 0:
        r = a % b
        a = b
        b = r
    return r


def gcd(a, b, c):
    minimum = min(a, b, c)
    while minimum != 0:
        if a % minimum and b % minimum and c % minimum:
            return minimum
        else:
            minimum = minimum - 1
    return -1


def sequential_search(array, item):
    for a in range(0, len(array)):
        if array[a] == item:
            return a
    return -1


def selection_sort(array):
    for i in range(0, len(array)-1):
        for j in range(i+1, len(array)):
            if array[i] > array[j]:
                temp = array[i]
                array[i] = array[j]
                array[j] = temp


def bubble_sort(array):
    flag = False
    for i in range(0, len(array)-1):
        for j in range(0, len(array)-i-1):
            if array[j+1] > array[j]:
                temp = array[j+1]
                array[j+1] = array[j]
                array[j] = temp
                flag = True
        if not flag:
            break


def binary_search(array, item):
    left = 0
    right = len(array)
    m = (left + right) / 2
    while m != 0:
        if array[m] == item:
            return m
        elif array[m] < item:
            left = m - 1
            m = (left + right) / 2
        else:
            right = m + 1
            m = (left + right) / 2
    return -1


def merge_sort(array):
    n = len(array)
    if n > 1:
        m = n / 2
        merge_sort(array[:m])
        merge_sort(array[m:])
        bubble_sort(array)


# I am not sure about the code of this method
# I think I made up the code by myself
def quicksort(array):
    n = len(array)
    if n > 1:
        m = n / 2
        selection_sort(array)
        quicksort(array[:m])
        quicksort(array[m:])


def max(array):
    n = len(array)
    if n <= 0:
        return -1
    if n == 1:
        return array[0]
    elif n == 2:
        if array[0] > array[1]:
            return array[0]
        else:
            return array[1]
    elif n == 3:
        if array[0] > array[1] > array[2]:
            return array[0]
        elif array[1] > array[0] > array[2]:
            return array[1]
        else:
            return array[2]
    else:
        m = n / 3
        k = (2 * n) / 3
        left = max(array[:m])
        middle = max(array[m:k])
        right = max(array[k:])
        if left > middle > right:
            return left
        elif middle > left > right:
            return middle
        else:
            return left


# To be used for heap and priority queue algorithms
class LinkedList:
    class Node:
        the_previous = None
        data = None
        the_next = None


# To be used for generating graph
class Graph:
    class Node:
        the_next = None
        data = None


# Code is similar to knapsack problem but not exactly it
# Search in the internet for the code of this algorithm
# Knapsack problem = finding the best and highest price of an item
# I wrote the code as setting higher value for each item in a multidimensional array
def knapsack_problem(multi_array):
    flag = False
    for a in range(0, len(multi_array)-1):
        for b in range(a+1, len(multi_array)):
            for c in range(a+1, len(multi_array)):
                if b != a and c != a:
                    if multi_array[b][c] < multi_array[a][c]:
                        if multi_array[b][c] < multi_array[b][a]:
                            multi_array[b][c] = multi_array[b][a]
                        else:
                            multi_array[b][c] = multi_array[a][c]
                        flag = True
        if not flag:
            break
    for i in range(0, len(multi_array)-1):
        if multi_array[0][i] < multi_array[len(multi_array)-1][i]:
            if multi_array[0][i] < multi_array[0][len(multi_array)-1]:
                multi_array[0][i] = multi_array[0][len(multi_array)-1]
            else:
                multi_array[0][i] = multi_array[len(multi_array)-1][i]
    for j in range(0, len(multi_array)-1):
        if multi_array[j][0] < multi_array[j][len(multi_array)-1]:
            if multi_array[j][0] < multi_array[len(multi_array)-1][0]:
                multi_array[j][0] = multi_array[len(multi_array)-1][0]
            else:
                multi_array[j][0] = multi_array[j][len(multi_array)-1]


# Code is similar to floyd warshall algorithm but not exactly it
# Search in the internet for this algorithm
# Floyd Warshall = finding the shortest path in the graph
def floyd(multi_array):
    flag = False
    for a in range(0, len(multi_array)-1):
        for b in range(a+1, len(multi_array)):
            for c in range(a+1, len(multi_array)):
                if b != a and c != a:
                    if multi_array[b][c] > multi_array[a][c]:
                        if multi_array[b][c] > multi_array[b][a]:
                            multi_array[b][c] = multi_array[b][a]
                        else:
                            multi_array[b][c] = multi_array[a][c]
                        flag = True
        if not flag:
            break
    for i in range(0, len(multi_array)-1):
        if multi_array[0][i] > multi_array[len(multi_array)-1][i]:
            if multi_array[0][i] > multi_array[0][len(multi_array)-1]:
                multi_array[0][i] = multi_array[0][len(multi_array)-1]
            else:
                multi_array[0][i] = multi_array[len(multi_array)-1][i]
    for j in range(0, len(multi_array)-1):
        if multi_array[j][0] > multi_array[j][len(multi_array)-1]:
            if multi_array[j][0] > multi_array[len(multi_array)-1][0]:
                multi_array[j][0] = multi_array[len(multi_array)-1][0]
            else:
                multi_array[j][0] = multi_array[j][len(multi_array)-1]


# To be used for scheduling algorithm in operating system
class Queue:
    front = -1
    rear = -1
    size = 0
    an_array = [None] * 10


# I prefer not to import library and reuse the code to create functions
# I prefer to create my own functions based on my memory of algorithms
