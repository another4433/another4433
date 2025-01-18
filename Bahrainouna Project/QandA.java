package com.company;

import java.util.*;

public class QandA {
    Date History;
    String Question;
    KWArrayList<Answers> answers;

    public QandA(){
        Question = "Unknown";
        History = null;
        answers = null;
    }
    public QandA(String question, int size) {
        Question = question;
        History = new Date();
        answers = new KWArrayList<>(size);
    }

    public String getQuestion() {
        return Question;
    }
    public void setQuestion(String question) {
        Question = question;
    }
    public Date getHistory() {
        return History;
    }
    public KWArrayList<Answers> getAnswers(){
        return answers;
    }
    public void addAnswer(char key, String answer){
        if (getAnswers().isFull())
            getAnswers().reallocate();
        Answers item = new Answers(key, answer);
        getAnswers().addLast(item);
    }
    public Answers deleteAnswer(char key){
        if (getAnswers().isEmpty())
            return null;
        else {
            int index = -1;
            for (int i = 0; i < getAnswers().size(); i++)
                if (getAnswers().get(i).getKey() == key){
                    index = i;
                    break;
                }
            Answers backup = null;
            if (index > -1)
                backup = new Answers(getAnswers().get(index).getKey(), getAnswers().get(index).getDetail());
            if (backup != null)
                getAnswers().remove(backup);
            return backup;
        }
    }
    public boolean changeAnswer(char oldAnswerKey, Answers newAnswer){
        Answers oldAnswer = null;
        boolean state = false;
        for (Answers item: getAnswers().theData) {
            if (item.getKey() == oldAnswerKey)
                oldAnswer = new Answers(item.getKey(), item.getDetail());
        }
        if (oldAnswer != null) {
            getAnswers().replace(oldAnswer, newAnswer);
            state = true;
        }
        return state;
    }

    public String toString(){
        String writeHistory = "Last Created Question History: "+getHistory();
        String writeQuestion = "\nQuestion: "+getQuestion();
        StringBuilder writeAnswer = new StringBuilder("\nAnswers: ");
        for (Answers item: getAnswers().theData) {
            writeAnswer.append("\n").append(item.toString());
        }
        return writeHistory+writeQuestion+writeAnswer;
    }

    public void display(){
        String writeHistory = "Last Created Question History: "+getHistory();
        String writeQuestion = "Question: "+getQuestion();
        System.out.println(writeHistory);
        System.out.println(writeQuestion);
        System.out.println("Answers: ");
        for (Answers item: getAnswers().theData) {
            System.out.println("\n"+item);
        }
    }
}
