using System;

public class TheStackLinked<E> where E : class
{
	internal class Node<E>
    {
        public E data;
        public Node<E> next;
        public Node(E data)
        {
            this.data = data;
            this.next = null;
        }
    }

    Node<E> head; 
    int topOfStack;

    public TheStackLinked()
	{
        head = null;
        topOfStack = -1;
    }

    public int TopOfTheStack()
    {
        return topOfStack;
    }
    public bool IsEmpty()
    {
        return head == null;
    }
    public void Push(E item)
    {
        Node<E> newNode = new Node<E>(item);
        newNode.next = head;
        head = newNode;
        topOfStack++;
    }
    public E Pop()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("Stack is empty");
        }
        E item = head.data;
        head = head.next;
        topOfStack--;
        return item;
    }
    public E Peek()
    {
        if (IsEmpty())
        {
            throw new InvalidOperationException("Stack is empty");
        }
        return head.data;
    }
}
