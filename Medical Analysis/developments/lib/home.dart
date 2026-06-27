import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medical_app/appointment.dart';
import 'package:medical_app/people_relation.dart';
import 'package:medical_app/testRelation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medical_app/doctor.dart';
import 'package:medical_app/patient.dart';
import 'package:medical_app/case.dart';
import 'package:medical_app/test.dart';
import 'package:medical_app/the_stack.dart';
import 'package:medical_app/profile_viewing.dart';
import 'package:medical_app/main.dart';
import 'package:medical_app/text_detailing.dart';
import 'package:medical_app/FileListPage_replacement.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCFu4xN36YkpwLWyhRVfk7uyFFAuCRyJRc",
      authDomain: "medical-c2099.firebaseapp.com",
      projectId: "medical-c2099",
      messagingSenderId: "904716379854",
      appId: "1:904716379854:web:50227d166d39e82eca929f",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
      ),
      home: const HomeManipulation(title: 'Medical HomePage'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TheTabs extends StatelessWidget {
  const TheTabs({super.key, required this.theService});

  final AuthService theService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ProfileViewing(theService: theService),
                    ),
                  );
                },
                icon: Icon(Icons.person),
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.chat, color: Colors.black),
                  child: Text(
                    "Chatbot",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.collections_bookmark_outlined,
                    color: Colors.black,
                  ),
                  child: Text(
                    "Data Collection",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.file_present_outlined, color: Colors.black),
                  child: Text(
                    "File Management",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.construction_outlined, color: Colors.black),
                  child: Text(
                    "Under Construction",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              HomeManipulation(title: "Assistance"),
              OptionSelector(),
              FileListPage(),
              MaybeDashboard(),
            ],
          ),
        ),
      ),
    );
  }
}

class MaybeDashboard extends StatelessWidget {
  const MaybeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Page Under Construction", selectionColor: Colors.red),
      content: Text("This page is under construction, so it is not ready yet."),
      icon: Icon(Icons.event_busy),
      iconColor: Colors.red,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("OK"),
        ),
      ],
    );
  }
}

class HomeManipulation extends StatefulWidget {
  const HomeManipulation({super.key, required this.title});

  final String title;

  @override
  State<HomeManipulation> createState() => _HomeManipulationState();
}

class _HomeManipulationState extends State<HomeManipulation> {
  final ScrollController _controllerScroll = ScrollController();
  TheStack<String> chatSession = TheStack();
  List<String>
  questions = [
    "What is the purpose of this system?",
    "What is this system aiming for?",
    "What is the goal of this system?",
    "Give me an overview of this system.",
    "What is the main feature of this system?",
    "What features are included in this system?",
    "How does this system work?",
    "What are the inputs that this system accepts?",
    "What are your recommendations?",
    "Give me a recommendation.",
    "What do you recommend?",
    "Recommend me something.",
    "How secure is this system?",
    "Explain to me about the system design.",
    "Provide me reasons for this system design.",
    "How do I navigate through this system?",
    "Explain to me about the first tab.",
    "Explain to me about the second tab.",
    "Explain to me about the third tab.",
    "Explain to me about the fourth tab.",
    "What are the expected outputs from this system?",
    "What is the disclaimer of this system?",
    "Tell me about a disclaimer of this system.",
    "When will the fourth tab be available?",
  ],
  answers = [
    "Project Overview: \nLabLens AI is an AI-powered clinical decision-support system that helps users and healthcare professionals understand lab results more clearly.",
    "System Goal: \nThe goal is to support early risk awareness, detect important lab trends, and improve healthcare decision-making without replacing doctors. \nIn short, the system goal is to simplify medical data from the users.",
    "Features Included: \nThe system includes lab report upload, \nOCR text extraction, lab value analysis, symptom assessment, \nhistorical trend comparison, risk scoring, \nexplainable AI insights, and a dashboard.",
    "Main Feature: \nThe systems collects inputs through prompts and files to be analyzed to provide simplified and better results from the input about medical.",
    "How It Works: \nThe user uploads a lab report or provide inputs as prompts, \nthe system extracts lab values using OCR, \nanalyzes symptoms and previous results, detects trends, \ngenerates a risk level, and provides a clear explanation.",
    "User input: \nPatient data, doctor data, case data, test data, appointment data, \npatient with doctor relations, matching test with patients, and files.",
    "Recommendation: \nProvide manual inputs after selecting the options provided for better analysis and it is optional to upload files.",
    "Security: \nThe system is accessible through accounts. \nMeaning that you will need an account to access the system. \nYour account information is guaranteed safe when account is created.",
    "Explanation of the design: \nWhen you enter the system, it will show blank page for a while to load the designs. \nOnce the designs are loaded, you are greeted with the login page including the logo picture. \nOnce you signed in, you will see multiple tabs on top of the screen including the profile icon located at the top right of the screen.",
    "First tab explanation: \nThis tab is the chatbot agent to answer your questions. \nIf you are not satisfied with your answer, send an email to the admin \"alimohamedhassan9@outlook.com\" and ask your question with optional screenshot of your screen and you will receive your reply soon.",
    "Second tab explanation: \nThis tab will show options to select before you view the list to manage the selected data in the list. \nYou can add, delete, or edit the data you selected it. \nYou will receive explanation of the specific data you select from the list of a grouped data.",
    "Third tab explanation: \nThis tab allows you to upload a file so that the system receive it to analyze it. \nYou will receive explanation of the selected file after uploading.",
    "Fourth tab explanation: \nThis tab is currently unavailable due to construction in progress. \nHowever, this tab is meant to show the simplified results that you were looking for. \nExplanation of this tab is coming soon.",
    "System Output: \nRisk level, trend analysis, key findings, explanations, \nfollow-up recommendations, list of a specific data group, and data overview.",
    "Disclaimer: \nThis system does not diagnose diseases or replace professional medical advice. \nIt is designed only to support decision-making and early awareness. \nIt also supports viewing and using data per selections.",
    "The fourth tab or dashboard tab will be available as soon as possible.",
    "Account deletion is currently unavailable in this system. Send email to \"alimohamedhassan9@outlook.com\" to request delete account.",
    "Language support: \"English\" only",
  ];
  TextEditingController prompt = TextEditingController();
  List<Widget> theList = [
    Card(
      child: ListTile(
        title: Text("Server"),
        subtitle: Text("Hello there, nice to meet you! How may I help you?"),
      ),
    ),
  ];
  String prevPrompt = "";

  bool theContains(String long, String short) {
    int count = 0;
    bool found = false, exact = false;
    String created = "";
    List<String> theSplitted = long.split(" ");
    for (String selectedMan in theSplitted) {
      if (selectedMan == short) {
        exact = true;
        break;
      }
    }
    if (exact == false) {
      for (int i = 0; i < long.length; i++) {
        if (long[i] == short[count]) {
          created += short[count];
          count++;
          if (count == short.length) {
            exact = true;
            break;
          } else if (created == short) {
            found = true;
            break;
          }
          if (count > 2) {
            found = true;
          } else {
            found = false;
          }
        }
      }
      return exact || found || count == short.length - 1;
    }
    return exact;
  }

  Widget widgetSelect(int num) {
    switch (num) {
      case 0:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          OverviewExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 1:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          GoalExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 2:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          FeaturesExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 3:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          MainExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 4:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          WorkingExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 5:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          InputExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 6:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          RecommendationExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 7:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          SecurityExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 8:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          DesignExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 9:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          ChatTabExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 10:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          DataTabExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 11:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          FileTabExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 12:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          UnavailableTabExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 13:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          SystemOutputExplanation(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
      case 14:
        return IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (BuildContext context) =>
                          TheDisclaimer(details: answers[num]),
                ),
              );
            });
          },
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.purple,
        );
    }
    return Placeholder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Scrollbar(
        controller: _controllerScroll,
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 5,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          controller: _controllerScroll,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: theList.length,
            itemBuilder: (context, index) {
              return theList[index];
            },
          ),
        ),
      ),
      bottomSheet: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  do {
                    chatSession.pop();
                    theList.removeLast();
                  } while (!chatSession.isEmpty());
                  setState(() {});
                },
                child: Text("Clear"),
              ),
              SizedBox(width: 15),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: prompt,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter a message",
                  ),
                ),
              ),
              SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  if (prevPrompt != prompt.text) {
                    chatSession.push(prompt.text);
                    theList.add(
                      Card(
                        child: ListTile(
                          title: Text("Client"),
                          subtitle: Text(prompt.text),
                        ),
                      ),
                    );
                    questions.add(prompt.text);
                    if (chatSession.peek().toLowerCase() == "hi" ||
                        chatSession.peek().toLowerCase() == "hello" ||
                        chatSession.peek().toLowerCase() == "hey" ||
                        chatSession.peek().toLowerCase() == "yo") {
                      chatSession.push(
                        "Hello there, nice to meet you! How may I help you?",
                      );
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "overview",
                        ) ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "purpose",
                        )) {
                      chatSession.push("${answers[0].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(0),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "goal",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "aim")) {
                      chatSession.push("${answers[1].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(1),
                          ),
                        ),
                      );
                    } else if (theContains(
                      chatSession.peek().toLowerCase(),
                      "includ",
                    )) {
                      chatSession.push("${answers[2].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(2),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "feature",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "main")) {
                      chatSession.push("${answers[3].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(3),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "work",
                        ) ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "system",
                        )) {
                      chatSession.push("${answers[4].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(4),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "input",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "user")) {
                      chatSession.push("${answers[5].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(5),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "recommend",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "pro")) {
                      chatSession.push("${answers[6].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(6),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "secur",
                        ) ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "project",
                        )) {
                      chatSession.push("${answers[7].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(7),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "explain",
                        ) ||
                        RegExp(
                          chatSession.peek(),
                          caseSensitive: false,
                        ).hasMatch("design") ||
                        chatSession.peek().toLowerCase().contains("navigat")) {
                      chatSession.push("${answers[8].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(8),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "chat",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "bot") ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "assist",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "ai") ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "first",
                        ) ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "intel",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "art") ||
                        theContains(chatSession.peek(), "1st")) {
                      chatSession.push("${answers[9].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(9),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "language",
                        ) ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "support",
                        ) ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "chang",
                        )) {
                      chatSession.push(answers[17]);
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "data",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "app") ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "second",
                        ) ||
                        theContains(chatSession.peek(), "2nd")) {
                      chatSession.push("${answers[10].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(10),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "file",
                        ) ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "report",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "lab") ||
                        theContains(chatSession.peek().toLowerCase(), "load") ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "third",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "3rd")) {
                      chatSession.push("${answers[11].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(11),
                          ),
                        ),
                      );
                    } else if (theContains(
                      chatSession.peek().toLowerCase(),
                      "example",
                    )) {
                      chatSession.push(
                        "${questions[0]}, ${questions[1].substring(0, 5)}....",
                      );
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (BuildContext context) =>
                                              ETheQuestions(
                                                receivedQuestions: questions,
                                              ),
                                    ),
                                  );
                                });
                              },
                              icon: Icon(Icons.arrow_forward_ios),
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "output",
                        ) ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "program",
                        )) {
                      chatSession.push("${answers[13].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(13),
                          ),
                        ),
                      );
                    } else if (theContains(
                      chatSession.peek().toLowerCase(),
                      "disclaimer",
                    )) {
                      chatSession.push("${answers[14].substring(0, 16)}....");
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(14),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "account",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "user") ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "profile",
                        ) ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "delet",
                        )) {
                      chatSession.push(answers[16]);
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                          ),
                        ),
                      );
                    } else if (RegExp(
                          chatSession.peek(),
                          caseSensitive: false,
                        ).hasMatch("yes") ||
                        RegExp(
                          chatSession.peek(),
                          caseSensitive: false,
                        ).hasMatch("no")) {
                      chatSession.push(
                        "Thank you for your answer! How may I help you?",
                      );
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.pop()),
                          ),
                        ),
                      );
                    } else if (theContains(
                          chatSession.peek().toLowerCase(),
                          "availab",
                        ) ||
                        theContains(chatSession.peek().toLowerCase(), "dash") ||
                        theContains(
                          chatSession.peek().toLowerCase(),
                          "fourth",
                        ) ||
                        theContains(chatSession.peek(), "4th")) {
                      chatSession.push(answers[15]);
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                          ),
                        ),
                      );
                    } else if (theContains(
                      chatSession.peek().toLowerCase(),
                      "bye",
                    )) {
                      chatSession.push(
                        "Thank you for using this service! Have a nice day!",
                      );
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                          ),
                        ),
                      );
                    } else {
                      int selector = Random().nextInt(answers.length);
                      chatSession.push(
                        "${answers.elementAt(selector).substring(0, 16)}....",
                      );
                      theList.add(
                        Card(
                          child: ListTile(
                            title: Text("Server"),
                            subtitle: Text(chatSession.peek()),
                            trailing: widgetSelect(selector),
                          ),
                        ),
                      );
                    }
                    prevPrompt = prompt.text;
                    prompt = TextEditingController();
                    setState(() {});
                  }
                },
                child: Text("Send"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionSelector extends StatefulWidget {
  const OptionSelector({super.key});

  @override
  State<OptionSelector> createState() => _OptionSelectorState();
}

class _OptionSelectorState extends State<OptionSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selections for Management")),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text("Click on one of the buttons below: "),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              child: Row(
                children: [
                  SizedBox(width: 100),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => PatientList(),
                            ),
                          );
                        });
                      },
                      child: Text("Patients"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => DoctorList(),
                            ),
                          );
                        });
                      },
                      child: Text("Doctors"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              child: Row(
                children: [
                  SizedBox(width: 100),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => CaseList(),
                            ),
                          );
                        });
                      },
                      child: Text("Cases"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => TestList(),
                            ),
                          );
                        });
                      },
                      child: Text("Tests"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              child: Row(
                children: [
                  SizedBox(width: 100),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (BuildContext context) => TestRelationList(),
                            ),
                          );
                        });
                      },
                      child: Text("Lab Relations"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (BuildContext context) =>
                                      PeopleRelationList(),
                            ),
                          );
                        });
                      },
                      child: Text("People Relations"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AppointmentList(),
                    ),
                  );
                });
              },
              child: Text("Appointments"),
            ),
          ),
        ],
      ),
    );
  }
}

class FileListPage extends StatefulWidget {
  const FileListPage({super.key});
  @override
  State<FileListPage> createState() => _FileListPageState();
}

class _FileListPageState extends State<FileListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Management"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text("Click on the button below to continue: "),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => FileListPageReplaced(),
                    ),
                  );
                });
              },
              child: Text("Click to Proceed"),
            ),
          ],
        ),
      ),
    );
  }
}
