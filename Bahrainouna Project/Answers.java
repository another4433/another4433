package com.company;

public class Answers {
    char Key;
    String Detail;

    public Answers(char key, String detail) {
        Key = key;
        Detail = detail;
    }

    public char getKey() {
        return Key;
    }
    public void setKey(char key) {
        Key = key;
    }
    public String getDetail() {
        return Detail;
    }
    public void setDetail(String detail) {
        Detail = detail;
    }

    public String toString(){
        return getKey()+". "+getDetail();
    }

    public void display(){
        System.out.println(getKey()+". "+getDetail());
    }
}
