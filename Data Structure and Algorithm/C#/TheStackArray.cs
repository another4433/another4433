using System;

public class TheStackArray<E> where E : class
{
	int topOfStack, capacity;
	E[] arrayStack;

    public TheStackArray()
	{
		capacity = 100;
		arrayStack = new E[capacity];
		topOfStack = -1;
	}

    public TheStackArray(int initialCapacity)
    {
        capacity = (initialCapacity < 1) ? 100 : initialCapacity;
        arrayStack = new E[capacity];
        topOfStack = -1;
    }

    public int TopOfTheStack()
    {
        return topOfStack;
    }
    public bool IsFull()
    {
        return topOfStack == capacity-1;
    }
    public bool IsEmpty()
    {
        return topOfStack == -1;
    }
    public void reallocate()
    {
        capacity *= 2;
        E[] newList = new E[capacity];
        Array.Copy(arrayStack, newList, Size());
        arrayStack = newList;
    }
    public void Push(E item)
    {
        if (IsFull())
        {
            reallocate();
        }
        arrayStack[++topOfStack] = item;
    }
    public E Pop()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("Stack is empty");
        }
        E item = arrayStack[topOfStack];
        arrayStack[topOfStack--] = null; // Clear reference for garbage collection
        return item;
    } 
    public E Peek()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("Stack is empty");
        }
        return arrayStack[topOfStack];
    }
    public int PeekIndex()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("Stack is empty");
        }
        return topOfStack;
    }
    public void Clear()
    {
        for (int i = 0; i <= topOfStack; i++)
        {
            arrayStack[i] = null;
        }
        topOfStack = -1;
    }
    public void Print()
    {
        for (int i = 0; i <= topOfStack; i++)
        {
            Console.WriteLine(arrayStack[i]);
        }
    }
}
