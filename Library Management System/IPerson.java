public interface IPerson {
    void setName(String name);
    void setAge(int day, int month, int year);
    void setID(long id);
    String getName();
    int getAge();
    long getID();
    int calculateAge(int day, int month, int year);
    void display();
}
