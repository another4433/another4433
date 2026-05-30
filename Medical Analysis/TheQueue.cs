using System;

public class TheQueue<E>
{
    internal class TheNode<E>
    {
        private E? data;
        private TheNode<E>? next, previous;
        public TheNode(E data)
        {
            this.data = data;
            next = null;
            previous = null;
        }
        public E? Data { get => data; set => data = value; }
        public TheNode<E>? Next { get => next; set => next = value; }
        public TheNode<E>? Previous { get => previous; set => previous = value; }
    }
    private TheNode<E>? head, tail;
    int size;
    public TheQueue()
    {
        head = null;
        tail = null;
        size = 0;
    }
    public void Enqueue(E data)
    {
        TheNode<E>? newNode = new TheNode<E>(data);
        if (head == null)
        {
            head = newNode;
        }
        else if (head == tail)
        {
            head!.Next = newNode;
            newNode!.Previous = head;
        }
        else
        {
            tail!.Next = newNode;
            newNode!.Previous = tail;
        }
        tail = newNode;
        size++;
    }
    public void Clear()
    {
        head = null;
        tail = null;
        size = 0;
    }
    public E Dequeue()
    {
        if (head == null)
        {
            Console.WriteLine("Queue is empty");
            return default(E)!;
        }
        else
        {
            E? data = head.Data;
            if (head == tail)
            {
                head = null;
                tail = null;
                size = 0;
            }
            else
            {
                head = head.Next;
                if (head != null)
                {
                    head.Previous = null;
                }
                size--;
            }
            return data!;
        }
    }
    public E Peek()
    {
        if (head == null)
        {
            Console.WriteLine("Queue is empty");
            return default(E)!;
        }
        else
        {
            return head!.Data!;
        }
    }
}
