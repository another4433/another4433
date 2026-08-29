using System;

public class TheTree<E> where E : class
{
	internal class Node<E>
    {
        public E data;
        public Node<E> left, right;
        public Node(E data)
        {
            this.data = data;
            this.left = null;
            this.right = null;
        }
    }

    Node<E> root;

    public TheTree()
	{
        root = null;
	}

    public bool IsEmpty()
    {
        return root == null;
    }
    public bool Insert(E item)
    {
        Random random = new Random();
        Node<E> newNode = new Node<E>(item);
        Node<E> current = root;
        int selector = random.Next(0, 2);
        if (IsEmpty())
        {
            root = newNode;
            return true;
        }
        while (current != null)
        {
            if (selector == 0)
            {
                if (current.left == null)
                {
                    current.left = newNode;
                    return true;
                }
                current = current.left;
            }
            else
            {
                if (current.right == null)
                {
                    current.right = newNode;
                    return true;
                }
                current = current.right;
            }
        }
        return false;
    }
    public bool Remove(E item)
    {
        Node<E> current = root;
        Node<E> parent = null;

        while (current != null)
        {
            if (item.Equals(current.data))
            {
                // Node to be removed found
                if (current.left == null && current.right == null)
                {
                    // Leaf node
                    if (parent == null)
                        root = null;
                    else if (parent.left == current)
                        parent.left = null;
                    else
                        parent.right = null;
                }
                else if (current.left == null || current.right == null)
                {
                    // Node with one child
                    Node<E> child = current.left ?? current.right;
                    if (parent == null)
                        root = child;
                    else if (parent.left == current)
                        parent.left = child;
                    else
                        parent.right = child;
                }
                else
                {
                    // Node with two children
                    Node<E> successor = FindMin(current.right);
                    E successorData = successor.data;
                    Remove(successorData);
                    current.data = successorData;
                }
                return true;
            }
            parent = current;
            if (item.GetHashCode() < current.data.GetHashCode())
                current = current.left;
            else
                current = current.right;
        }
        return false;
    }
    public Node<E> FindMin(Node<E> node)
    {
        while (node.left != null)
            node = node.left;
        return node;
    }
    public void Clear()
    {
        root = null;
    }
    private void PrintInOrder(Node<E> node)
    {
        if (node != null)
        {
            PrintInOrder(node.left);
            Console.WriteLine(node.data);
            PrintInOrder(node.right);
        }
    }
    private void PrintPreOrder(Node<E> node)
    {
        if (node != null)
        {
            Console.WriteLine(node.data);
            PrintPreOrder(node.left);
            PrintPreOrder(node.right);
        }
    }
    private void PrintPostOrder(Node<E> node)
    {
        if (node != null)
        {
            PrintPostOrder(node.left);
            PrintPostOrder(node.right);
            Console.WriteLine(node.data);
        }
    }
    public void Print()
    {
        PrintInOrder();
        PrintPreOrder();
        PrintPostOrder();
    }
    public Node<E> GetRoot()
    {
        return root;
    }
    public int Count()
    {
        return CountNodes(GetRoot());
    }
    private int CountNodes(Node<E> node)
    {
        if (node == null)
            return 0;
        return 1 + CountNodes(node.left) + CountNodes(node.right);
    }
    public int Height()
    {
        return GetHeight(GetRoot());
    }
    private int GetHeight(Node<E> node)
    {
        if (node == null)
            return -1;
        return 1 + Math.Max(GetHeight(node.left), GetHeight(node.right));
    }
    public string TheData()
    {
        return CollectingDatas(GetRoot());
    }
    private string CollectingDatas(Node<E> node)
    {
        if (node == null)
            return string.Concat(" ");
        return string.Concat(CollectingDatas(node.left), node.data.ToString(), " ", CollectingDatas(node.right));
    }
    public bool Contains(E item)
    {
        return ContainsNode(GetRoot(), item);
    }
    private bool ContainsNode(Node<E> node, E item)
    {
        if (node == null)
            return false;
        if (item.Equals(node.data))
            return true;
        return ContainsNode(node.left, item) || ContainsNode(node.right, item);
    }
    public Node<E> Find(E item)
    {
        return FindNode(GetRoot(), item);
    }
    private Node<E> FindNode(Node<E> node, E item)
    {
        if (node == null)
            return null;
        if (item.Equals(node.data))
            return node;
        Node<E> leftResult = FindNode(node.left, item);
        if (leftResult != null)
            return leftResult;
        return FindNode(node.right, item);
    }
    public void TraverseInOrder(Action<E> action)
    {
        TraverseInOrder(GetRoot(), action);
    }
    private void TraverseInOrder(Node<E> node, Action<E> action)
    {
        if (node != null)
        {
            TraverseInOrder(node.left, action);
            action(node.data);
            TraverseInOrder(node.right, action);
        }
    }
    public void TraversePreOrder(Action<E> action)
    {
        TraversePreOrder(GetRoot(), action);
    }
    private void TraversePreOrder(Node<E> node, Action<E> action)
    {
        if (node != null)
        {
            action(node.data);
            TraversePreOrder(node.left, action);
            TraversePreOrder(node.right, action);
        }
    }
    public void TraversePostOrder(Action<E> action)
    {
        TraversePostOrder(GetRoot(), action);
    }
    private void TraversePostOrder(Node<E> node, Action<E> action)
    {
        if (node != null)
        {
            TraversePostOrder(node.left, action);
            TraversePostOrder(node.right, action);
            action(node.data);
        }
    }
    public void PrintInOrder()
    {
        PrintInOrder(GetRoot());
    }
    public void PrintPreOrder()
    {
        PrintPreOrder(GetRoot());
    }
    public void PrintPostOrder()
    {
        PrintPostOrder(GetRoot());
    }
    public int CountLeft()
    {
        return CountLeftNodes(GetRoot());
    }
    private int CountLeftNodes(Node<E> node)
    {
        if (node == null)
            return 0;
        int count = 0;
        if (node.left != null)
            count++;
        return count + CountLeftNodes(node.left) + CountLeftNodes(node.right);
    }
}
