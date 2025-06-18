public interface listInt {
    int constant = 10;
    String get(int index);
    int bigger();
    int capacity();
    int size();
    int index();
    void display();
    boolean add(String item);
    boolean delete();
    boolean replace(String oldItem, String newItem);
    String set(int index, String item);
    boolean search(String item);
    void clear();
    int indexOf(String item);
}
