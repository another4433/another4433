import java.io.*;
import java.util.*;
public class User extends Person implements IPerson {
    String username, password, email, phone;
    Date registrationDate;
    boolean suspend = false, active = false;
    KWArrayList<Book> books;
    public User(){
        super();
        username = "username";
        password = "password";
        email = "email";
        phone = "phone";
        registrationDate = new Date();
        books = new KWArrayList<>();
    }
    public User(String name, long id, int day, int month, int year, String username, String password, int register_day, int register_month, int register_year, int size, String email, String phone){
        super(name, id, day, month, year);
        registrationDate = new Date(register_day, register_month, register_year);
        books = new KWArrayList<>(size);
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
    }
    public String getUsername() {
        if (active && !isSuspend())
            return username;
        else
            return "Not allowed to view username!\nPlease! Login first.";
    }
    public void setUsername(String username) {
        if (active && !isSuspend())
            this.username = username;
        else
            System.out.println("Not allowed to change username!\nPlease! Login first.");
    }
    public String getPassword() {
        if (active && !isSuspend())
            return password;
        else
            return "Not allowed to view password!\nPlease! Login first.";
    }
    public void setPassword(String password) {
        if (active && !isSuspend())
            this.password = password;
        else
            System.out.println("Not allowed to change password!\nPlease! Login first.");
    }
    public String getEmail() {
        if (active && !isSuspend())
            return email;
        else
            return "Not allowed to view email!\nPlease! Login first.";
    }
    public void setEmail(String email) {
        if (active && !isSuspend())
            this.email = email;
        else
            System.out.println("Not allowed to change email!\nPlease! Login first.");
    }
    public String getPhone() {
        if (active && !isSuspend())
            return phone;
        else
            return "Not allowed to view phone number!\nPlease! Login first.";
    }
    public void setPhone(String phone) {
        if (active && !isSuspend())
            this.phone = phone;
        else
            System.out.println("Not allowed to change email!\nPlease! Login first.");
    }
    public boolean login(String username, String password){
        if (username.equals("username") || username.equals("password")){
            System.out.println("Login failed.");
            return false;
        }
        else if (!username.equals(this.username) || !password.equals(this.password)){
            System.out.println("Wrong username or password.");
            return false;
        }
        if (isSuspend()){
            System.out.println("Account suspended!");
            return false;
        }
        active = true;
        System.out.println("Account logged in.");
        return true;
    }
    public void forgetLoginDetails(){
        if (!isSuspend()){
            Scanner sc = new Scanner(System.in);
            Random random = new Random();
            PrintWriter printWriter;
            try {
                printWriter = new PrintWriter("num.txt");
                int number = random.nextInt(10);
                printWriter.println("Number = "+number);
                printWriter.println("Use this number to be able to change login details.");
            }
            catch (IOException e){
                System.out.println("Problem with the file.");
                System.out.println(e.getMessage());
            }
            finally {
                Scanner file = new Scanner("num.txt");
                System.out.println("Enter the number that was stored in D:\\Year 3\\ITCS285\\Project\\Library Management System here: ");
                int number = sc.nextInt();
                int num = Integer.parseInt(file.nextLine());
                if (number == num){
                    System.out.println("Enter new username: ");
                    this.username = sc.nextLine();
                    System.out.println("Enter new password: ");
                    this.password = sc.nextLine();
                    System.out.println("Login details are changed.\nLogging in...");
                    System.out.println(login(this.username, this.password));
                    System.out.println("Logged in.");
                }
                else
                    System.out.println("Wrong number.\nFailed to change login details.");
            }
        }
        else
            System.out.println("Cannot perform this operation since your account is suspended!");
    }
    public String getRegistrationDate(){
        if (active)
            return registrationDate.getDate();
        else
            return "Not allowed to change registration date!\nPlease! Login first.";
    }
    public void setRegistrationDate(int day, int month, int year){
        if (active && !isSuspend())
            registrationDate = new Date(day, month, year);
        else
            System.out.println("Not allowed to change registration date!\nPlease! Login first.");
    }
    public boolean isSuspend(){
        return suspend;
    }
    public void setSuspend(boolean suspend){
        this.suspend = suspend;
    }
}
