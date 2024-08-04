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
