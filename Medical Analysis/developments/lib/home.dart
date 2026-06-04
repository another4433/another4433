import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/user.dart';
import 'package:medical_app/person.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medical_app/doctor.dart';
import 'package:medical_app/patient.dart';
import 'package:medical_app/case.dart';
import 'package:medical_app/test.dart';
import 'package:medical_app/the_stack.dart';
import 'package:medical_app/profile_viewing.dart';

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
  const TheTabs({super.key, required this.retrievedUser});

  final User retrievedUser;

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
                          (context) =>
                              ProfileViewing(retrievedUser: retrievedUser),
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
              OptionSelector(), //Add more pages
            ],
          ),
        ),
      ),
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
  List<String> questions = [], answers = [];
  TextEditingController prompt = TextEditingController();
  List<Widget> theList = [];
  String prevPrompt = "";
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
                int selector = Random().nextInt(answers.length);
                chatSession.push(answers.elementAt(selector));
                theList.add(
                  Card(
                    child: ListTile(
                      title: Text("Server"),
                      subtitle: Text(answers.elementAt(selector)),
                    ),
                  ),
                );
                prevPrompt = prompt.text;
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
    return Scaffold(appBar: AppBar(title: Text("Selections for Management")));
  }
}
