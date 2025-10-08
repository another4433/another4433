/*
Student name: Ali Mohamed Ali
Student ID: 202105103
Course: Mobile Application Development (ITCS444)
Section: 1
Assignment 2
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      home: const MyHomePage(title: 'Simple To-Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const AddTaskForm(),
    const TaskManagement(),
    const CompletedTasks(),
  ];

  @override
  Widget build(BuildContext context) {
    bool found = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.folder_copy), label: 'Task'),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Completed',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            for (var item in TheToDo.theList) {
              if (item.duration == "Completed") {
                found = true;
                break;
              }
            }
            _currentIndex = value;
            if (_currentIndex == 1 && TheToDo.theList.isEmpty) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    icon: Icon(Icons.error),
                    title: Text("Empty List"),
                    content: Text("No tasks were added to the list."),
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, "Ok"),
                        child: Text("Ok"),
                      ),
                    ],
                  );
                },
              );
            } else if (_currentIndex == 2 && !found) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    icon: Icon(Icons.coronavirus),
                    title: Text("Incomplete Task"),
                    content: Text("The task is not marked complete."),
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, "Ok"),
                        child: Text("Ok"),
                      ),
                    ],
                  );
                },
              );
            }
          });
        },
      ),
    );
  }
}

class TheToDo {
  String? name, description, duration, deadline;
  double value = 0;
  TheToDo(
    this.name,
    this.description,
    this.duration,
    this.deadline,
    this.value,
  );

  static List<TheToDo> theList = [];
}

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  GlobalKey<FormState> theKey = GlobalKey<FormState>();
  TextEditingController control1 = TextEditingController();
  TextEditingController control2 = TextEditingController();
  TextEditingController control3 = TextEditingController();
  TextEditingController control4 = TextEditingController();
  TextEditingController control5 = TextEditingController();
  double theValue = -1, convertor = -1;
  GlobalKey<FormState> key1 = GlobalKey<FormState>();
  GlobalKey<FormState> key2 = GlobalKey<FormState>();
  GlobalKey<FormState> key3 = GlobalKey<FormState>();
  GlobalKey<FormState> key4 = GlobalKey<FormState>();
  GlobalKey<FormState> key5 = GlobalKey<FormState>();
  String? name, description, duration, deadline;
  String nameText = "", header = "", descriptionText = "", durationText = "";
  String progressText = "", deadlineText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Task Form")),
      body: Form(
        key: theKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: key1,
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Enter the title of a new task",
                  icon: const Icon(Icons.border_color_outlined),
                ),
                controller: control1,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please! Enter the title.";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  setState(() {
                    name = newValue;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.text_fields_outlined),
                  labelText: "Description",
                  hintText: "Enter the description of the task",
                ),
                controller: control2,
                key: key2,
                validator: (value) => null,
                onSaved: (newValue) {
                  setState(() {
                    description = newValue;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: key3,
                decoration: InputDecoration(
                  icon: Icon(Icons.timelapse_outlined),
                  labelText: "Duration",
                  hintText: "Select the time to indicate the duration",
                ),
                controller: control3,
                onChanged: (value) {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(
                          context,
                        ).copyWith(alwaysUse24HourFormat: true),
                        child: child!,
                      );
                    },
                  ).then((value) {
                    control3.text = value.toString();
                  });
                  setState(() {});
                },
                validator: (value) => null,
                onSaved: (newValue) {
                  setState(() {
                    duration = newValue;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: key4,
                decoration: InputDecoration(
                  icon: Icon(Icons.percent),
                  labelText: "Progress",
                  hintText: "Enter a decimal value to indicate the progress",
                ),
                controller: control4,
                onChanged: (value) {
                  theValue = double.parse(value);
                  convertor = (theValue > 0) ? theValue * 100 : 0;
                  setState(() {});
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please! Enter any decimal number or 0";
                  }
                  return null;
                },
                onSaved: (newValue) => theValue = double.parse(newValue!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                value: theValue,
                semanticsLabel: "Task in progress...",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.date_range_outlined),
                  labelText: "Due Date",
                  hintText: "Enter the due date of the task",
                ),
                key: key5,
                controller: control5,
                onChanged: (value) {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2030),
                    initialDate: DateTime.now(),
                  ).then((value) {
                    control5.text = value.toString();
                  });
                },
                validator: (value) => null,
                onSaved: (newValue) {
                  setState(() {
                    deadline = newValue;
                  });
                },
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    theKey.currentState!.save();
                    TheToDo task = TheToDo(
                      name,
                      description,
                      duration,
                      deadline,
                      theValue,
                    );
                    TheToDo.theList.add(task);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Input have been submitted")),
                    );
                    header = "Description of the current saved item: ";
                    nameText = "Title: $name";
                    descriptionText = "Description: $description";
                    durationText = "Duration: $duration";
                    progressText = "Progress: $convertor%";
                    deadlineText = "Deadline: $deadline";
                  },
                  child: Text("Submit"),
                ),
                TextButton(
                  onPressed: () {
                    theKey.currentState!.reset();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Input have been resetted")),
                    );
                  },
                  child: Text("Reset"),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(header),
            ),
            Text(nameText),
            Text(descriptionText),
            Text(durationText),
            Text(progressText),
            Text(deadlineText),
          ],
        ),
      ),
    );
  }
}

class TaskManagement extends StatefulWidget {
  const TaskManagement({super.key});

  @override
  State<TaskManagement> createState() => _TaskManagement();
}

class _TaskManagement extends State<TaskManagement> {
  int? theindex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Management")),
      body: ListView.builder(
        itemCount: TheToDo.theList.length,
        itemBuilder: (context, index) {
          if (TheToDo.theList.isNotEmpty) {
            return Card(
              child: ListTile(
                leading: IconButton.filled(
                  onPressed: () {
                    theindex = index;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditingTask(receiver: index),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit),
                  color: Colors.white,
                ),
                title: Text("${TheToDo.theList[index].name}"),
                trailing: IconButton.filled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirmation"),
                          content: Text("Are you sure that you want to do it?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                TheToDo.theList.removeAt(index);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("The Task have been deleted"),
                                  ),
                                );
                              },
                              child: Text("Yes"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Failed to delete the task"),
                                  ),
                                );
                              },
                              child: Text("No"),
                            ),
                          ],
                        );
                      },
                    );
                    setState(() {});
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.white,
                ),
              ),
            );
          }
          return Card(child: ListTile(title: Text("Empty Task List")));
        },
      ),
    );
  }
}

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({super.key});

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Completed Tasks")),
      body: ListView.builder(
        itemCount: TheToDo.theList.length,
        itemBuilder: (context, index) {
          if (TheToDo.theList.isNotEmpty &&
              TheToDo.theList[index].duration == "Completed") {
            return Card(
              child: ListTile(
                leading: Text("(${index + 1})"),
                title: Text("${TheToDo.theList[index].name}"),
                subtitle: Text("${TheToDo.theList[index].description}"),
                trailing: Text("${TheToDo.theList[index].value * 100}%"),
              ),
            );
          }
          return Card(child: Text("No tasks completed"));
        },
      ),
    );
  }
}

class EditingTask extends StatefulWidget {
  final int? receiver;
  const EditingTask({super.key, this.receiver});

  @override
  State<EditingTask> createState() => _EditingTaskState();
}

class _EditingTaskState extends State<EditingTask> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validTitle = true, validStatus = true;
  TextEditingController titleControl = TextEditingController();
  TextEditingController statControl = TextEditingController();
  TextEditingController valueControl = TextEditingController();
  double theValue = 0, convertor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editing a task from the list")),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Enter different title",
                  icon: Icon(Icons.text_fields_outlined),
                ),
                controller: titleControl,
                validator: (value) {
                  if (value!.isEmpty) {
                    validTitle = false;
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (validTitle) {
                    TheToDo.theList[widget.receiver!].name = titleControl.text;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.percent),
                  labelText: "Progress",
                  hintText: "Enter a decimal value to indicate the progress",
                ),
                controller: valueControl,
                onChanged: (value) {
                  theValue = double.parse(value);
                  convertor = (theValue > 0) ? theValue * 100 : 0;
                  setState(() {});
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please! Enter any decimal number or 0";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  theValue = double.parse(newValue!);
                  TheToDo.theList[widget.receiver!].value = theValue;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                value: theValue,
                semanticsLabel: "Task progress indicator",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu(
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: "Not Started", label: "Not Started"),
                  DropdownMenuEntry(value: "In Progress", label: "In Progress"),
                  DropdownMenuEntry(value: "Completed", label: "Completed"),
                ],
                controller: statControl,
                label: Text("Task Duration as Status"),
                hintText: "Select only any of these options shown",
                onSelected: (value) {
                  if (value!.isEmpty) {
                    validStatus = false;
                  }
                  if (validStatus) {
                    TheToDo.theList[widget.receiver!].duration = value;
                  }
                },
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Changes have been made to the form")),
                );
                formKey.currentState!.reset();
                Navigator.pop(context);
              },
              child: Text("Apply"),
            ),
          ],
        ),
      ),
    );
  }
}
