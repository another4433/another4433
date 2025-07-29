using System;
using System.Text;
using Proparation;

namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<List<Course>> coursesLists = new List<List<Course>>();
            List<double> creditsList = new List<double>();
            double totalCredits = 0.0;
            int courseCount = 0;
            int semesterCount = 0;
            Console.WriteLine("Welcome to Polytechnic Grading System!");
            Console.Write("Enter the number of semesters: ");
            semesterCount = int.Parse(Console.ReadLine()!);
            for (int i = 0; i < semesterCount; i++)
            {
                Console.Write($"Enter the number of courses for semester {i + 1}: ");
                courseCount = int.Parse(Console.ReadLine()!);
                List<Course> semesterCourses = new List<Course>();
                List<double> semesterCredits = new List<double>();
                for (int j = 0; j < courseCount; j++)
                {
                    Console.Write($"Enter details for course {j + 1} (Name, Code, Letter Grade): ");
                    string[] courseDetails = Console.ReadLine()!.Split(',');
                    if (courseDetails.Length != 3)
                    {
                        Console.WriteLine("Invalid input. Please enter exactly 4 values.");
                        j--;
                        continue;
                    }
                    string name = courseDetails[0].Trim();
                    string code = courseDetails[1].Trim();
                    string letterGrade = courseDetails[2].Trim();
                    double creditValue = 0;
                    switch (letterGrade)
                    {
                        case "A+":
                            creditValue = 4.0;
                            break;
                        case "A":
                            creditValue = 3.75;
                            break;
                        case "A-":
                            creditValue = 3.5;
                            break;
                        case "B+":
                            creditValue = 3.25;
                            break;
                        case "B":
                            creditValue = 3.0;
                            break;
                        case "B-":
                            creditValue = 2.75;
                            break;
                        case "C+":
                            creditValue = 2.5;
                            break;
                        case "C":
                            creditValue = 2.25;
                            break;
                    }
                    Course course = new Course(name, code, letterGrade);
                    course.Credits = creditValue;
                    semesterCourses.Add(course);
                    semesterCredits.Add(creditValue);
                }
                coursesLists.Add(semesterCourses);
                double credit = 0;
                for (int k = 0; k < semesterCredits.Count; k++)
                {
                    credit += semesterCredits[k];
                }
                credit = credit / semesterCredits.Count;
                creditsList.Add(credit);
            }
            for (int i = 0; i < creditsList.Count; i++)
            {
                totalCredits += creditsList[i];
            }
            totalCredits = totalCredits / creditsList.Count;
            Console.WriteLine("Courses and Credits Summary: \n");
            for (int i = 0; i < coursesLists.Count; i++)
            {
                Console.WriteLine($"Semester {i + 1}:");
                foreach (var course in coursesLists[i])
                {
                    course.Display();
                    Console.WriteLine();
                }
                Console.WriteLine($"Average Credits for Semester {i + 1}: {creditsList[i]} \n");
            }
            Console.WriteLine($"Total Credits across all semesters: {totalCredits}");
        }
    }
}
