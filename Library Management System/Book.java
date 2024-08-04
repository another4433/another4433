public class Book implements IBook {
    String name, ISBN, bookType, bookLocation, publisher;
    KWArrayList<Person> authors;
    Date issueDate, returnDate;
    long accessNum;
    int yearPublication;
    float fees;
    public Book() {
        name = "Nobody";
        ISBN = "Nothing";
        bookType = "Nothing";
        bookLocation = "Nowhere";
        publisher = "Nobody";
        authors = new KWArrayList<>();
        issueDate = new Date();
        returnDate = new Date();
        fees = 0;
        accessNum = 0;
        yearPublication = 0;
    }
    public Book(String name, String ISBN, String bookType, String bookLocation, String publisher, long accessNum, int yearPublication, float fees, int issueDay, int issueMonth, int issueYear, int returnDay, int returnMonth, int returnYear, int size) {
        this.name = name;
        this.ISBN = ISBN;
        this.bookType = bookType;
        this.bookLocation = bookLocation;
        this.publisher = publisher;
        this.accessNum = (accessNum < 0) ? 0 : accessNum;
        this.yearPublication = Math.max(yearPublication, 0);
        this.fees = Math.max(fees, 0);
        issueDate = new Date(issueDay, issueMonth, issueYear);
        returnDate = new Date(returnDay, returnMonth, returnYear);
        authors = new KWArrayList<>(size);
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getISBN() {
        return ISBN;
    }
    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }
    public String getBookType() {
        return bookType;
    }
    public void setBookType(String bookType) {
        this.bookType = bookType;
    }
    public String getBookLocation() {
        return bookLocation;
    }
    public void setBookLocation(String bookLocation) {
        this.bookLocation = bookLocation;
    }
    public String getPublisher() {
        return publisher;
    }
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    public long getAccessNum() {
        return accessNum;
    }
    public void setAccessNum(long accessNum) {
        this.accessNum = accessNum;
    }
    public int getYearPublication() {
        return yearPublication;
    }
    public void setYearPublication(int yearPublication) {
        this.yearPublication = yearPublication;
    }
    public float getFees() {
        return fees;
    }
    public void setFees(float fees) {
        this.fees = fees;
    }
    public void setIssueDate(int day, int month, int year){
        issueDate = new Date(day, month, year);
    }
    public String getIssueDate(){
        return issueDate.getDate();
    }
    public void setReturnDate(int day, int month, int year){
        returnDate = new Date(day, month, year);
    }
    public String getReturnDate(){
        return returnDate.getDate();
    }
    public float calculateDelayFees(Date date){
        int count = 0;
        int day = date.getDay();
        int month = date.getMonth();
        int year = date.getYear();
        if ((month <= returnDate.getMonth() && year <= returnDate.getMonth()) || (month > returnDate.getMonth() && year <= returnDate.getMonth()))
            return 0;
        if (date.getDay() > returnDate.getDay() && date.getMonth() == returnDate.getMonth() && date.getYear() == returnDate.getYear()){
            while (day > returnDate.getDay()){
                count++;
                day--;
            }
        }
        else if (date.getMonth() > returnDate.getMonth() && date.getYear() == returnDate.getYear()){
            if (date.getMonth() == 2){
                if (date.getYear() % 4 == 0){
                    while (day < 30){
                        count++;
                        day++;
                    }
                }
                else {
                    while (day < 29){
                        count++;
                        day++;
                    }
                }
            }
            else if (date.getMonth() % 2 == 0){
                while (day < 31){
                    count++;
                    day++;
                }
            }
            else {
                while (day < 32){
                    count++;
                    day++;
                }
            }
            day = 1;
            while (day <= returnDate.getDay()){
                count++;
                day++;
            }
        }
        else {
            while (year <= returnDate.getYear() && month != returnDate.getMonth() && day != returnDate.getDay()){
                if (month == 12 && day == 31){
                    month = 1;
                    day = 1;
                    year++;
                }
                else if ((day == 31 && month % 2 != 0) || (day == 30 && month % 2 == 0) || (day == 29 && month == 2 && year % 4 == 0) || (day == 28 && month == 2 && year % 4 != 0)){
                    day = 1;
                    month++;
                }
                else {
                    count++;
                    day++;
                }
            }
        }
        return (float) count / 100;
    }
    public void display(){
        System.out.println("Book Name: "+getName());
        System.out.println("Book ISBN: "+getISBN());
        System.out.println("Book Access Number: "+getAccessNum());
        System.out.println("Book Type: "+getBookType());
        System.out.println("Book Location: "+getBookLocation());
        System.out.println("Book Publisher: "+getPublisher());
        System.out.println("Book year of publication: "+getYearPublication());
        System.out.println("Book fees: "+getFees());
        System.out.println("Book Issue Date: "+getIssueDate());
        System.out.println("Book Return Date: "+getReturnDate());
        System.out.println("List of Book authors: ");
        for (int i = 0; i < authors.size(); i++)
            System.out.println(i+".\n"+authors.get(i));
    }
}
