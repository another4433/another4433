@SuppressWarnings("unchecked")
public class KWArrayList<E> implements Generics<E>{
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
