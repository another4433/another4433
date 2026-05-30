using System;

public class TheStack<E>
{
	E[] stack;
	int top, size;
    public TheStack()
	{
		stack = new E[100];
		top = -1;
		size = 0;
    }
	public void Push(E data)
	{
		if (size == stack.Length)
		{
			Reallocate();
        }
		top++;
		stack[top] = data;
		size++;
    }
	public void Clear()
	{
		top = -1;
		size = 0;
		stack = new E[1];
    }
	public E Pop()
	{
		if (size == 0)
		{
			Console.WriteLine("Stack is empty");
			return default(E)!;
        }
		E data = stack[top];
		top--;
		size--;
		return data;
    }
	public void Reallocate()
	{
		E[] newStack = new E[stack.Length * 2];
		for (int i = 0; i < stack.Length; i++)
		{
			newStack[i] = stack[i];
		}
		stack = newStack;
    }
	public E Peek()
	{
		if (size == 0)
		{
			Console.WriteLine("Stack is empty");
			return default(E)!;
		}
		return stack[top];
    }
}
