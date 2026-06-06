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
//import 'package:medical_app/text_detailing.dart';

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
  questions = [],
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
  ];
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
