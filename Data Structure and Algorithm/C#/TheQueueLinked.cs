using System;

public class TheQueueLinked<E> where E : class
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

    Node<E> frontOfQueue, rearOfQueue;
    int size;

    public TheQueueLinked()
	{
        frontOfQueue = null;
        rearOfQueue = null; 
        size = 0;
    }

    public int Size()
    {
        return size;
    }
    public bool IsEmpty()
    {
        return size == 0;
    }
    public bool IsFull()
    {
        return frontOfQueue == rearOfQueue;
    }
    public void Enqueue(E item)
    {
        Node<E> newNode = new Node<E>(item);
        if (IsEmpty())
        {
            frontOfQueue = newNode;
            rearOfQueue = newNode;
        }
        else if (IsFull())
        {
            frontOfQueue.next = newNode;
            rearOfQueue.next = newNode;
            newNode.prev = frontOfQueue;
            newNode.prev = rearOfQueue;
            rearOfQueue = newNode;
            frontOfQueue.next = rearOfQueue;
            rearOfQueue.prev = frontOfQueue;
        }
        else
        {
            rearOfQueue.next = newNode;
            newNode.prev = rearOfQueue;
            rearOfQueue = newNode;
        }
        size++;
    }
    public void Dequeue()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("Queue is empty");
        }
        frontOfQueue = frontOfQueue.next;
        if (frontOfQueue != null)
        {
            frontOfQueue.prev = null;
        }
        else
        {
            rearOfQueue = null; // Queue is now empty
        }
        size--;
    }
    public E Peek()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("Queue is empty");
        }
        return frontOfQueue.data;
    }
    public void DisplayQueue()
    {
        if (IsEmpty())
        {
            Console.WriteLine("Queue is empty");
            return;
        }
        Node<E> current = frontOfQueue;
        while (current != null)
        {
            Console.WriteLine(current.data);
            current = current.next;
        }
    }
}
