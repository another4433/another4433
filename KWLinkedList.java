@SuppressWarnings("unchecked")
public class KWLinkedList<E> implements listInt<E> {
    public static class Node<E> {
        Node<E> prev, next;
        E theData;
        private Node(E item){
            prev = null;
            theData = item;
            next = null;
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
        size = 0;
    }
    public class Iterator {
        Node<E> ptr;
        int count = 0;
        protected Iterator(){
            ptr = head;
        }
        protected Iterator(Node<E> node){
            ptr = node;
        }
        protected boolean hasNext(){
            return ptr.next != null;
        }
        protected boolean hasPrevious(){
            return ptr.prev != null;
        }
        protected E getPointerData(){
            return ptr.getTheData();
        }
        protected E next(){
            if (!hasNext())
                return getPointerData();
            ptr = ptr.next;
            count++;
            return getPointerData();
        }
        protected E previous(){
            if (!hasPrevious())
                return getPointerData();
            ptr = ptr.prev;
            count--;
            return getPointerData();
        }
    }
    public Iterator listIterator(){
        return new Iterator();
    }
    public Iterator listIterator(Node<E> node){
        return new Iterator(node);
    }
    public int getSize(){
        return size;
    }
    public boolean isRange(int index){
        return index >= 0 && index < getSize();
    }
    public boolean isEmpty(){
        return getSize() == 0;
    }
    public boolean isSorted(){
        Node<E> temp1 = head, temp2 = temp1.next;
        while (temp1.next != null && temp2 != null){
            if (((Comparable<E>)temp1.getTheData()).compareTo(temp2.getTheData()) > 0)
                return false;
            temp1 = temp1.next;
            temp2 = temp2.next;
        }
        return true;
    }
    public E get(int index){
        if (isRange(index)){
            Node<E> temp = head;
            for (int i = 0; i <= index && temp.next != null; i++)
                temp = temp.next;
            return temp.getTheData();
        }
        return null;
    }
    public int indexOf(E item){
        Node<E> temp = head;
        for (int i = 0; i < getSize() && temp.next != null; i++){
            if (((Comparable<E>)temp.getTheData()).compareTo(item) == 0)
                return i;
            temp = temp.next;
        }
        return -1;
    }
    public boolean search(E item){
        return indexOf(item) != -1;
    }
    public void addFirst(E item){
        Node<E> newNode = new Node<>(item);
        if (isEmpty())
            tail = newNode;
        else {
            newNode.next = head;
            head.prev = newNode;
        }
        head = newNode;
        size++;
    }
    public void addLast(E item){
        Node<E> newNode = new Node<>(item);
        if (isEmpty())
            head = newNode;
        else {
            newNode.prev = tail;
            tail.next = newNode;
        }
        tail = newNode;
        size++;
    }
    public void add(E item, int location){
        Node<E> newNode = new Node<>(item);
        Node<E> temp1 = head, temp2 = temp1.next;
        if (isEmpty())
            addLast(item);
        else if (isRange(location)){
            if (location == 0)
                addFirst(item);
            else if (location == getSize()-1)
                addLast(item);
            else {
                for (int i = 0; i < location && temp1.next != null && temp2.next != null; i++){
                    temp1 = temp1.next;
                    temp2 = temp2.next;
                }
                temp1.next = newNode;
                newNode.prev = temp1;
                temp2.prev = newNode;
                newNode.next = temp2;
                size++;
            }
        }
        else
            System.out.println("Element not added to the list.");
    }
    public boolean deleteLast(){
        if (isEmpty())
            return false;
        else {
            tail = tail.prev;
            size--;
            return true;
        }
    }
    public boolean deleteFirst(){
        if (isEmpty())
            return false;
        else {
            head = head.next;
            size--;
            return true;
        }
    }
    public boolean delete(E item){
        if (search(item)){
            int location = indexOf(item);
            if (location == 0)
                return deleteFirst();
            else {
                Node<E> temp1 = head, temp2 = tail;
                for (int i = 0; i < location && temp1.next != null; i++)
                    temp1 = temp1.next;
                for (int j = getSize()-1; j > 0 && temp2.prev != null; j--){
                    if (((Comparable<E>)temp2.getTheData()).compareTo(item) == 0)
                        break;
                    else
                        temp2 = temp2.prev;
                }
                temp1.next = temp2.next;
                size--;
                return ((Comparable<E>)temp2.getTheData()).compareTo(item) == 0;
            }
        }
        return false;
    }
    public int sort(){
        int count = 0;
        boolean flag = true;
        Node<E> temp1 = head, temp2 = head.next;
        for (int i = 0; i < getSize()-i; i++){
            while (temp1.next != null && temp2.next != null){
                if (((Comparable<E>)temp1.getTheData()).compareTo(temp2.getTheData()) > 0){
                    E temp = temp1.getTheData();
                    temp1.theData = temp2.theData;
                    temp2.theData = temp;
                    count++;
                    flag = false;
                }
                temp1 = temp1.next;
                temp2 = temp2.next;
            }
            temp1 = head;
            temp2 = head.next;
            if (flag)
                break;
        }
        return count;
    }
    public E set(int location, E item){
        if (isRange(location)){
            Node<E> temp = head;
            for (int i = 0; i <= location && temp.next != null; i++)
                temp = temp.next;
            E backup = temp.getTheData();
            temp.theData = item;
            return backup;
        }
        return null;
    }
    public boolean replace(E oldItem, E newItem){
        return set(indexOf(oldItem), newItem) != null;
    }
    public void copy(KWLinkedList<E> otherList){
        Iterator iterator = otherList.listIterator();
        addLast(iterator.getPointerData());
        while (iterator.hasNext())
            addLast(iterator.next());
    }
    public void clear(){
        while (!isEmpty())
            deleteFirst();
    }
    public void removeAll(E item){
        boolean flag;
        do {
            flag = delete(item);
        }
        while (flag);
    }
    public void addOnce(E item){
        Iterator iterator = listIterator(tail);
        if (((Comparable<E>)iterator.getPointerData()).compareTo(item) == 0)
            return;
        while (iterator.hasPrevious())
            if (((Comparable<E>)iterator.previous()).compareTo(item) == 0)
                return;
        addLast(item);
    }
    public void removeSecond(E item){
        boolean flag = false;
        Iterator iterator = listIterator(head);
        if (((Comparable<E>)iterator.getPointerData()).compareTo(item) == 0)
            flag = true;
        while (iterator.hasNext()){
            if (((Comparable<E>)iterator.next()).compareTo(item) == 0 && !flag)
                flag = true;
            else if (((Comparable<E>)iterator.next()).compareTo(item) == 0 && flag){
                delete(item);
                break;
            }
        }
    }
    public boolean compareListHalf(KWLinkedList<E> list){
        Iterator iterator1 = list.listIterator();
        Iterator iterator2 = listIterator(tail);
        E max1 = iterator1.getPointerData(), max2 = iterator2.getPointerData();
        while (iterator1.hasNext()){
            E value1 = iterator1.next();
            if (((Comparable<E>)value1).compareTo(max1) > 0)
                max1 = value1;
        }
        while (iterator2.hasPrevious()){
            E value2 = iterator2.previous();
            if (((Comparable<E>)value2).compareTo(max2) > 0)
                max2 = value2;
        }
        return ((Comparable<E>) max1).compareTo(max2) > 0;
    }
    public String toString(){
        Iterator iterator = listIterator();
        StringBuilder stringBuilder = new StringBuilder("Size = "+getSize()+"\n");
        stringBuilder.append("List: ").append(iterator.getPointerData());
        if (getSize() > 0)
            while (iterator.hasNext())
                stringBuilder.append(", ").append(iterator.next());
        return stringBuilder.toString();
    }
}
