package com.company;

import java.util.Date;
import java.util.Objects;

public class Login {
    String Email, Password, CPR;
    Date History;

    public Login(){
        Email = "No email";
        Password = "No Password";
        CPR = "No CPR";
        History = null;
    }
    public Login(String email, String password, String CPR) {
        Email = email;
        Password = password;
        this.CPR = CPR;
        History = new Date();
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
    public String getCPR() {
        return CPR;
    }
    public void setCPR(String CPR) {
        this.CPR = CPR;
    }
    public Date getHistory(){
        return History;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Login login = (Login) o;

        if (!Email.equals(login.Email)) return false;
        if (!Password.equals(login.Password)) return false;
        if (!CPR.equals(login.CPR)) return false;
        return Objects.equals(History, login.History);
    }

    @Override
    public int hashCode() {
        int result = Email.hashCode();
        result = 31 * result + Password.hashCode();
        result = 31 * result + CPR.hashCode();
        result = 31 * result + (History != null ? History.hashCode() : 0);
        return result;
    }

    public void display(){
        System.out.println("CPR: "+getCPR());
        System.out.println("Email: "+getEmail());
        System.out.println("Password: "+getPassword());
        System.out.println("Last Login History: "+getHistory());
    }
    public String toString(){
        return "CPR: "+getCPR()+"\nEmail: "+getEmail()+"\nPassword: "+getPassword()+"\nLast Login History: "+getHistory();
    }
}
