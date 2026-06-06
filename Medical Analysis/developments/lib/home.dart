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
import 'package:open_filex/open_filex.dart';
import 'package:medical_app/file_item.dart';
import 'package:medical_app/file_service.dart';
import 'package:medical_app/text_detailing.dart';

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
    "Project Overview: LabLens AI is an AI-powered clinical decision-support system that helps users and healthcare professionals understand lab results more clearly.",
    "System Goal: The goal is to support early risk awareness, detect important lab trends, and improve healthcare decision-making without replacing doctors.",
    "Features Included: The system includes lab report upload, OCR text extraction, lab value analysis, symptom assessment, historical trend comparison, risk scoring, explainable AI insights, and a dashboard.",
    "Main Feature: The systems collects inputs through prompts and files to be analyzed to provide simplified and better results from the input about medical.",
    "How It Works: The user uploads a lab report or provide inputs as prompts, the system extracts lab values using OCR, analyzes symptoms and previous results, detects trends, generates a risk level, and provides a clear explanation.",
    "User input: Patient data, doctor data, case data, test data, appointment data, patient with doctor relations, matching test with patients, and files.",
    "Recommendation: Provide manual inputs after selecting the options provided for better analysis and it is optional to upload files.",
    "Security: The system is accessible through accounts. Meaning that you will need an account to access the system. Your account information is guaranteed safe when account is created.",
    "Explanation of the design: When you enter the system, it will show blank page for a while to load the designs. Once the designs are loaded, you are greeted with the login page including the logo picture. Once you signed in, you will see multiple tabs on top of the screen including the profile icon located at the top right of the screen.",
    "First tab explanation: This tab is the chatbot agent to answer your questions. If you are not satisfied with your answer, send an email to the admin \"alimohamedhassan9@outlook.com\" and ask your question with optional screenshot of your screen and you will receive your reply soon.",
    "Second tab explanation: This tab will show options to select before you view the list to manage the selected data in the list. You can add, delete, or edit the data you selected it.",
    "Third tab explanation: This tab allows you to upload a file so that the system receive it to analyze it.",
    "Fourth tab explanation: This tab is currently unavailable due to construction in progress. However, this tab is meant to show the simplified results that you were looking for. Explanation of this tab is coming soon.",
    "System Output: Risk level, trend analysis, key findings, explanations, follow-up recommendations, list of a specific data group, and data overview.",
    "Disclaimer: This system does not diagnose diseases or replace professional medical advice. It is designed only to support decision-making and early awareness. It also supports viewing and using data per selections.",
    "The fourth tab or dashboard tab will be available as soon as possible.",
  ];
  TextEditingController prompt = TextEditingController();
  List<Widget> theList = [];
  String prevPrompt = "";

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
      body: ListView(children: theList),
      bottomSheet: Row(
        children: [
          TextButton(
            onPressed: () {
              do {
                chatSession.pop();
                theList.removeLast();
              } while (chatSession.isEmpty());
            },
            child: Text("Clear"),
          ),
          TextField(
            controller: prompt,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter a message",
            ),
          ),
          TextButton(
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
                    chatSession.peek().toLowerCase() == "yo" ||
                    chatSession.peek().toLowerCase().contains("h")) {
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
                } else if (RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("overview") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("purpose")) {
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
                } else if (RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("goal") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("aim")) {
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
                } else if (RegExp(
                  chatSession.peek(),
                  caseSensitive: false,
                ).hasMatch("included")) {
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
                } else if (RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("feature") ||
                    RegExp(chatSession.peek(), caseSensitive: false).hasMatch("main")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("work") ||
                    RegExp(chatSession.peek(), caseSensitive: false).hasMatch("system")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("input") ||
                    RegExp(chatSession.peek(), caseSensitive: false).hasMatch("user")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("recommend")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("secur")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("explain") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("design") ||
                    RegExp(chatSession.peek(), caseSensitive: false).hasMatch("navigat")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("chat") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("bot") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("assist") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("ai") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("first") ||
                    RegExp(chatSession.peek(), caseSensitive: false).hasMatch("1st")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("data") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("app") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("second") ||
                    RegExp(chatSession.peek(), caseSensitive: false).hasMatch("2nd")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("file") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("report") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("lab") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("load") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("third") ||
                    RegExp(chatSession.peek(), caseSensitive: false).hasMatch("3rd")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("example")) {
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
                                      (BuildContext context) => ETheQuestions(
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("output") ||
                    RegExp(chatSession.peek(), caseSensitive: false).hasMatch("program")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("disclaimer")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("yes") ||
                    RegExp(chatSession.peek(), caseSensitive: false).hasMatch("no")) {
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
                } else if (RegExp(chatSession.peek(), caseSensitive: false).hasMatch("availabl") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("dashboard") ||
                    RegExp(
                      chatSession.peek(),
                      caseSensitive: false,
                    ).hasMatch("fourth") ||
                    RegExp(chatSession.peek(), caseSensitive: false).hasMatch("4th")) {
                  chatSession.push(answers[15]);
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
                  prevPrompt = prompt.text;
                }
              }
            },
            child: Text("Send"),
          ),
        ],
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
          Text("Click on one of the buttons below: "),
          SizedBox(height: 30),
          Row(
            children: [
              ElevatedButton(
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
              ElevatedButton(
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
            ],
          ),
          Row(
            children: [
              ElevatedButton(
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
              ElevatedButton(
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
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => TestRelationList(),
                      ),
                    );
                  });
                },
                child: Text("Lab Relations"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => PeopleRelationList(),
                      ),
                    );
                  });
                },
                child: Text("People Relations"),
              ),
            ],
          ),
          ElevatedButton(
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
  // ✅ The list that stores File objects
  final List<FileItem> _files = [];

  final _service = FileService();
  bool _isLoading = false;

  // Pick file → save to storage → add to list
  Future<void> _pickFile() async {
    setState(() => _isLoading = true);

    try {
      final fileItem = await _service.pickAndSaveFile();

      if (fileItem != null) {
        setState(() => _files.add(fileItem)); // add to list
        _showSnackbar('✅ ${fileItem.name} uploaded!');
      }
    } catch (e) {
      _showSnackbar('❌ Error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Delete file from list and from storage
  Future<void> _deleteFile(int index) async {
    final item = _files[index];
    await _service.deleteFile(item);
    setState(() => _files.removeAt(index));
    _showSnackbar('🗑️ ${item.name} deleted');
  }

  void _showSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Files'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          if (_files.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Clear all',
              onPressed: () async {
                for (final f in _files) {
                  await _service.deleteFile(f);
                }
                setState(() => _files.clear());
              },
            ),
        ],
      ),

      body:
          _files.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _files.length,
                itemBuilder: (ctx, i) => _buildFileCard(_files[i], i),
              ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _isLoading ? null : _pickFile,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        icon:
            _isLoading
                ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                : const Icon(Icons.upload_file),
        label: Text(_isLoading ? 'Uploading...' : 'Upload File'),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_open, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No files yet',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            'Tap Upload File to get started',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildFileCard(FileItem item, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        // File type icon
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.withOpacity(0.1).withValues(),
          child: Text(item.icon, style: const TextStyle(fontSize: 22)),
        ),

        // File name & details
        title: Text(
          item.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.mimeType, style: const TextStyle(fontSize: 12)),
            Text(
              '${item.formattedSize} • ${item.uploadedAt.toLocal()}',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),

        // Open & Delete actions
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.open_in_new, color: Colors.indigo),
              tooltip: 'Open',
              onPressed: () => OpenFilex.open(item.path),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              tooltip: 'Delete',
              onPressed: () => _deleteFile(index),
            ),
          ],
        ),
      ),
    );
  }
}
