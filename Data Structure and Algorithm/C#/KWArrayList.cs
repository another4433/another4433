using System;

public class KWArrayList<E> where E : class
{
	int size, capacity;
	E[] theList;

    public KWArrayList()
	{
		capacity = 100;
		theList = new E[capacity];
		size = 0;
	}

    public KWArrayList(int initialCapacity)
    {
        capacity = (initialCapacity < 1) ? 100 : initialCapacity;
        theList = new E[capacity];
        size = 0;
    }

    public int Size()
    {
        return size;
    }
    public bool IsFull()
    {
        return size == capacity-1;
    }
    public bool Range(int index)
    {
        return index >= 0 && index < size;
    }
    public E Get(int index)
    {
        if (!Range(index))
        {
            throw new IndexOutOfRangeException("Index out of range");
        }
        return theList[index];
    }
    public void reallocate()
    {
        capacity *= 2;
        E[] newList = new E[capacity];
        Array.Copy(theList, newList, size);
        theList = newList;
    }
    public void Add(E item)
    {
        if (IsFull())
        {
            reallocate();
        }
        theList[size] = item;
        size++;
    }
    public bool Contains(E item)
    {
        for (int i = 0; i < size; i++)
        {
            if (theList[i].Equals(item))
            {
                return true;
            }
        }
        return false;
    }
    public void Remove(E item)
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("List is empty");
        }
        for (int i = 0; i < size; i++)
        {
            if (theList[i].Equals(item))
            {
                for (int j = i; j < size - 1; j++)
                {
                    theList[j] = theList[j + 1];
                }
                theList[size - 1] = null;
                size--;
                return;
            }
        }
    }
    public void Clear()
    {
        for (int i = 0; i < size; i++)
        {
            theList[i] = null;
        }
        size = 0;
    }
    public void Print()
    {
        for (int i = 0; i < size; i++)
        {
            Console.WriteLine(theList[i]);
        }
    }
    public void Sort()
    {
        Array.Sort(theList, 0, size);
    }
    public void Reverse()
    {
        Array.Reverse(theList, 0, size);
    }
    public int IndexOf(E item)
    {
        for (int i = 0; i < size; i++)
        {
            if (theList[i].Equals(item))
            {
                return i;
            }
        }
        return -1;
    }
    public int LastIndexOf(E item)
    {
        for (int i = size - 1; i >= 0; i--)
        {
            if (theList[i].Equals(item))
            {
                return i;
            }
        }
        return -1;
    }
    public int Capacity()
    {
        return capacity;
    }
    public int Count()
    {
        return Size();
    }
    public bool IsEmpty()
    {
        return size == 0;
    }
    public bool Remove()
    {
        if (IsEmpty())
        {
            return false;
        }
        theList[size] = null;
        size--;
        return true;
    }
    public void TrimToSize()
    {
        if (size < capacity)
        {
            E[] newList = new E[size];
            Array.Copy(theList, newList, size);
            theList = newList;
            capacity = size;
        }
    }
    public void Set(int index, E item)
    {
        if (index < 0 || index >= size)
        {
            throw new IndexOutOfRangeException("Index out of range");
        }
        theList[index] = item;
    }
    public int Search(E item)
    {
        return IndexOf(item);
    }
    public bool RemoveAt(int index)
    {
        if (!Range(index))
        {
            throw new IndexOutOfRangeException("Index out of range");
        }
        for (int i = index; i < size - 1; i++)
        {
            theList[i] = theList[i + 1];
        }
        theList[size - 1] = null;
        size--;
        return true;
    }
    public bool RemoveAll(E item)
    {
        bool removed = false;
        for (int i = 0; i < size; i++)
        {
            if (theList[i].Equals(item))
            {
                RemoveAt(i);
                i--;
                removed = true;
            }
        }
        return removed;
    }
    public bool RetainAll(E[] items)
    {
        bool modified = false;
        for (int i = 0; i < size; i++)
        {
            if (Array.IndexOf(items, theList[i]) == -1)
            {
                RemoveAt(i);
                i--;
                modified = true;
            }
        }
        return modified;
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
    public bool AddAll(E[] items)
    {
        foreach (E item in items)
        {
            Add(item);
        }
        return true;
    }
    public bool Replace(E itemOld, E itemNew)
    {
        int index = IndexOf(itemOld);
        if (index != -1)
        {
            Set(index, itemNew);
            return true;
        }
        return false;
    }
}
