package com.company;

public class Correct {
    int question;
    char answer;

    public Correct(int question, char answer) {
        this.question = question;
        this.answer = answer;
    }

    public int getQuestion() {
        return question;
    }
    public void setQuestion(int question) {
        this.question = question;
    }
    public char getAnswer() {
        return answer;
    }
    public void setAnswer(char answer) {
        this.answer = answer;
    }

    public String toString(){
        return "Selected Question: "+getQuestion()+"\nCorrect Answer Key: "+getAnswer();
    }

    public void display(){
        System.out.println("Selected Question: "+getQuestion());
        System.out.println("Correct Answer Key: "+getAnswer());
    }
}
