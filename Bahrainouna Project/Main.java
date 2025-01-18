package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int size;
        do {
            System.out.print("Enter number of answers in question: ");
            size = sc.nextInt();
            String nothing = sc.nextLine();
        }
        while (size < 1);
        System.out.println("Write the question here: ");
        String question = sc.nextLine();
        System.out.print(question);
    }
}
