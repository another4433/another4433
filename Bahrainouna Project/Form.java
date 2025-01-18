package com.company;

import java.util.*;

public class Form {
    String Name;
    Register Owner;
    Date History;
    KWLinkedList<QandA> Questions_and_Answers;
    ArrayQueue<String> Questions;
    KWArrayList<Answers> TheAnswers;
    ArrayQueue<Character> Key;
    LinkedStack<Correct> Corrections;

    public Form(){
        Name = "No Name";
        History = new Date();
        Owner = new Register();
        Questions_and_Answers = new KWLinkedList<>();
        Questions = new ArrayQueue<>();
        TheAnswers = new KWArrayList<>();
        Key = new ArrayQueue<>();
        Corrections = new LinkedStack<>();
    }

    public Form(String name, String username, String cpr, String telephone, int day, int month, int year, String email, String password, int size1, int size2) {
        Name = name;
        History = new Date();
        Owner = new Register(username, cpr, telephone, day, month, year, email, password);
        Questions_and_Answers = new KWLinkedList<>();
        Questions = new ArrayQueue<>(size1);
        TheAnswers = new KWArrayList<>(size2);
        Key = new ArrayQueue<>(size1);
        Corrections = new LinkedStack<>();
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public Date getHistory() {
        return History;
    }

    public KWLinkedList<QandA> getQuestions_and_Answers() {
        return Questions_and_Answers;
    }

    public ArrayQueue<String> getQuestions() {
        return Questions;
    }

    public KWArrayList<Answers> getAnswers() {
        return TheAnswers;
    }

    public ArrayQueue<Character> getKey() {
        return Key;
    }

    public LinkedStack<Correct> getCorrections() {
        return Corrections;
    }

    public Register setOwner(Register owner){
        Register backup = Owner;
        Owner = owner;
        return backup;
    }

    public String generateForm(){
        Scanner sc = new Scanner(System.in);
        Date generated = new Date();
        for (int i = 0; i < Questions.capacity(); i++){
            int size;
            do {
                System.out.print("Enter number of answers in question "+(i+1)+": ");
                size = sc.nextInt();
                String nothing = sc.nextLine();
            }
            while (size < 1);
            System.out.println("Write the question below: ");
            String question = sc.nextLine();
            QandA questionsAnswers = new QandA(question, size);
            for (int j = 0; j < size; j++){
                char answerKey;
                String theAnswer;
                if (j == 0){
                    System.out.print("Type any letter for answer key: ");
                    answerKey = sc.next().charAt(0);
                    System.out.println("Write the complete answer for the question below: ");
                    theAnswer = sc.nextLine();
                }
                else {
                    System.out.print("Type any letter for another answer key: ");
                    answerKey = sc.next().charAt(0);
                    System.out.println("Write the another complete answer for the question below: ");
                    theAnswer = sc.nextLine();
                }
                questionsAnswers.addAnswer(answerKey, theAnswer);
            }
            getQuestions_and_Answers().add(questionsAnswers);
        }
        generateQuestions();
        generateAnswers();
        if (setCorrections())
            System.out.println("Correct answers have been initialized successfully!");
        else
            throw new Error("Cannot initialize correct answers! Contact Admin.");
        return "This form have been generated on "+generated;
    }

    private void generateQuestions(){
        for (int i = 0; i < getQuestions_and_Answers().size(); i++){
            String retrieved = getQuestions_and_Answers().get(i).getQuestion();
            getQuestions().addLast(retrieved);
        }
    }

    private void generateAnswers(){
        for (int i = 0; i < getQuestions_and_Answers().size(); i++){
            for (int j = 0; j < getQuestions_and_Answers().get(i).getAnswers().size(); j++){
                char answerKey = getQuestions_and_Answers().get(i).getAnswers().get(j).getKey();
                String answerDetails = getQuestions_and_Answers().get(i).getAnswers().get(j).getDetail();
                Answers complete = new Answers(answerKey, answerDetails);
                getAnswers().addFirst(complete);
            }
        }
    }

    private boolean setCorrections(){
        Scanner sc = new Scanner(System.in);
        ArrayStack<Correct> copy = new ArrayStack<>();
        ArrayQueue<String> temp = new ArrayQueue<>(getQuestions());
        System.out.println("List of Questions with their answers: ");
        getQuestions_and_Answers().display();
        System.out.println("Questions with their answers are listed above.");
        while (!temp.isEmpty()){
            int qNumber = temp.getFront()+1;
            System.out.println("Question "+qNumber+": "+temp.peek());
            System.out.print("Enter the answer key as letter for question "+qNumber+": ");
            char aKey = sc.next().charAt(0);
            Correct object = new Correct(qNumber-1, aKey);
            copy.add(object);
            temp.removeFirst();
        }
        while (!copy.isEmpty())
            Corrections.push(copy.removeFirst());
        return temp.isEmpty() && copy.isEmpty();
    }

    public String answerQuestions(){
        Scanner scanner = new Scanner(System.in);
        Date generator = new Date();
        while (!getQuestions().isEmpty()){
            System.out.println("Question: "+getQuestions().peek());
            getAnswers().display();
            System.out.print("Type the answer key as letter here: ");
            char myKey = scanner.next().charAt(0);
            getQuestions().remove(getQuestions().peek());
            getKey().addFirst(myKey);
        }
        return "This form have been answered on "+generator;
    }

    public String correctAnswers(){
        Date generator = new Date();
        int total = 0, earned = 0;
        while (!getKey().isEmpty()){
            Character temp = getKey().remove(getKey().peek());
            if (temp.compareTo(getCorrections().peek().getAnswer()) == 0 && total == getCorrections().peek().getQuestion())
                earned++;
            total++;
        }
        System.out.println("This form have been corrected on "+generator);
        return "Score = "+earned+"/"+total;
    }

    public void display(){
        System.out.println("Name of the form: "+getName());
        setOwner(Owner).display();
        System.out.println("Last created form history: "+getHistory());
        System.out.println("List of questions and answers: ");
        getQuestions_and_Answers().display();
        System.out.println("Correct answers to questions: ");
        getCorrections().display();
    }

    public String toString(){
        return "Name of the form: "+getName()+"\n"+setOwner(Owner)+"\nLast created form history: "+getHistory()+"\nList of questions and answers: "+getQuestions_and_Answers();
    }
}
