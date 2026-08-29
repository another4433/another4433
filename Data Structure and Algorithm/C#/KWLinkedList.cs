using System;

public class KWLinkedList<E> where E : class
{
	internal class Node<E>
    {
        public E data;
        public Node<E> next, prev;
        public Node(E data)
        {
            this.data = data;
            this.next = null;
            this.prev = null;
        }
    }

    Node<E> head, tail;
    int size;

    public KWLinkedList()
	{
        head = null; tail = null;
        size = 0;
	}

    public bool IsEmpty()
    {
        return size == 0 && head == null && tail == null;
    }
    public bool IsFull()
    {
        return head == tail;
    }
    public int Size()
    {
        return size;
    }
    public void Add(E item)
    {
        Node<E> newNode = new Node<E>(item);
        if (IsEmpty())
        {
            head = newNode;
            tail = newNode;
        }
        else if (IsFull())
        {
            head.next = newNode;
            tail.next = newNode;
            newNode.prev = head;
            newNode.prev = tail;
            tail = newNode;
            head.next = tail;
            tail.prev = head;
        }
        else
        {
            tail.next = newNode;
            newNode.prev = tail;
            tail = newNode;
        }
        size++;
    }
    public void Remove(E item)
    {
        Node<E> current = head;
        while (current != null)
        {
            if (current.data.Equals(item))
            {
                if (current.prev != null)
                {
                    current.prev.next = current.next;
                }
                else
                {
                    head = current.next;
                }
                if (current.next != null)
                {
                    current.next.prev = current.prev;
                }
                else
                {
                    tail = current.prev;
                }
                size--;
                return;
            }
            current = current.next;
        }
    }
    public void Print()
    {
        Node<E> current = head;
        while (current != null)
        {
            Console.WriteLine(current.data);
            current = current.next;
        }
    }
    public void Clear()
    {
        head = null;
        tail = null;
        size = 0;
    }
    public bool Contains(E item)
    {
        Node<E> current = head;
        while (current != null)
        {
            if (current.data.Equals(item))
            {
                return true;
            }
            current = current.next;
        }
        return false;
    }
    public int IndexOf(E item)
    {
        Node<E> current = head;
        int count = 0;
        while (current != null)
        {
            if (current.data.Equals(item))
            {
                return count;
            }
            current = current.next;
            count++;
        }
        return -1;
    }
    public void Sort()
    {
        if (size <= 1)
        {
            return;
        }
        Node<E> current = head;
        while (current != null)
        {
            Node<E> minNode = current;
            Node<E> nextNode = current.next;
            while (nextNode != null)
            {
                if (Comparer<E>.Default.Compare(nextNode.data, minNode.data) < 0)
                {
                    minNode = nextNode;
                }
                nextNode = nextNode.next;
            }
            if (!minNode.Equals(current))
            {
                E temp = current.data;
                current.data = minNode.data;
                minNode.data = temp;
            }
            current = current.next;
        }
    }
    public void Reverse()
    {
        Node<E> current = head;
        Node<E> temp = null;
        while (current != null)
        {
            temp = current.prev;
            current.prev = current.next;
            current.next = temp;
            current = current.prev;
        }
        if (temp != null)
        {
            head = temp.prev;
        }
    }
    public E Get(int index)
    {
        if (index < 0 || index >= size)
        {
            throw new IndexOutOfRangeException();
        }
        Node<E> current = head;
        for (int i = 0; i < index; i++)
        {
            current = current.next;
        }
        return current.data;
    }
    public void Set(int index, E item)
    {
        if (index < 0 || index >= size)
        {
            throw new IndexOutOfRangeException();
        }
        Node<E> current = head;
        for (int i = 0; i < index; i++)
        {
            current = current.next;
        }
        current.data = item;
    }
    public void Add(int index, E item)
    {
        if (index < 0 || index > size)
        {
            throw new IndexOutOfRangeException();
        }
        Node<E> newNode = new Node<E>(item);
        if (index == 0)
        {
            newNode.next = head;
            if (head != null)
            {
                head.prev = newNode;
            }
            head = newNode;
            if (tail == null)
            {
                tail = newNode;
            }
        }
        else if (index == size)
        {
            tail.next = newNode;
            newNode.prev = tail;
            tail = newNode;
        }
        else
        {
            Node<E> current = head;
            for (int i = 0; i < index; i++)
            {
                current = current.next;
            }
            newNode.next = current;
            newNode.prev = current.prev;
            current.prev.next = newNode;
            current.prev = newNode;
        }
        size++;
    }
    public void PrintReverse()
    {
        Node<E> current = tail;
        while (current != null)
        {
            Console.WriteLine(current.data);
            current = current.prev;
        }
    }
    public void RemoveAll(E item)
    {
        Node<E> current = head;
        while (current != null)
        {
            if (current.data.Equals(item))
            {
                Node<E> toRemove = current;
                if (toRemove.prev != null)
                {
                    toRemove.prev.next = toRemove.next;
                }
                else
                {
                    head = toRemove.next;
                }
                if (toRemove.next != null)
                {
                    toRemove.next.prev = toRemove.prev;
                }
                else
                {
                    tail = toRemove.prev;
                }
                size--;
            }
            current = current.next;
        }
    }
    public int LastIndexOf(E item)
    {
        Node<E> current = tail;
        int count = size - 1;
        while (current != null)
        {
            if (current.data.Equals(item))
            {
                return count;
            }
            current = current.prev;
            count--;
        }
        return -1;
    }
    public void RemoveFirst()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("List is empty.");
        }
        head = head.next;
        if (head != null)
        {
            head.prev = null;
        }
        else
        {
            tail = null;
        }
        size--;
    }
    public void RemoveLast()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("List is empty.");
        }
        tail = tail.prev;
        if (tail != null)
        {
            tail.next = null;
        }
        else
        {
            head = null;
        }
        size--;
    }
    public E GetFirst()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("List is empty.");
        }
        return head.data;
    }
    public E GetLast()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("List is empty.");
        }
        return tail.data;
    }
    public int Count()
    {
        return size;
    }
    public void AddFirst(E item)
    {
        Node<E> newNode = new Node<E>(item);
        if (IsEmpty())
        {
            head = newNode;
            tail = newNode;
        }
        else
        {
            newNode.next = head;
            head.prev = newNode;
            head = newNode;
        }
        size++;
    }
    public void AddLast(E item)
    {
        Node<E> newNode = new Node<E>(item);
        if (IsEmpty())
        {
            head = newNode;
            tail = newNode;
        }
        else
        {
            tail.next = newNode;
            newNode.prev = tail;
            tail = newNode;
        }
        size++;
    }
    public void RemoveAt(int index)
    {
        if (index < 0 || index >= size)
        {
            throw new IndexOutOfRangeException();
        }
        Node<E> current = head;
        for (int i = 0; i < index; i++)
        {
            current = current.next;
        }
        if (current.prev != null)
        {
            current.prev.next = current.next;
        }
        else
        {
            head = current.next;
        }
        if (current.next != null)
        {
            current.next.prev = current.prev;
        }
        else
        {
            tail = current.prev;
        }
        size--;
    }
    public void ClearAll()
    {
        head = null;
        tail = null;
        size = 0;
    }
    public int Search(E item)
    {
        Node<E> current = tail;
        int count = size;
        while (current != null && current.prev != null && count > 0)
        {
            if (current.data.Equals(item))
            {
                return count;
            }
            current = current.prev;
            count--;
        }
        return -1;
    }
    public bool ContainsAll(E[] items)
    {
        foreach (E item in items)
        {
            if (!Contains(item))
            {
                return false;
            }
        }
        return true;
    }
    public void RetainAll(E[] items)
    {
        Node<E> current = head;
        while (current != null)
        {
            if (Array.IndexOf(items, current.data) == -1)
            {
                Node<E> toRemove = current;
                if (toRemove.prev != null)
                {
                    toRemove.prev.next = toRemove.next;
                }
                else
                {
                    head = toRemove.next;
                }
                if (toRemove.next != null)
                {
                    toRemove.next.prev = toRemove.prev;
                }
                else
                {
                    tail = toRemove.prev;
                }
                size--;
            }
            current = current.next;
        }
    }
    public bool Replace(E oldItem, E newItem)
    {
        Node<E> current = head;
        while (current != null)
        {
            if (current.data.Equals(oldItem))
            {
                current.data = newItem;
                return true;
            }
            current = current.next;
        }
        return false;
    }
}
