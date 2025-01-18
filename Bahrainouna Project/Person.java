package com.company;

import java.util.Calendar;
import java.util.Date;

@SuppressWarnings("deprecation")
public class Person {
    String Name, CPR, TelNum;
    Date DOB, History;
    int age;

    public Person(){
        Name = "No Name";
        CPR = "No CPR";
        TelNum = "No Telephone Number";
        DOB = new Date();
        age = calculateAge();
        History = null;
    }
    public Person(String name, String cpr, String phone, int day, int month, int year){
        Name = name;
        CPR = cpr;
        TelNum = phone;
        DOB = new Date((month-1)+"/"+day+"/"+year);
        age = calculateAge();
        History = new Date();
    }

    private int calculateAge(){
        Date currentDate = new Date();
        String currentString = currentDate.toString();
        String[] currentArray = currentString.split(" ");
        String birthDate = DOB.toString();
        String[] birthArray = birthDate.split(" ");
        int currentYear = Integer.parseInt(currentArray[currentArray.length-1]);
        int birthYear = Integer.parseInt(birthArray[birthArray.length-1]);
        return ((currentDate.getMonth()+1) < (getDate().getMonth()+1) || currentDate.getDate() < getDate().getDate()) ? (currentYear - birthYear) - 1 : currentYear - birthYear;
    }
    public void setName(String name){
        Name = name;
    }
    public void setCPR(String cpr){
        CPR = cpr;
    }
    public void setTelNum(String phone){
        TelNum = phone;
    }
    public void setDOB_and_Age(int day, int month, int year){
        int realMonth = month-1;
        switch (realMonth) {
            case 0 -> DOB.setMonth(Calendar.JANUARY);
            case 1 -> DOB.setMonth(Calendar.FEBRUARY);
            case 2 -> DOB.setMonth(Calendar.MARCH);
            case 3 -> DOB.setMonth(Calendar.APRIL);
            case 4 -> DOB.setMonth(Calendar.MAY);
            case 5 -> DOB.setMonth(Calendar.JUNE);
            case 6 -> DOB.setMonth(Calendar.JULY);
            case 7 -> DOB.setMonth(Calendar.AUGUST);
            case 8 -> DOB.setMonth(Calendar.SEPTEMBER);
            case 9 -> DOB.setMonth(Calendar.OCTOBER);
            case 10 -> DOB.setMonth(Calendar.NOVEMBER);
            case 11 -> DOB.setMonth(Calendar.DECEMBER);
            default -> {
                System.out.println("Cannot set the month!");
                System.out.println("Month number should be in range of 1 - 12.");
            }
        }
        DOB.setDate(day);
        DOB.setYear((year%10)+100);
        age = calculateAge();
    }

    public String getName(){
        return Name;
    }
    public String getCPR(){
        return CPR;
    }
    public String getTelNum(){
        return TelNum;
    }
    public Date getDate(){
        return DOB;
    }
    public int getAge(){
        return age;
    }
    public Date getHistory() { return History; }

    @Override
    public int hashCode() {
        int result = Name.hashCode();
        result = 31 * result + CPR.hashCode();
        result = 31 * result + TelNum.hashCode();
        result = 31 * result + DOB.hashCode();
        result = 31 * result + (History != null ? History.hashCode() : 0);
        result = 31 * result + age;
        return result;
    }

    public void display(){
        System.out.println("Name: "+getName());
        System.out.println("CPR: "+getCPR());
        System.out.println("Telephone Number: "+getTelNum());
        System.out.println("Date of birth: "+getDate());
        System.out.println("Age: "+getAge());
        System.out.println("Last Person Created History: "+getHistory());
    }

    public String toString(){
        return "Name: "+getName()+"\nCPR: "+getCPR()+"\nTelephone Number: "+getTelNum()+"\nDate of Birth: "+getDate()+"\nAge: "+getAge()+"\nLast Person History: "+getHistory();
    }

    public static void main(String[] args) {
        Person testPerson = new Person("Ali Mohamed Ali Hassan AbdAli", "011110821", "+97339266642", 29, 11, 2001);
        testPerson.display();
        Date currenDate = new Date();
        System.out.println(currenDate);
    }
}