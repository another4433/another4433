package com.company;

import java.util.Date;

public class Register extends Person {
    String Email, Password;

    public Register() {
        super();
        Email = "No Email";
        Password = "No Password";
    }

    public Register(String name, String cpr, String phone, int day, int month, int year, String email, String password) {
        super(name, cpr, phone, day, month, year);
        Email = email;
        Password = password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public void display(){
        System.out.println("Name: "+getName());
        System.out.println("CPR: "+getCPR());
        System.out.println("Telephone Number: "+getTelNum());
        System.out.println("Date of birth: "+getDate());
        System.out.println("Age: "+getAge());
        System.out.println("Email: "+getEmail());
        System.out.println("Password: "+getPassword());
        System.out.println("Last Person Created History: "+getHistory());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Register register = (Register) o;

        if (!Email.equals(register.Email)) return false;
        return Password.equals(register.Password);
    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + Email.hashCode();
        result = 31 * result + Password.hashCode();
        return result;
    }

    public String toString(){
        return "Name: "+getName()+"\nCPR: "+getCPR()+"\nTelephone Number: "+getTelNum()+"\nDate of Birth: "+getDate()+"\nAge: "+getAge()+"\nLast Person History: "+getHistory()+"\nEmail: "+getEmail()+"\nPassword: "+getPassword();
    }

    public static void main(String[] args) {
        Person testPerson = new Person("Ali Mohamed Ali Hassan AbdAli", "011110821", "+97339266642", 29, 11, 2001);
        testPerson.display();
        Register testRegister = new Register();
        testRegister.display();
        Date currenDate = new Date();
        System.out.println(currenDate);
    }
}
