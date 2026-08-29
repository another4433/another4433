using System;

public class TheQueueArray<E> where E : class
{
	int frontOfQueue, rearOfQueue, capacity, size;
	E[] arrayQueue;

    public TheQueueArray()
	{
		frontOfQueue = -1;
		rearOfQueue = -1;
		capacity = 100;
		size = 0;
		arrayQueue = new E[capacity];
	}

	public TheQueueArray(int initialCapacity)
    {
        frontOfQueue = -1;
        rearOfQueue = -1;
        capacity = (initialCapacity < 1) ? 100 : initialCapacity;
        size = 0;
        arrayQueue = new E[capacity];
    }

    public int Size()
    {
        return size;
    }
    public bool IsFull()
    {
        return size == capacity;
    }
    public bool IsEmpty()
    {
        return size == 0;
    }
    public void reallocate()
    {
        capacity *= 2;
        E[] newList = new E[capacity];
        Array.Copy(arrayQueue, newList, size);
        arrayQueue = newList;
    }
    public void Enqueue(E item)
    {
        if (IsFull())
        {
            reallocate();
        }
        rearOfQueue = (rearOfQueue + 1) % capacity;
        arrayQueue[rearOfQueue] = item;
        size++;
        if (size == 1)
        {
            frontOfQueue = rearOfQueue;
        }
    }
    public E Dequeue()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("Queue is empty");
        }
        E item = arrayQueue[frontOfQueue];
        frontOfQueue = (frontOfQueue + 1) % capacity;
        size--;
        return item;
    }
    public E Peek()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("Queue is empty");
        }
        return arrayQueue[frontOfQueue];
    }
    public void DisplayQueue()
    {
        if (IsEmpty())
        {
            Console.WriteLine("Queue is empty");
            return;
        }
        Console.WriteLine("Queue elements:");
        for (int i = 0; i < size; i++)
        {
            int index = (frontOfQueue + i) % capacity;
            Console.WriteLine(arrayQueue[index]);
        }
    }
}
