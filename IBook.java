public interface IBook {
    void setName(String name);
    void setISBN(String id);
    void setBookType(String bookType);
    void setBookLocation(String bookLocation);
    void setAccessNum(long accessNum);
    void setPublisher(String publisher);
    void setYearPublication(int yearPublication);
    String getName();
    String getISBN();
    String getBookType();
    String getBookLocation();
    long getAccessNum();
    String getPublisher();
    int getYearPublication();
    void setFees(float fees);
    float getFees();
    void display();
}
