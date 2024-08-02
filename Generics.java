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