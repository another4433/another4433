import java.io.*;
import java.util.*;
public interface Generics<E>{
    int default_capacity = 100;
    int start = 0;
    void reallocate();
    void add(E item);
    boolean add(E item, int location);
    void addFirst(E item);
    void addLast(E item);
    E remove(E item);
    E removeFirst();
    E removeLast();
    E peek();
    E get(int index);
    int size();
    int capacity();
    int indexOf(E item);
    void display();
    boolean isEmpty();
    boolean isFull();
    boolean sort();
    void shuffle();
    int compareHalf();
    E set(int index, E item);
    void replace(E oldItem, E newItem);
    int search(E item);
}
interface IteratorList<E>{
    E next();
    E previous();
    boolean hasNext();
    boolean hasPrevious();
    int getIndex();
    int getCount();
    E get(int index);
    boolean isRange(int index);
}
@SuppressWarnings("unchecked")
class KWArrayList<E> implements Generics<E>{
    E[] theData;
    int size, capacity;
    public KWArrayList(){
        capacity = default_capacity;
        size = start;
        theData = (E[]) new Object[capacity];
    }
    public KWArrayList(int capacity){
        this.capacity = (capacity <= 0) ? default_capacity : capacity;
        size = start;
        theData = (E[]) new Object[this.capacity];
    }
    public KWArrayList(KWArrayList<E> object){
        this.capacity = object.capacity;
        this.size = object.size;
        E[] copyData = (E[]) new Object[this.capacity];
        System.arraycopy(object.theData, 0, copyData, 0, object.capacity);
        theData = copyData;
    }
    public int size(){
        return size;
    }
    public int capacity(){
        return capacity;
    }
    public boolean isEmpty(){
        return size == 0;
    }
    public boolean isFull(){
        return size == capacity;
    }
    public boolean isRange(int index){
        return index >= start && index < size();
    }
    public class myIterator implements IteratorList<E> {
        int index, count = 0;
        private myIterator(){
            index = 0;
        }
        private myIterator(int index){
            this.index = (index < 0 || index >= size) ? 0 : index;
        }
        public boolean hasNext(){
            return index < size;
        }
        public boolean hasPrevious(){
            return index > 0;
        }
        public int getIndex(){
            return index;
        }
        public int getCount(){
            return count;
        }
        public boolean isRange(int index){
            return index > 0 && index < size;
        }
        public E next(){
            if (!hasNext())
                throw new IndexOutOfBoundsException("Out of Range!");
            else if (isRange(index)){
                E item = theData[index];
                index++;
                count++;
                return item;
            }
            else
                return null;
        }
        public E previous(){
            if (!hasPrevious())
                throw new IndexOutOfBoundsException("Out of Range!");
            else if (isRange(index)){
                index--;
                count++;
                return theData[index];
            }
            else
                return null;
        }
        public E get(int index){
            if (isRange(index))
                return theData[index];
            else
                return null;
        }
    }
    public myIterator iterator(){
        return new myIterator();
    }
    public myIterator iterator(int index){
        return new myIterator(index);
    }
    public E get(int index){
        if (index < 0 || index >= size())
            return null;
        else
            return theData[index];
    }
    public int indexOf(E item){
        for (int i = start; i < size(); i++)
            if (((Comparable<E>)theData[i]).compareTo(item) == 0)
                return i;
        return -1;
    }
    public void reallocate(){
        E[] copyData = (E[]) new Object[capacity()*2];
        for (int i = start; i < size(); i++)
            copyData[i] = get(i);
        theData = copyData;
    }
    public E peek(){
        if (!isEmpty())
            return get(size()-1);
        else
            return null;
    }
    public void addLast(E item){
        if (isFull())
            reallocate();
        theData[size()] = item;
        size++;
    }
    public void addFirst(E item){
        if (isFull())
            reallocate();
        for (int i = size(); i > 0; i--)
            theData[i] = theData[i-1];
        theData[start] = item;
        size++;
    }
    public void add(E item){
        addLast(item);
    }
    public E set(int index, E item){
        if (isRange(index)){
            E data = get(index);
            theData[index] = item;
            return data;
        }
        return peek();
    }
    public boolean add(E item, int index){
        if (isFull())
            reallocate();
        if (isRange(index)){
            for (int i = size(); i > index; i--)
                theData[i] = theData[i-1];
            set(index, item);
            return get(index) == item;
        }
        return false;
    }
    public void replace(E oldItem, E newItem){
        if (search(oldItem) != -1)
            set(indexOf(oldItem), newItem);
    }
    public E remove(E item){
        if (isRange(indexOf(item))){
            E data = get(indexOf(item));
            for (int i = indexOf(item); i < size()-1; i++)
                theData[i] = get(i+1);
            size--;
            return data;
        }
        else if (isEmpty())
            return null;
        else
            return peek();
    }
    public E removeLast(){
        if (isEmpty())
            return null;
        else {
            E data = peek();
            size--;
            return data;
        }
    }
    public E removeFirst(){
        if (isEmpty())
            return null;
        else {
            E data = get(start);
            for (int i = start; i < size()-1; i++)
                theData[i] = get(i+1);
            size--;
            return data;
        }
    }
    public boolean sort(){
        if (!isEmpty()) {
            for (int i = start; i < size() - 1; i++)
                for (int j = i + 1; j < size(); j++)
                    if (((Comparable<E>)get(i)).compareTo(get(j)) > start) {
                        E temp = get(i);
                        set(i, get(j));
                        set(j, temp);
                    }
            return ((Comparable<E>)get(start)).compareTo(get(start+1)) <= start && ((Comparable<E>)get(indexOf(peek())-1)).compareTo(get(indexOf(peek()))) <= start;
        }
        else
            return isEmpty();
    }
    public void shuffle(){
        if (!isEmpty())
            for (int i = start; i < size(); i++)
                for (int j = size()-1; j >= start; j--)
                    if (i % 2 != start && j % 2 == start){
                        E temp = get(i);
                        set(i, get(j));
                        set(j, temp);
                    }
    }
    public int compareHalf(){
        int countLess = 0, countMore = 0, index = indexOf(peek()), value;
        if (!isEmpty()){
            for (int i = start; i <= size()/2; i++){
                if (((Comparable<E>)get(i)).compareTo(get(index)) > 0)
                    countMore++;
                else
                    countLess++;
            }
        }
        if (countLess == countMore)
            value = 0;
        else
            value = (countLess < countMore) ? 1 : -1;
        return value;
    }
    public int search(E item){
        myIterator iterator = iterator();
        while (iterator.hasNext()){
            E temp = iterator.next();
            if (temp != null && ((Comparable<E>) temp).compareTo(item) == start)
                return iterator.getIndex();
        }
        return -1;
    }
    public void display(){
        KWArrayList<E> copy = new KWArrayList<>(this);
        System.out.print("List: ");
        for (int i = start; i < copy.size(); i++)
            System.out.print(copy.get(i)+"  ");
        System.out.println();
    }
    public String toString(){
        StringBuilder myString = new StringBuilder();
        if (size() < 1)
            myString.append("No elements found!");
        else {
            myString.append("{").append(get(0));
            for (int i = 1; i < size(); i++)
                myString.append(", ").append(get(i));
            myString.append("}");
        }
        return myString.toString();
    }
}
@SuppressWarnings("unchecked")
class SingleLinkedList<E> implements Generics<E>{
    public static class Node<E>{
        E theData;
        Node<E> next;
        private Node(E theData){
            this.theData = theData;
            next = null;
        }
        private Node(E theData, Node<E> next){
            this.theData = theData;
            this.next = next;
        }
        protected E getTheData(){
            return theData;
        }
    }
    Node<E> head;
    int size;
    public SingleLinkedList(){
        head = null;
        size = start;
    }
    public void reallocate(){
        throw new UnsupportedOperationException("Function not supported in this class!");
    }
    public int size(){
        return size;
    }
    public boolean isEmpty(){
        return head == null;
    }
    public boolean isFull(){
        return false;
    }
    public int capacity(){
        return size();
    }
    public class LinkedIterator implements IteratorList<E>{
        int count = 0;
        Node<E> ptr;
        private LinkedIterator(){
            ptr = head;
        }
        private LinkedIterator(Node<E> node){
            ptr = node;
        }
        public boolean hasNext(){
            return ptr.next != null;
        }
        public boolean hasPrevious(){
            return false;
        }
        public int getCount(){
            return count;
        }
        public int getIndex(){
            return -1;
        }
        public boolean isRange(int index){
            return index > 0 && index < size;
        }
        public E get(int index){
            if (isRange(index)){
                ptr = head;
                for (int i = start; i < size && hasNext(); i++)
                    ptr = ptr.next;
                return ptr.getTheData();
            }
            else
                return null;
        }
        public E next(){
            if (!hasNext())
                throw new NoSuchElementException("No next item found!");
            else {
                E temp = ptr.getTheData();
                ptr = ptr.next;
                count++;
                return temp;
            }
        }
        public E previous(){
            throw new UnsupportedOperationException("There is no connection to previous item!");
        }
    }
    public LinkedIterator iterator(){
        return new LinkedIterator();
    }
    public LinkedIterator iterator(Node<E> node){
        return new LinkedIterator(node);
    }
    public E peek(){
        return head.getTheData();
    }
    public int indexOf(E item){
        if (isEmpty())
            return -1;
        LinkedIterator iterator = iterator();
        for (int i = 0; i < size() && iterator.hasNext(); i++){
            E finding = iterator.next();
            if (((Comparable<E>)finding).compareTo(item) == start)
                return i;
        }
        return -1;
    }
    public void addFirst(E item){
        if (isEmpty())
            head = new Node<>(item);
        else
            head = new Node<>(item, head);
        size++;
    }
    public void addLast(E item){
        if (isEmpty())
            head = new Node<>(item);
        else {
            LinkedIterator iterator = iterator();
            while (iterator.hasNext())
                iterator.next();
            iterator.ptr.next = new Node<>(item);
        }
        size++;
    }
    public void add(E item){
        if (isEmpty())
            head = new Node<>(item);
        else {
            Node<E> temp = head;
            while (temp.next != null)
                temp = temp.next;
            temp.next = new Node<>(item);
        }
        size++;
    }
    public boolean add(E item, int index){
        LinkedIterator iterator = iterator(head);
        if (iterator.isRange(index)){
            Node<E> temp1 = head, temp2 = head.next;
            for (int i = 0; i < index && temp1.next != null && temp2.next != null && iterator().hasNext(); i++){
                iterator.next();
                temp1 = temp1.next;
                temp2 = temp2.next;
            }
            Node<E> newNode = new Node<>(item);
            temp1.next = newNode;
            newNode.next = temp2;
            size++;
            E check = iterator.next();
            return check == temp1.getTheData() || check == temp2.getTheData() || iterator.getCount() == index;
        }
        else
            return false;
    }
    public E removeFirst(){
        if (!isEmpty()){
            E backup = peek();
            if (size() == 1)
                head = null;
            else
                head = head.next;
            size--;
            return backup;
        }
        else
            return null;
    }
    public E removeLast(){
        if (!isEmpty()){
            E backup = peek();
            LinkedIterator iterator = iterator();
            Node<E> temp = head;
            for (int i = 1; i < size() && iterator.hasNext() && temp.next != null; i++){
                backup = iterator.next();
                temp = temp.next;
            }
            temp.next = null;
            size--;
            return backup;
        }
        else
            return null;
    }
    public int search(E item){
        return indexOf(item);
    }
    public E remove(E item){
        LinkedIterator iterator = iterator();
        if (iterator.isRange(search(item))){
            E backup;
            Node<E> temp1 = head, temp2 = head.next;
            for (int i = start; i < search(item) && temp1.next != null && temp2.next != null && iterator().hasNext(); i++){
                iterator.next();
                temp1 = temp1.next;
                temp2 = temp2.next;
            }
            backup = iterator.next();
            temp1.next = temp2.next;
            size--;
            return backup;
        }
        else
            return null;
    }
    public E get(int index){
        if (index >= 0 && index < capacity()){
            Node<E> temp = head;
            for (int i = 0; i <= index && temp.next != null; i++)
                temp = temp.next;
            return temp.getTheData();
        }
        else
            return null;
    }
    public E set(int index, E item){
        LinkedIterator iterator = iterator();
        if (iterator.isRange(index)){
            E save = get(index);
            Node<E> temp = head;
            for (int i = start; i <= index && temp.next != null; i++)
                temp = temp.next;
            temp.theData = item;
            return save;
        }
        return null;
    }
    public void replace(E oldItem, E newItem){
        if (search(oldItem) != -1)
            set(indexOf(oldItem), newItem);
    }
    public boolean sort(){
        Node<E> temp1 = head, temp2;
        while (temp1.next != null){
            temp2 = temp1.next;
            while (temp2 != null){
                if (((Comparable<E>)temp2.getTheData()).compareTo(temp1.getTheData()) < start){
                    E store1 = temp1.getTheData();
                    E store2 = temp2.getTheData();
                    replace(store2, store1);
                }
                temp2 = temp2.next;
            }
            temp1 = temp1.next;
        }
        return ((Comparable<E>)peek()).compareTo(temp1.getTheData()) < start;
    }
    public void shuffle(){
        LinkedIterator iterator = iterator(head);
        Node<E> temp = head.next;
        while (temp != null && iterator.hasNext()){
            temp.theData = iterator.next();
            temp = temp.next;
        }
    }
    public int compareHalf(){
        E max1 = peek(), max2;
        Node<E> temp = head;
        LinkedIterator iterator = iterator();
        for (int i = 0; i < size()/2 && iterator.hasNext() && temp.next != null; i++){
            E check = iterator.next();
            if (((Comparable<E>)check).compareTo(max1) < start)
                max1 = check;
            temp = temp.next;
        }
        max2 = temp.getTheData();
        while (temp != null){
            if (((Comparable<E>)temp.getTheData()).compareTo(max2) < start)
                max2 = temp.getTheData();
            temp = temp.next;
        }
        int measure = start;
        if (((Comparable<E>)max2).compareTo(max1) < start)
            measure = 1;
        else if (((Comparable<E>)max1).compareTo(max2) < start)
            measure = -1;
        return measure;
    }
    public void display(){
        Node<E> temp = head;
        System.out.print(temp.getTheData());
        while (temp.next != null){
            temp = temp.next;
            System.out.print(" -> "+temp.getTheData());
        }
        System.out.println();
    }
}
class KWLinkedList<E> implements Generics<E>{
    public static class Node<E>{
        Node<E> previous;
        E theData;
        Node<E> next;
        private Node(E theData){
            next = null;
            previous = null;
            this.theData = theData;
        }
        protected E getTheData(){
            return theData;
        }
    }
    Node<E> head, tail;
    int size;
    public KWLinkedList(){
        head = null;
        tail = null;
        size = start;
    }
    public int size(){
        return size;
    }
    public int capacity(){
        return size();
    }
    public boolean isEmpty(){
        return size == 0;
    }
    public boolean isFull(){
        return head == tail;
    }
    public void reallocate(){
        System.out.println("Method not used in this class!");
    }
    public E peek(){
        return head.getTheData();
    }
    public class LinkedIterator implements IteratorList<E>{
        Node<E> ptr;
        int count = 0;
        private LinkedIterator(){
            ptr = head;
        }
        public boolean hasNext(){
            return ptr.next != null;
        }
        public boolean hasPrevious(){
            return ptr.previous != null;
        }
        public boolean isRange(int index){
            return index >= 0 && index < size;
        }
        public int getCount(){
            return count;
        }
        public int getIndex(){
            return getCount();
        }
        public E next(){
            if (!hasNext())
                throw new NoSuchElementException();
            else {
                E item = ptr.getTheData();
                ptr = ptr.next;
                count++;
                return item;
            }
        }
        public E previous(){
            if (!hasPrevious())
                throw new NoSuchElementException();
            else {
                ptr = ptr.previous;
                count--;
                return ptr.getTheData();
            }
        }
        public E get(int index){
            if (isRange(index)){
                if (count == index)
                    return next();
                else
                    next();
            }
            return null;
        }
    }
    public LinkedIterator iterator(){
        return new LinkedIterator();
    }
    public E get(int index){
        if (index >= 0 && index < size()){
            Node<E> temp = getHead();
            for (int i = 0; i <= index && temp.next != null; i++)
                temp = temp.next;
            if (temp.getTheData() != null)
                return temp.getTheData();
            else
                return peek();
        }
        return null;
    }
    public void addLast(E item){
        Node<E> newNode = new Node<>(item);
        if (isEmpty())
            head = newNode;
        else {
            tail.next = newNode;
            newNode.previous = tail;
        }
        tail = newNode;
        size++;
    }
    public void addFirst(E item){
        Node<E> newNode = new Node<>(item);
        if (isEmpty())
            tail = newNode;
        else {
            head.previous = newNode;
            newNode.next = getHead();
        }
        head = newNode;
        size++;
    }
    public void add(E item){
        addLast(item);
    }
    public Node<E> getHead(){
        return head;
    }
    public Node<E> getTail(){
        return tail;
    }
    public boolean add(E item, int location){
        if (location >= 0 && location < size){
            Node<E> temp1 = getHead(), temp2 = getTail();
            Node<E> newNode = new Node<>(item);
            if (location > 0){
                for (int i = 0; i < location && temp1.next != null; i++)
                    temp1 = temp1.next;
                for (int j = size(); j > location && temp2.previous != null; j--)
                    temp2 = temp2.previous;
                temp1.next = newNode;
                temp2.previous = newNode;
                newNode.previous = temp1;
                newNode.next = temp2;
            }
            else
                addFirst(item);
            size++;
            return true;
        }
        else
            return false;
    }
    public E removeLast(){
        if (isEmpty())
            return null;
        else if (isFull()){
            E item = peek();
            head = null;
            tail = null;
            size--;
            return item;
        }
        else {
            E item = tail.getTheData();
            tail = tail.previous;
            size--;
            return item;
        }
    }
    public E removeFirst(){
        if (isEmpty())
            return null;
        else if (isFull()){
            E item = peek();
            head = null;
            tail = null;
            size--;
            return item;
        }
        else {
            E item = peek();
            head = head.next;
            size--;
            return item;
        }
    }
    @SuppressWarnings("unchecked")
    public E remove(E item){
        if (isEmpty())
            return null;
        else if (isFull() && ((Comparable<E>)peek()).compareTo(item) == 0){
            E backup = peek();
            head = null;
            tail = null;
            size--;
            return backup;
        }
        else {
            Node<E> temp1 = head, temp2 = temp1.next;
            E backup = get(0);
            if (search(item) != -1){
                while (temp1.next != null && temp2 != tail && temp2.next != null){
                    if (((Comparable<E>)temp2.getTheData()).compareTo(item) == 0){
                        backup = temp1.next.getTheData();
                        temp1.next = temp2.next;
                        size--;
                    }
                    else {
                        temp1 = temp1.next;
                        temp2 = temp2.next;
                    }
                }
            }
            return backup;
        }
    }
    @SuppressWarnings("unchecked")
    public int indexOf(E item){
        LinkedIterator iterator = iterator();
        int count = -1;
        while (iterator.hasNext()){
            count++;
            if (((Comparable<E>)iterator.next()).compareTo(item) == 0)
                return count;
        }
        return count;
    }
    public int search(E item){
        return indexOf(item);
    }
    public E set(int index, E item){
        if (index >= start && index < size()){
            Node<E> temp = head;
            for (int i = 0; i <= index && temp.next != null; i++)
                temp = temp.next;
            E backup = temp.getTheData();
            temp.theData = item;
            return backup;
        }
        else
            return null;
    }
    public void replace(E oldItem, E newItem){
        set(search(oldItem), newItem);
    }
    @SuppressWarnings("unchecked")
    public boolean sort(){
        Node<E> temp1 = head, temp2;
        while (temp1.next != null){
            temp2 = temp1.next;
            while (temp2 != null){
                if (((Comparable<E>)temp2.getTheData()).compareTo(temp1.getTheData()) > 0){
                    E backup1 = temp1.getTheData();
                    E backup2 = temp2.getTheData();
                    replace(backup2, backup1);
                }
                temp2 = temp2.next;
            }
            temp1 = temp1.next;
        }
        return ((Comparable<E>)peek()).compareTo(tail.getTheData()) < 0;
    }
    public void shuffle(){
        Node<E> temp1 = head, temp2 = tail;
        while (temp1.next != temp2.previous){
            replace(temp1.getTheData(), temp2.getTheData());
            temp1 = temp1.next;
            temp2 = temp2.next;
        }
    }
    @SuppressWarnings("unchecked")
    public int compareHalf(){
        E max1 = peek(), max2 = tail.getTheData();
        Node<E> temp1 = head, temp2 = tail;
        for (int i = 0; i < size()/2 && temp1 != null && temp1.next != null; i++){
            temp1 = temp1.next;
            if (((Comparable<E>)temp1.getTheData()).compareTo(max1) > 0)
                max1 = temp1.getTheData();
        }
        for (int i = size(); i >= size()/2 && temp2.previous != null; i--){
            temp2 = temp2.previous;
            if (((Comparable<E>)temp2.getTheData()).compareTo(max2) > 0)
                max2 = temp2.getTheData();
        }
        int measure = 0;
        if (((Comparable<E>)max1).compareTo(max2)>0)
            measure = 1;
        else if (((Comparable<E>)max1).compareTo(max2)<0)
            measure = -1;
        return measure;
    }
    public void display(){
        LinkedIterator iterator = iterator();
        System.out.print("List: ");
        while (iterator.hasNext())
            System.out.print(iterator.next()+"  ");
        System.out.println();
        System.out.println("Reversed: ");
        while (iterator.hasPrevious())
            System.out.print(iterator.previous()+"  ");
        System.out.println();
    }
}
@SuppressWarnings("unchecked")
class ArrayStack<E> implements Generics<E>{
    E[] theData;
    int topOfStack = -1;
    public ArrayStack(){
        theData = (E[]) new Object[default_capacity];
    }
    public ArrayStack(int size){
        int capacity = (size <= start) ? default_capacity : size;
        theData = (E[]) new Object[capacity];
    }
    public ArrayStack(ArrayStack<E> other){
        this.topOfStack = other.topOfStack;
        this.theData = (E[]) new Object[other.theData.length];
        if (this.topOfStack >= start)
            System.arraycopy(other.theData, start, this.theData, start, this.topOfStack);
    }
    public class ArrayIterator implements IteratorList<E>{
        int count = start, index;
        private ArrayIterator(){
            index = start;
        }
        private ArrayIterator(int index){
            this.index = (index < start || index > topOfStack) ? start : index;
        }
        public boolean hasNext(){
            return count <= topOfStack;
        }
        public boolean hasPrevious(){
            return count > start;
        }
        public int getCount(){
            return count;
        }
        public int getIndex(){
            return index;
        }
        public boolean isRange(int index){
            return index > start && index <= topOfStack;
        }
        public E next(){
            if (!hasNext())
                throw new IndexOutOfBoundsException();
            else if (isRange(getCount())){
                E backup = theData[getIndex()];
                index++;
                count++;
                return backup;
            }
            else
                return null;
        }
        public E previous(){
            if (!hasPrevious())
                throw new IndexOutOfBoundsException();
            else if (isRange(getCount())){
                index--;
                count--;
                return theData[getIndex()];
            }
            else
                return null;
        }
        public E get(int index){
            if (isRange(index))
                return theData[index];
            else
                return null;
        }
    }
    public ArrayIterator iterator(){
        return new ArrayIterator();
    }
    public ArrayIterator iterator(int index){
        return new ArrayIterator(index);
    }
    public int capacity(){
        return theData.length;
    }
    public int size(){
        return topOfStack;
    }
    public E get(int index){
        ArrayIterator iterator = iterator();
        return iterator.get(index);
    }
    public void reallocate(){
        int capacity = theData.length*2;
        E[] copyData = (E[]) new Object[capacity];
        ArrayIterator iterator = iterator();
        for (int i = start; i <= topOfStack && iterator.hasNext(); i++)
            copyData[i] = iterator.next();
        theData = copyData;
    }
    public boolean isEmpty(){
        return size() == -1;
    }
    public boolean isFull(){
        return size() == capacity()-1;
    }
    public void addLast(E item){
        if (isFull())
            reallocate();
        topOfStack++;
        theData[size()] = item;
    }
    public void add(E item){
        addLast(item);
    }
    public void addFirst(E item){
        throw new UnsupportedOperationException("Function violates stack rule!");
    }
    public E removeLast(){
        if (isEmpty())
            return null;
        else {
            E backup = theData[size()];
            topOfStack--;
            return backup;
        }
    }
    public E remove(E item){
        if (theData[size()] == item)
            return removeLast();
        else
            throw new UnsupportedOperationException("Function unsupported because the item is not at the top of the stack!");
    }
    public E removeFirst(){
        throw new UnsupportedOperationException("Function violates stack rule!");
    }
    public E peek(){
        if (isEmpty())
            return null;
        else
            return theData[size()];
    }
    public E set(int index, E item){
        if (index == size()){
            E save = peek();
            theData[size()] = item;
            return save;
        }
        else
            throw new UnsupportedOperationException("Function unsupported because the item is not at the top of the stack!");
    }
    public boolean add(E item, int index){
        if (size() == index){
            add(item);
            return true;
        }
        else {
            System.out.println("Function unsupported because the item is not at the top of the stack!");
            return false;
        }
    }
    public int indexOf(E item){
        ArrayIterator iterator = iterator();
        for (int i = 0; i <= size() && iterator.hasNext(); i++){
            E find = iterator.next();
            if (find != null && ((Comparable<E>)find).compareTo(item) == 0)
                return i;
        }
        return -1;
    }
    public int search(E item){
        return indexOf(item);
    }
    public boolean sort(){
        return false;
    }
    public void shuffle(){
        int count = 0;
        ArrayIterator iterator = iterator();
        ArrayStack<E> stack = new ArrayStack<>(capacity());
        while (iterator.hasNext()){
            E store = iterator.next();
            if (store != null){
                if (((Comparable<E>)store).compareTo(removeLast()) % 2 == 1) {
                    if (stack.size() < 0)
                        stack.add(store);
                    else if (stack.add(store, stack.size())){
                        count++;
                        System.out.println("Step "+count+" complete!");
                    }
                }
            }
        }
        while (iterator.hasPrevious()){
            E store = iterator.previous();
            if (store != null)
                if (((Comparable<E>)store).compareTo(removeLast()) % 2 == 0)
                    if (stack.add(store, stack.size())){
                        count++;
                        System.out.println("Step "+count+" complete!");
                    }
        }
        while (!stack.isEmpty())
            addLast(stack.removeLast());
    }
    public int compareHalf(){
        E max1 = peek(), max2;
        ArrayIterator iterator = iterator(start);
        for (int i = 0; i < size()/2 && iterator.hasNext(); i++){
            E store = iterator.next();
            if (store != null)
                if (((Comparable<E>)store).compareTo(max1) > start)
                    max1 = store;
        }
        ArrayIterator another = iterator(size());
        max2 = another.previous();
        for (int j = size(); j >= size()/2 && another.hasPrevious(); j--){
            E save = another.previous();
            if (save != null && max2 != null && ((Comparable<E>)save).compareTo(max2) > 0)
                max2 = save;
        }
        int measure = 0;
        if (max2 != null && ((Comparable<E>)max2).compareTo(max1) > 0)
            measure = 1;
        else if (max2 != null && ((Comparable<E>)max1).compareTo(max2) > 0)
            measure = -1;
        return measure;
    }
    public void replace(E oldItem, E newItem){
        if (search(oldItem) == size())
            set(size(), newItem);
        else
            System.out.println("Cannot replace item in stack!");
    }
    public void display(){
        ArrayIterator iterator = iterator();
        System.out.print("List: ");
        while (iterator.hasNext())
            System.out.print(iterator.next()+"  ");
        System.out.println();
        System.out.print("Stack form: ");
        while (iterator.hasPrevious())
            System.out.print(iterator.previous()+"  ");
        System.out.println();
    }
}
class LinkedStack<E>{
    private static class Node<E>{
        E theData;
        Node<E> next;
        private Node(E theData){
            this.theData = theData;
            next = null;
        }
        private Node(E theData, Node<E> next){
            this.theData = theData;
            this.next = next;
        }
        protected E getTheData(){
            return theData;
        }
    }
    Node<E> topOfStack;
    int size;
    public LinkedStack(){
        topOfStack = null;
        size = 0;
    }
    public LinkedStack(LinkedStack<E> other){
        while (other.topOfStack != null && other.topOfStack.next != null){
            this.topOfStack = new Node<>(other.topOfStack.getTheData(), this.topOfStack);
            other.topOfStack = other.topOfStack.next;
        }
        this.size = other.size;
    }
    public boolean isEmpty(){
        return topOfStack == null;
    }
    public void push(E item){
        if (isEmpty())
            topOfStack = new Node<>(item);
        else
            topOfStack = new Node<>(item, topOfStack);
        size++;
    }
    public E pop(){
        if (isEmpty())
            return null;
        else {
            E item = peek();
            topOfStack = topOfStack.next;
            size--;
            return item;
        }
    }
    public E peek(){
        return topOfStack.getTheData();
    }
    public void clear(){
        while (pop() != null)
            pop();
    }
    @SuppressWarnings("unchecked")
    public boolean contains(E item){
        LinkedStack<E> object = new LinkedStack<>(this);
        while (!object.isEmpty())
            if (((Comparable<E>)object.pop()).compareTo(item) == 0)
                return true;
        return false;
    }
    public int getSize(){
        return size;
    }
    public void display(){
        LinkedStack<E> theStack = new LinkedStack<>(this);
        System.out.print("List: ");
        while (!theStack.isEmpty())
            System.out.print(theStack.pop()+" ");
        System.out.println("Size: "+getSize());
    }
}
@SuppressWarnings("unchecked")
class ArrayQueue<E> implements Generics<E>{
    int size, capacity, front, rear;
    E[] theData;
    public ArrayQueue(){
        capacity = 10;
        size = 0;
        front = 0;
        rear = -1;
        theData = (E[]) new Object[capacity];
    }
    public ArrayQueue(int initial){
        capacity = (initial <= 0) ? 10 : initial;
        size = 0;
        front = 0;
        rear = -1;
        theData = (E[]) new Object[capacity];
    }
    public ArrayQueue(ArrayQueue<E> object){
        this.size = object.size;
        this.capacity = object.capacity;
        this.front = object.front;
        this.rear = object.rear;
        this.theData = (E[]) new Object[this.capacity];
        int count = this.front;
        for (int i = 0; i < this.capacity; i++){
            if (count <= this.rear) {
                this.theData[i] = object.theData[count];
                count++;
            }
        }
    }
    public void reallocate(){
        E[] backup = (E[]) new Object[capacity*2];
        int count = front;
        for (int i = 0; i < capacity; i++){
            if (count <= rear) {
                backup[i] = theData[count];
                count++;
            }
        }
        theData = backup;
    }
    public int capacity(){
        return capacity;
    }
    public int size(){
        return size;
    }
    public int getFront(){
        return front;
    }
    public int getRear(){
        return rear;
    }
    public boolean isEmpty(){
        return getRear() == getFront() && size() == 0;
    }
    public boolean isFull(){
        return size() == capacity() && getRear() == capacity() - 1;
    }
    public boolean isRange(int index){
        return index >= getFront() && index <= getRear();
    }
    public void addLast(E item){
        if (isFull())
            reallocate();
        rear = (rear + 1) & capacity;
        theData[rear] = item;
        size++;
    }
    public void addFirst(E item){
        if (isFull())
            reallocate();
        else if (size() == capacity() - 1 || size() == capacity() - 2)
            reallocate();
        rear = (rear + 1) % capacity;
        for (int i = front+1; i <= rear; i++)
            theData[i] = theData[i-1];
        theData[front] = item;
        size++;
    }
    public void add(E item){
        addLast(item);
    }
    public boolean add(E item, int location){
        if (isFull())
            reallocate();
        if (isRange(location)){
            if (size() == capacity() - 1 || size() == capacity() - 2)
                reallocate();
            E backup = theData[location];
            rear = (rear + 1) % capacity;
            for (int i = location+1; i <= rear; i++)
                theData[i] = theData[i-1];
            theData[location] = item;
            size++;
            return theData[location] == item && theData[location+1] == backup;
        }
        return false;
    }
    public int indexOf(E item){
        for (int i = front; i <= rear; i++)
            if (theData[i] == item)
                return i;
        return -1;
    }
    public int search(E item){
        return indexOf(item);
    }
    public E get(int location){
        if (isRange(location)){
            for (int i = front; i <= rear; i++)
                if (i == location)
                    return theData[i];
        }
        return null;
    }
    public E removeLast(){
        if (isEmpty())
            return null;
        E backup = theData[rear];
        rear--;
        size--;
        return backup;
    }
    public E removeFirst(){
        if (isEmpty())
            return null;
        E backup = theData[front];
        front = (front + 1) % capacity;
        size--;
        return backup;
    }
    public E remove(E item){
        if (isEmpty())
            return null;
        else if (isRange(search(item))){
            int location = indexOf(item);
            E backup = theData[location];
            for (int i = location + 1; i <= rear; i++)
                theData[i-1] = theData[i];
            rear--;
            size--;
            return backup;
        }
        return null;
    }
    public E peek(){
        return theData[front];
    }
    public boolean sort(){
        for (int i = getFront(); i < getRear(); i++)
            for (int j = i+1; j <= getRear(); j++)
                if (((Comparable<E>)theData[i]).compareTo(theData[j]) > 0){
                    E temp = theData[i];
                    theData[i] = theData[j];
                    theData[j] = temp;
                }
        return true;
    }
    public void shuffle(){
        int shuffler = size()/2;
        for (int i = getFront(); i <= getRear(); i++){
            E temp = theData[i];
            theData[i] = theData[shuffler];
            theData[shuffler] = temp;
            shuffler = shuffler + (i+1);
            shuffler = shuffler % 2;
        }
    }
    public int compareHalf(){
        E max1 = theData[getFront()], max2 = theData[getFront()/2];
        for (int i = getFront()+1; i < getRear()/2; i++)
            if (((Comparable<E>)theData[i]).compareTo(max1) > 0)
                max1 = theData[i];
        for (int j = (getRear()/2)+1; j <= getRear(); j++)
            if (((Comparable<E>)theData[j]).compareTo(max2) > 0)
                max2 = theData[j];
        int compare = 0;
        if (((Comparable<E>)max1).compareTo(max2) > 0)
            compare = -1;
        else if (((Comparable<E>)max2).compareTo(max1) > 0)
            compare = 1;
        return compare;
    }
    public E set(int index, E item){
        if (isRange(index)){
            E backup = theData[index];
            theData[index] = backup;
            return backup;
        }
        return null;
    }
    public void replace(E oldItem, E newItem){
        set(search(oldItem), newItem);
    }
    public void display(){
        System.out.print("Items in the list: ");
        for (int i = getFront(); i <= getRear(); i++){
            if (i == getRear())
                System.out.print(theData[i]);
            else
                System.out.print(theData[i]+", ");
        }
        System.out.println();
        System.out.println("Size of the list = "+size());
    }
}
class LinkedQueue<E> implements Generics<E>{
    public static class Node<E>{
        E theData;
        Node<E> next;
        private Node(E theData){
            this.theData = theData;
            next = null;
        }
        protected E getTheData(){
            return theData;
        }
    }
    Node<E> front, rear;
    int size;
    public LinkedQueue(){
        front = null;
        rear = null;
        size = 0;
    }
    public LinkedQueue(LinkedQueue<E> other){
        this.size = other.size;
        this.front = new Node<>(other.front.getTheData());
        Node<E> temp1 = this.front, temp2 = other.front.next;
        temp1.next = new Node<>(other.front.next.getTheData());
        while (temp1.next != other.rear && temp2 != other.rear){
            while (temp1.next != null && temp2.next != null){
                temp1 = temp1.next;
                temp2 = temp2.next;
            }
            temp1.next = new Node<>(temp2.getTheData());
        }
        this.rear = new Node<>(other.rear.getTheData());
    }
    public class Iter implements IteratorList<E>{
        Node<E> next;
        int count = 0;
        private Iter(){
            next = front;
        }
        public boolean hasNext(){
            return next != rear;
        }
        public boolean hasPrevious(){
            return false;
        }
        public E next(){
            if (!hasNext())
                throw new NoSuchElementException();
            else {
                E item = next.getTheData();
                next = next.next;
                count++;
                return item;
            }
        }
        public E previous(){
            throw new UnsupportedOperationException("There is no connection to previous data!");
        }
        public int getIndex(){
            return count;
        }
        public int getCount(){
            return getIndex();
        }
        public boolean isRange(int index){
            return index > 0 && index < size;
        }
        public E get(int index){
            if (isRange(index)){
                if (index == count)
                    return next();
                else
                    next();
            }
            return null;
        }
    }
    public void reallocate(){
        System.out.println("No need to reallocate.");
    }
    public void add(E item){
        System.out.println("Unsupported operation.");
    }
    public boolean add(E item, int location){
        System.out.println("Unsupported operation.");
        return false;
    }
    public void addFirst(E item){
        System.out.println("Unsupported operation.");
    }
    public void addLast(E item){
        System.out.println("Unsupported operation.");
    }
    public E remove(E item){
        throw new UnsupportedOperationException();
    }
    public E removeFirst(){
        return poll();
    }
    public E removeLast(){
        throw new Error("Violating Queue Policy.");
    }
    public E get(int index){
        if (isEmpty())
            return null;
        Iter iter = iterator();
        for (int i = 0; i < index && iter.hasNext(); i++)
            iter.next();
        if (iter.hasNext())
            return iter.next();
        else
            return iter.previous();
    }
    public int capacity(){
        return 999999999;
    }
    @SuppressWarnings("unchecked")
    public int indexOf(E item){
        Iter iter = iterator();
        for (int i = 0; i < size() && iter.hasNext(); i++)
            if (((Comparable<E>)iter.next()).compareTo(item) == 0)
                return i;
        return -1;
    }
    public int search(E item){
        return indexOf(item);
    }
    public boolean isEmpty(){
        return size == 0;
    }
    public void offer(E item){
        Node<E> newNode = new Node<>(item);
        if (isEmpty())
            front = newNode;
        else
            rear.next = newNode;
        rear = newNode;
        size++;
    }
    public E peek(){
        if (isEmpty())
            return null;
        else
            return front.getTheData();
    }
    public E poll(){
        E item = peek();
        if (isEmpty())
            return null;
        else {
            front = front.next;
            size--;
            return item;
        }
    }
    public Iter iterator(){
        return new Iter();
    }
    public int size(){
        return size;
    }
    @SuppressWarnings("unchecked")
    public boolean contains(E item){
        Iter iter = iterator();
        while (iter.hasNext())
            if (((Comparable<E>)iter.next()).compareTo(item) == 0)
                return true;
        return iter.getCount() < size();
    }
    public void clear(){
        while (poll() != null)
            poll();
    }
    public boolean isFull(){
        System.out.println("Unsupported operation.");
        return false;
    }
    @SuppressWarnings("unchecked")
    public boolean sort(){
        System.out.println("This method will just check for sorted Queue in this case.");
        Iter iterator1 = iterator(), iterator2 = iterator();
        iterator2.next();
        while (iterator1.hasNext()){
            while (iterator2.hasNext()){
                E value1 = iterator1.next();
                E value2 = iterator2.next();
                if (((Comparable<E>)value1).compareTo(value2) > 0)
                    return false;
                else
                    iterator1.previous();
            }
            iterator1.next();
        }
        return !isEmpty();
    }
    public void shuffle(){
        System.out.println("Unsupported operation.");
    }
    @SuppressWarnings("unchecked")
    public int compareHalf(){
        Iter iter = iterator();
        E max1 = iter.next();
        for (int i = 0; i < size()/2 && iter.hasNext(); i++){
            E value = iter.next();
            if (((Comparable<E>)value).compareTo(max1) > 0)
                max1 = value;
        }
        E max2 = iter.next();
        while (iter.hasNext()){
            E value = iter.next();
            if (((Comparable<E>)value).compareTo(max2) > 0)
                max2 = value;
        }
        int flag = 0;
        if (((Comparable<E>)max1).compareTo(max2) > 0)
            flag = 1;
        else if (((Comparable<E>)max2).compareTo(max1) > 0)
            flag = -1;
        return flag;
    }
    public E set(int location, E item){
        throw new UnsupportedOperationException();
    }
    public void replace(E i, E j){
        System.out.println("Unsupported operation.");
    }
    public void display(){
        Iter iter = iterator();
        iter.next();
        System.out.print("Items in the list: ");
        System.out.print(iter.previous());
        while (iter.hasNext())
            System.out.print(", "+iter.next());
        System.out.println();
        System.out.println("Size of the list: "+size());
    }
}
class LinkedTree<E>{
    public static class Node<E>{
        Node<E> left;
        E data;
        Node<E> right;
        private Node(E data){
            left = null;
            this.data = data;
            right = null;
        }
        protected E getData(){
            return data;
        }
    }
    Node<E> root;
    public LinkedTree(){
        root = null;
    }
    public LinkedTree(LinkedTree<E> tree){
        this.root = tree.root;
    }
    public LinkedTree(LinkedTree<E> leftTree, LinkedTree<E> Tree, LinkedTree<E> rightTree){
        this.root = Tree.root;
        this.root.left = leftTree.root;
        this.root.right = rightTree.root;
    }
    private LinkedTree<E> getLeftSubTree(){
        LinkedTree<E> myTree = new LinkedTree<>(this);
        myTree.root = myTree.root.left;
        return myTree;
    }
    private LinkedTree<E> getRightSubTree(){
        LinkedTree<E> myTree = new LinkedTree<>(this);
        myTree.root = myTree.root.right;
        return myTree;
    }
    public boolean isLeaf(){
        return root != null && (root.left == null && root.right == null);
    }
    public boolean isEmpty(){
        return root == null;
    }
    public Node<E> getRoot(){
        return root;
    }
    public boolean isRoot(Node<E> node){
        return node == getRoot();
    }
    public int height(){
        return getHeight(root);
    }
    private int getHeight(Node<E> node){
        if (node == null)
            return 0;
        else
            return 1+getMax(getHeight(node.left), getHeight(node.right));
    }
    private int getMax(int left, int right){
        return Math.max(left, right);
    }
    public int maxLeft(){
        LinkedTree<E> anotherTree = getLeftSubTree();
        return getMaxLeft(anotherTree.getRoot());
    }
    private int getMaxLeft(Node<E> node){
        if (node == null)
            return 0;
        else
            return getMax((Integer) node.getData(), getMax(getMaxLeft(node.left), getMaxLeft(node.right)));
    }
    public int max(){
        return maxFinder(root);
    }
    private int maxFinder(Node<E> node){
        if (node == null)
            return 0;
        else
            return getMax((Integer) node.getData(), getMax(getMaxLeft(node.left), getMaxLeft(node.right)));
    }
    public int maxRight(){
        LinkedTree<E> anotherTree = getRightSubTree();
        return getMaxRight(anotherTree.getRoot());
    }
    private int getMaxRight(Node<E> node){
        if (node == null)
            return 0;
        else
            return getMax((Integer)node.getData(), getMax(getMaxRight(node.left), getMaxRight(node.right)));
    }
    public int sumLeft(){
        LinkedTree<E> anotherTree = getLeftSubTree();
        return getSumLeft(anotherTree.getRoot());
    }
    private int getSumLeft(Node<E> node){
        if (node == null)
            return 0;
        else
            return (Integer)node.getData()+getSumLeft(node.left)+getSumLeft(node.right);
    }
    public int sumRight(){
        LinkedTree<E> anotherTree = getRightSubTree();
        return getSumRight(anotherTree.getRoot());
    }
    private int getSumRight(Node<E> node){
        if (node == null)
            return 0;
        else
            return (Integer)node.getData()+getSumRight(node.left)+getSumRight(node.right);
    }
    private int getSum(Node<E> node){
        if (node == null)
            return 0;
        else
            return (Integer)node.getData()+getSum(node.left)+getSum(node.right);
    }
    public int sum(){
        return getSum(getRoot());
    }
    public int countLeft(){
        LinkedTree<E> anotherTree = getLeftSubTree();
        return getCountLeft(anotherTree.getRoot());
    }
    private int getCountLeft(Node<E> node){
        if (node == null)
            return 0;
        else
            return 1+getCountLeft(node.left)+getCountLeft(node.right);
    }
    public int countRight(){
        LinkedTree<E> anotherTree = getRightSubTree();
        return getCountRight(anotherTree.getRoot());
    }
    public int getCountRight(Node<E> node){
        if (node == null)
            return 0;
        else
            return 1+getCountRight(node.left)+getCountRight(node.right);
    }
    private int getCount(Node<E> node){
        if (node == null)
            return 0;
        else
            return 1+getCount(node.left)+getCount(node.right);
    }
    public int count(){
        return getCount(getRoot());
    }
    public void requestFunctions(String[] lines){
        PrintWriter writer;
        try {
            writer = new PrintWriter("C:\\\\Users\\\\Alimo\\\\Documents\\\\Data Structure\\\\requests.txt");
            for (String line : lines) writer.println(line);
            writer.close();
            System.out.println("Your requests have been received!");
        }
        catch (IOException E){
            System.out.println(E.getMessage());
        }
    }
    public int sumOfNodes(){
        return sumTree(root);
    }
    private int sumTree(Node<E> node){
        if (node == null)
            return 0;
        else
            return ((Integer)node.getData())+sumTree(node.left)+sumTree(node.right);
    }
    public int countNodes(){
        return countTree(root);
    }
    private int countTree(Node<E> node){
        if (node == null)
            return 0;
        else
            return 1+countTree(node.left)+countTree(node.right);
    }
    public void print(int number){
        switch (number) {
            case 0, 1 -> preTraverse(root);
            case 2 -> inTraverse(root);
            case 3 -> postTraverse(root);
            default -> System.out.println("Invalid number!");
        }
    }
    private int getProduct(Node<E> node){
        if (node == null)
            return 1;
        else
            return (Integer)node.getData()*getProduct(node.left)+getProduct(node.right);
    }
    public int product(){
        return getProduct(getRoot());
    }
    private int getLeftProduct(Node<E> node){
        if (node == null)
            return 1;
        else
            return (Integer)node.getData()*getLeftProduct(node.left)+getLeftProduct(node.right);
    }
    private int getRightProduct(Node<E> node){
        if (node == null)
            return 1;
        else
            return (Integer)node.getData()*getRightProduct(node.left)+getRightProduct(node.right);
    }
    public int leftProduct(){
        LinkedTree<E> tree = getLeftSubTree();
        return getLeftProduct(tree.getRoot());
    }
    public int rightProduct(){
        LinkedTree<E> tree = getRightSubTree();
        return getRightProduct(tree.getRoot());
    }
    @SuppressWarnings("unchecked")
    private int indexOf(Node<E> node, E item, int start){
        if (node == null)
            return -1;
        else if (((Comparable<E>)node.getData()).compareTo(item) == 0)
            return start;
        else
            return indexOf(node.left, item, start+1)*indexOf(node.right, item, start+1);
    }
    public int search(E item){
        return indexOf(getRoot(), item, 0);
    }
    public int searchLeft(E item){
        LinkedTree<E> tree = getLeftSubTree();
        return indexOf(tree.getRoot(), item, 0);
    }
    public int searchRight(E item){
        LinkedTree<E> tree = getRightSubTree();
        return indexOf(tree.getRoot(), item, 0);
    }
    private void preTraverse(Node<E> node){
        if (node == null)
            return;
        else {
            System.out.print(node.getData()+"  ");
            preTraverse(node.left);
            preTraverse(node.right);
        }
    }
    private void inTraverse(Node<E> node){
        if (node == null)
            return;
        else {
            inTraverse(node.left);
            System.out.print(node.getData()+"  ");
            inTraverse(node.right);
        }
    }
    private void postTraverse(Node<E> node){
        if (node == null)
            return;
        else {
            postTraverse(node.left);
            postTraverse(node.right);
            System.out.print(node.getData()+"  ");
        }
    }
}
class Graph{
    int capacity;
    int[][] array;
    public Graph(){
        capacity = 10;
        array = new int[capacity][capacity];
    }
    public Graph(int initial){
        capacity = (initial <= 0) ? 10: initial;
    }
    public int getCapacity(){
        return capacity;
    }
    public int get(int row, int column){
        return array[row][column];
    }
    public int get(int value){
        return array[value][value];
    }
    public boolean isRange(int index1, int index2){
        return (index1 >= 0 && index1 < getCapacity()) && (index2 >= 0 && index2 < getCapacity());
    }
    public boolean connect(int row, int column){
        if (isRange(row, column)){
            array[row][column] = 1;
            System.out.println("Connection successful!");
            return true;
        }
        System.out.println("Connection failed!");
        return false;
    }
    public boolean disconnect(int row, int column){
        if (isRange(row, column)){
            if (array[row][column] == 0){
                System.out.println("No connection found!");
                return false;
            }
            array[row][column] = 0;
            System.out.println("Disconnection successful!");
            return true;
        }
        System.out.println("Disconnection failed!");
        return false;
    }
    public void display(){
        System.out.println();
        System.out.println("Matrix of graph:");
        System.out.print("  ");
        for (int i = 0; i < getCapacity(); i++)
            System.out.print(i+" ");
        System.out.println();
        for (int i = 0; i < getCapacity(); i++) {
            System.out.print(i+" ");
            for (int j = 0; j < getCapacity(); j++) {
                System.out.print(array[i][j]+" ");
            }
            System.out.println();
        }
        System.out.println();
    }
}
@SuppressWarnings("unchecked")
class LinkedHashing<E>{
    private static class Node<E>{
        E data;
        Node<E> next;
        private Node(E theData){
            data = theData;
            next = null;
        }
        protected E getData(){
            return data;
        }
    }
    Node<E>[] head;
    int capacity;
    public LinkedHashing(){
        capacity = 10;
        head = new Node[capacity];
    }
    public LinkedHashing(int size){
        capacity = (size <= 0) ? 10 : size;
        head = new Node[capacity];
    }
    public int getCapacity(){
        return capacity;
    }
    public int add(E item){
        int location = (Integer)item % getCapacity();
        Node<E> newNode = new Node<>(item);
        if (head[location] != null) {
            newNode.next = head[location];
        }
        head[location] = newNode;
        return location;
    }
    public int delete(E item){
        int location = (Integer)item % getCapacity(), found = -1, count = 0;
        do {
            Node<E> temp1 = head[location], temp2 = temp1.next;
            while (temp1.next != null && temp2 != null){
                if (((Comparable<E>)temp2.getData()).compareTo(item) == 0){
                    temp1.next = temp2.next;
                    found = location;
                    break;
                }
                else if (((Comparable<E>)temp1.getData()).compareTo(item) == 0 && temp1 == head[location]){
                    head[location] = head[location].next;
                    found = location;
                    break;
                }
                else {
                    temp1 = temp1.next;
                    temp2 = temp2.next;
                }
            }
            if (found != -1)
                break;
            location = (location+1) % getCapacity();
            count++;
        }
        while (count < getCapacity());
        return found;
    }
    public int search(E item){
        int location = (Integer)item % getCapacity(), found = -1, count = 0;
        do {
            Node<E> temp = head[location];
            while (temp != null){
                if (((Comparable<E>)temp.getData()).compareTo(item) == 0){
                    found = location;
                    break;
                }
                else
                    temp = temp.next;
            }
            if (found != -1)
                break;
            location = (location+1) % getCapacity();
            count++;
        }
        while (count < getCapacity());
        return found;
    }
    public String get(int location){
        if (location % getCapacity() == location){
            Node<E> temp = head[location];
            StringBuilder concatenate = new StringBuilder(temp.getData()+"");
            do {
                temp = temp.next;
                concatenate.append(" -> ").append(temp.getData());
            }
            while (temp.next != null);
            return concatenate.toString();
        }
        return "Not found!";
    }
    public boolean replace(E oldItem, E newItem){
        int location = (Integer)oldItem % getCapacity(), count = 0;
        boolean flag = false;
        do {
            Node<E> temp = head[location];
            while (temp != null){
                if (((Comparable<E>)temp.getData()).compareTo(oldItem) == 0){
                    temp.data = newItem;
                    flag = true;
                    break;
                }
                else
                    temp = temp.next;
            }
            if (flag)
                break;
            location = (location+1) % getCapacity();
            count++;
        }
        while (count < getCapacity());
        return flag;
    }
    public void display(){
        System.out.println("\nList of connected nodes: ");
        for (int i = 0; i < getCapacity(); i++)
            System.out.println("["+i+"] "+get(i));
        System.out.println("\nCapacity = "+getCapacity()+"\n");
    }
}
@SuppressWarnings("unchecked")
class ArrayHashing<E>{
    int capacity;
    E[] theArray;
    public ArrayHashing(){
        capacity = 10;
        theArray = (E[]) new Object[capacity];
    }
    public ArrayHashing(int size){
        capacity = (size <= 0) ? 10 : size;
        theArray = (E[]) new Object[capacity];
    }
    public int getCapacity(){
        return capacity;
    }
    public void reallocate(){
        capacity *= 2;
        E[] backup = (E[]) new Object[getCapacity()];
        for (int i = 0; i < theArray.length; i++) {
            if (search(get(i)) != -1)
                backup[i] = theArray[i];
        }
        theArray = backup;
    }
    public int add(E item){
        int location = search(item), count = 0;
        for (int i = 0; i < getCapacity(); i++) {
            if (get(i) != null)
                count++;
        }
        if (count == getCapacity() || count == getCapacity()-1)
            reallocate();
        else if (theArray[location] == null){
            theArray[location] = item;
            return location;
        }
        return -1;
    }
    public int remove(E item){
        int location = search(item);
        if (theArray[location] == item){
            theArray[location] = null;
            return location;
        }
        return -1;
    }
    public int search(E item){
        int location = (Integer)item % getCapacity(), count = 0;
        while (theArray[location] != item){
            location = (location+1) % getCapacity();
            count++;
            if (count == getCapacity())
                break;
        }
        if (theArray[location] == item)
            return location;
        return -1;
    }
    public E get(int index){
        int location = index % getCapacity();
        if (location == index && theArray[location] != null)
            return theArray[location];
        return null;
    }
    public void display(){
        System.out.print("List: ");
        for (int i = 0; i < getCapacity(); i++)
            System.out.print(get(i)+" ");
        System.out.println("\nCapacity: "+getCapacity());
    }
}
class testGenerics{
}
class LinkedStack2<E>{
    private static class Node<E>{
        private Node<E> next;
        E data;
        private Node(E theData){
            data = theData;
            next = null;
        }
        protected E getData(){
            return data;
        }
    }
    Node<E> head, topOfStack;
    int size;
    public LinkedStack2(){
        head = null;
        topOfStack = null;
        size = 0;
    }
    public boolean isEmpty(){
        return head == null;
    }
    public boolean isFull(){
        return head == topOfStack;
    }
    public Node<E> getHead(){
        return head;
    }
    public Node<E> getTopOfStack(){
        return topOfStack;
    }
    public int getSize(){
        return size;
    }
    public void push(E item){
        Node<E> newNode = new Node<>(item);
        if (isEmpty())
            head = newNode;
        else
            topOfStack.next = newNode;
        topOfStack = newNode;
        size++;
    }
    public E pop(){
        if (isEmpty())
            return null;
        else if (isFull()) {
            E item = getHead().getData();
            head = null;
            topOfStack = null;
            size--;
            return item;
        }
        else {
            E item = peek();
            Node<E> temp = head;
            while (temp.next != getTopOfStack())
                temp = temp.next;
            topOfStack = temp;
            topOfStack.next = null;
            size--;
            return item;
        }
    }
    public E peek(){
        if (isEmpty())
            return null;
        else
            return getTopOfStack().getData();
    }
    @Override
    public String toString() {
        return "com.company.LinkedStack2{" +
                "head=" + head +
                ", topOfStack=" + topOfStack +
                ", size=" + getSize() +
                '}';
    }
}
@SuppressWarnings("unchecked")
class RealGraph<E>{
    protected static class Node<E>{
        Node<E>[] next;
        int size;
        E data;
        private Node(E data, int cap){
            int capacity = (cap <= 0) ? 2 : cap;
            size = 0;
            this.data = data;
            next = new Node[capacity];
        }
        private Node(E data){
            next = null;
            size = 0;
            this.data = data;
        }
        protected E getData(){
            return data;
        }
        protected int getSize(){
            return size;
        }
        protected boolean isRange(int index){
            return index >= 0 && index < getSize();
        }
        protected int getCapacity(){
            return next.length;
        }
        protected boolean isFull(){
            return getSize() == getCapacity();
        }
        protected boolean isEmpty() {
            return getSize() == 0;
        }
        protected void addNext(Node<E> connection, int number){
            if (isFull())
                return;
            if (isRange(number)) {
                next[number] = connection;
                size++;
            }
        }
        protected void add(Node<E> connection){
            if (isFull())
                return;
            next[getSize()] = connection;
            size++;
        }
    }
    Node<E> root;
    public RealGraph(RealGraph<E> other){
        this.root = other.root;
    }
    public RealGraph(E item, int cap){
        root = new Node<>(item, cap);
    }
    public void addNode(E item){
        Node<E> backup = new Node<>(item);
        root.add(backup);
    }
    public void addNode(E item, int location){
        Node<E> backup = new Node<>(item);
        root.addNext(backup, location);
    }
    public void addNode(E item, int location, int size){
        Node<E> backup = new Node<>(item, size);
        root.addNext(backup, location);
    }
    public void addVertices(E item, int size){
        Node<E> backup = new Node<>(item, size);
        root.add(backup);
    }
    public boolean isLeaf(Node<E> node){
        return node.isEmpty();
    }
    private Node<E> search(Node<E> node, E item, int size){
        if (!node.isRange(size))
            return null;
        while (node.next[size] == null)
            size--;
        if (isLeaf(node) && ((Comparable<E>)node.getData()).compareTo(item) != 0)
            return null;
        else if (!isLeaf(node) && ((Comparable<E>)node.getData()).compareTo(item) == 0)
            return node;
        else if (isLeaf(node) && ((Comparable<E>)node.getData()).compareTo(item) == 0)
            return node;
        else {
            if ((size == node.getCapacity()-1 && ((Comparable<E>)node.getData()).compareTo(item) != 0) || !node.isRange(size))
                return null;
            else
                return search(node.next[size], item, size+1);
        }
    }
    public void addEdges(Node<E> A, Node<E> B){
        Node<E> temp1 = root, temp2 = root;
        LinkedQueue<Node<E>> temp1Queue = new LinkedQueue<>();
        ArrayQueue<Node<E>> temp2Queue = new ArrayQueue<>();
        boolean value1 = false, value2 = false;
        while (!isLeaf(temp1)){
            for (int i = 0; i < temp1.getCapacity(); i++)
                if (temp1.next[i] != null)
                    temp1Queue.offer(temp1.next[i]);
            if (temp1 == A){
                value1 = true;
                break;
            }
            else
                temp1 = temp1Queue.poll();
        }
        while (!isLeaf(temp2)){
            for (int j = 0; j < temp2.getCapacity(); j++)
                if (temp2.next[j] != null)
                    temp2Queue.addLast(temp2.next[j]);
            if (temp2 == B){
                value2 = true;
                break;
            }
            else
                temp2 = temp2Queue.remove(temp2Queue.peek());
        }
        if (value1 && value2){
            if (isLeaf(temp1))
                temp1.next[0] = temp2;
            else
                for (int k = 0; k < temp1.getCapacity(); k++)
                    if (temp1.next[k] == null)
                        temp1.next[k] = temp2;
        }
    }
    public boolean addEdge(Node<E> A, Node<E> B){
        Node<E> temp1 = root, temp2 = temp1;
        Node<E> search1 = search(temp1, A.getData(), 0);
        Node<E> search2 = search(temp2, B.getData(), 0);
        if (search1 != null && search2 != null){
            temp1 = search1;
            temp2 = search2;
            if (isLeaf(temp1))
                temp1.next[0] = temp2;
            else
                for (int i = 0; i < temp1.getCapacity(); i++)
                    if (temp1.next[i] == null)
                        temp1.next[i] = temp2;
            return true;
        }
        return false;
    }
    private void traverse(Node<E> node, int size){
        if (size == node.getCapacity()-1)
            return;
        System.out.print(node.getData()+"\t");
        while (node.next[size] == null)
            size--;
        traverse(node.next[size], size+1);
    }
    private void traverse(){
        Node<E> temp = root;
        LinkedQueue<Node<E>> queue = new LinkedQueue<>();
        while (!isLeaf(temp)){
            System.out.print(temp.getData());
            for (int i = 0; i < temp.getCapacity(); i++)
                if (temp.next[i] != null)
                    queue.offer(temp.next[i]);
            temp = queue.poll();
        }
    }
    public void print(){
        traverse();
    }
    public void display(){
        traverse(root, 0);
    }
}
class Circular<E> implements Generics<E>{
    private static class Node<E>{
        E theData;
        Node<E> next, prev;
        private Node(E theData){
            this.theData = theData;
            next = null;
            prev = null;
        }
        protected E getTheData(){
            return theData;
        }
    }
    Node<E> head, tail;
    int size;
    public Circular(){
        head = null;
        tail = null;
        size = 0;
    }
    public void reallocate(){
        System.out.println("No need to reallocate!");
    }
    public int size(){
        return size;
    }
    public int capacity(){
        return size();
    }
    public boolean isEmpty(){
        return capacity() == 0;
    }
    public boolean isFull(){
        return head == tail;
    }
    public void add(E item){
        addLast(item);
    }
    public boolean add(E item, int index){
        Node<E> newNode = new Node<>(item);
        if (index >= 0 && index < size()){
            Node<E> temp1 = head, temp2 = tail;
            for (int i = 0; i < capacity()/2 && temp1.next != null; i++)
                temp1 = temp1.next;
            for (int j = capacity(); j > capacity()/2 && temp2.prev != null; j--)
                temp2 = temp2.prev;
            temp1.next = newNode;
            newNode.prev = temp1;
            temp2.prev = newNode;
            newNode.next = temp2;
            size++;
            return true;
        }
        else
            return false;
    }
    public void addFirst(E item){
        Node<E> newNode = new Node<>(item);
        if (isEmpty()){
            head = newNode;
            tail = newNode;
        }
        else {
            head.prev = newNode;
            newNode.next = head;
            newNode.prev = tail;
            head = newNode;
        }
        size++;
    }
    public void addLast(E item){
        Node<E> newNode = new Node<>(item);
        if (isEmpty())
            head = newNode;
        else {
            tail.next = newNode;
            newNode.prev = tail;
            newNode.next = head;
        }
        tail = newNode;
        size++;
    }
    public E peek(){
        return head.getTheData();
    }
    public E removeLast(){
        if (isEmpty())
            return null;
        else if (isFull()){
            E item = peek();
            head = null;
            tail = null;
            size--;
            return item;
        }
        else {
            E item = tail.getTheData();
            tail = tail.prev;
            tail.next = head;
            size--;
            return item;
        }
    }
    public E removeFirst(){
        if (isEmpty())
            return null;
        else if (isFull()){
            E item = peek();
            head = null;
            tail = null;
            size--;
            return item;
        }
        else {
            E item = peek();
            head = head.next;
            head.prev = tail;
            size--;
            return item;
        }
    }
    @SuppressWarnings("unchecked")
    public int indexOf(E item){
        Node<E> temp1 = head, temp2 = tail;
        for (int i = 0; i < size() && temp1.next != null; i++){
            if (((Comparable<E>)temp1.getTheData()).compareTo(item) == 0)
                return i;
            else
                temp1 = temp1.next;
        }
        for (int j = capacity()-1; j >= 0 && temp2.prev != null; j--){
            if (((Comparable<E>)temp2.getTheData()).compareTo(item) == 0)
                return j;
            else
                temp2 = temp2.prev;
        }
        return -1;
    }
    public int search(E item){
        return indexOf(item);
    }
    public E remove(E item){
        if (search(item) != -1){
            int index = indexOf(item);
            Node<E> temp1 = head, temp2 = tail;
            for (int i = 0; i < index && temp1.next != null; i++)
                temp1 = temp1.next;
            for (int j = size()-1; j >= index && temp2.prev != null; j--)
                temp2 = temp2.prev;
            E backup = temp2.getTheData();
            temp1.next = temp2.next;
            size--;
            return backup;
        }
        else
            return null;
    }
    public E get(int index){
        if (index >= 0 && index < size()){
            Node<E> temp = head;
            for (int i = 0; i <= index && temp.next != null; i++)
                temp = temp.next;
            if (temp.getTheData() != null)
                return temp.getTheData();
            else
                return peek();
        }
        return null;
    }
    public E set(int index, E item){
        if (index >= start && index < size()){
            Node<E> temp = head;
            for (int i = 0; i <= index && temp.next != null; i++)
                temp = temp.next;
            E backup = temp.getTheData();
            temp.theData = item;
            return backup;
        }
        else
            return null;
    }
    public void replace(E oldItem, E newItem){
        set(search(oldItem), newItem);
    }
    @SuppressWarnings("unchecked")
    public boolean sort(){
        Node<E> temp1 = head, temp2;
        while (temp1.next != null){
            temp2 = temp1.next;
            while (temp2 != null){
                if (((Comparable<E>)temp2.getTheData()).compareTo(temp1.getTheData()) > 0){
                    E backup1 = temp1.getTheData();
                    E backup2 = temp2.getTheData();
                    replace(backup2, backup1);
                }
                temp2 = temp2.next;
            }
            temp1 = temp1.next;
        }
        return ((Comparable<E>)peek()).compareTo(tail.getTheData()) < 0;
    }
    public void shuffle(){
        Node<E> temp1 = head, temp2 = tail;
        while (temp1.next != temp2.prev){
            replace(temp1.getTheData(), temp2.getTheData());
            temp1 = temp1.next;
            temp2 = temp2.next;
        }
    }
    @SuppressWarnings("unchecked")
    public int compareHalf(){
        E max1 = peek(), max2 = tail.getTheData();
        Node<E> temp1 = head, temp2 = tail;
        for (int i = 0; i < size()/2 && temp1 != null && temp1.next != null; i++){
            temp1 = temp1.next;
            if (((Comparable<E>)temp1.getTheData()).compareTo(max1) > 0)
                max1 = temp1.getTheData();
        }
        for (int i = size(); i >= size()/2 && temp2.prev != null; i--){
            temp2 = temp2.prev;
            if (((Comparable<E>)temp2.getTheData()).compareTo(max2) > 0)
                max2 = temp2.getTheData();
        }
        int measure = 0;
        if (((Comparable<E>)max1).compareTo(max2)>0)
            measure = 1;
        else if (((Comparable<E>)max1).compareTo(max2)<0)
            measure = -1;
        return measure;
    }
    public void display(){
        Node<E> temp = head;
        System.out.print("List: "+temp.getTheData());
        while (temp != tail){
            temp = temp.next;
            System.out.print("  "+temp.getTheData());
        }
        System.out.println("  "+temp.getTheData());
        System.out.print("Reversed: "+temp.getTheData());
        while (temp != head){
            temp = temp.prev;
            System.out.print("  "+temp.getTheData());
        }
        System.out.println("  "+temp.getTheData());
    }
}