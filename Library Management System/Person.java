import java.util.Scanner;
public class Person implements IPerson {
    String name;
    long id;
    int age;
    public Person(){
        name = "Nobody";
        id = 0;
        age = 0;
    }
    public int calculateAge(int day, int month, int year){
        Date birthDate = new Date(day, month, year);
        Scanner sc = new Scanner(System.in);
        Date currentDate = new Date();
        System.out.println("Enter today's day number: ");
        int currentDay = sc.nextInt();
        currentDate.setDay(currentDay);
        System.out.println("Enter today's month number: ");
        int currentMonth = sc.nextInt();
        currentDate.setMonth(currentMonth);
        System.out.println("Enter today's year number: ");
        int currentYear = sc.nextInt();
        currentDate.setYear(currentYear);
        System.out.println("Today's date: "+currentDate.getDate());
        return currentDate.getYear() - birthDate.getYear();
    }
    public Person(String name, long id, int day, int month, int year){
        this.name = name;
        this.id = (id < 0) ? 0 : id;
        age = calculateAge(day, month, year);
    }
    @Override
    public String getName() {
        return name;
    }
    @Override
    public void setName(String name) {
        this.name = name;
    }
    public long getID() {
        return id;
    }
    public void setID(long id) {
        this.id = id;
    }
    @Override
    public int getAge() {
        return age;
    }
    public void setAge(int day, int month, int year) {
        this.age = calculateAge(day, month, year);
    }
    public void display(){
        System.out.println("Person Name: "+getName());
        System.out.println("Person ID: "+getID());
        System.out.println("Person Age: "+getAge());
    }
}
