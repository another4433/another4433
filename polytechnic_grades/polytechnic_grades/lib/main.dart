import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Polytechnic Grading System'),
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

  // Different pages to display for each tab
  final List<Widget> _pages = [const AddCourse(), const ViewCourses()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex > 1) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    icon: Icon(Icons.error),
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, "Ok"),
                        child: Text("Ok"),
                      ),
                    ],
                    title: Text("Technical Error"),
                    content: Text("Failed to generate the transcript!"),
                  );
                },
              );
            }
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Course'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        ],
      ),
    );
  }
}

class Course {
  final String _name, _code, _letter;
  double? _credits;

  static List<Course> courseList = [];
  static List<List<Course>> semesterList = [];
  static List<double?> creditList = [], creditList2 = [];

  static double? totalGrades = 0;
  static int courseCount = 0, semesterCount = 0;

  Course(this._name, this._code, this._letter);

  String get name => _name;
  String get code => _code;
  String get letter => _letter;

  void setCredits(double? credits) => _credits = credits;
  double? getCredits() => _credits;
}

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final GlobalKey<FormState> _courseKey = GlobalKey<FormState>();
  TextEditingController nameControl = TextEditingController();
  TextEditingController codeControl = TextEditingController();
  String? selectLetter;
  String courseName = "", courseCode = "", letterGrade = "";
  String eligbility = "You're NOT eligable to apply changes!";
  double? theGrade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Add a course")),
      body: Form(
        key: _courseKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: FloatingActionButton(
                    onPressed: () {
                      if (Course.semesterCount < 0) {
                        Course.semesterCount = 0;
                      }
                      Course.semesterList.add(Course.courseList);
                      eligbility = "You're eligable to apply changes!";
                      Course.semesterList[Course.semesterCount] =
                          Course.courseList;
                      Course.semesterCount--;
                      Course.courseCount = 0;
                      Course.courseList = [];
                      _courseKey.currentState!.reset();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "The changes was saved in the previous semester and the changes will happen in the current semester.",
                          ),
                        ),
                      );
                      setState(() {});
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Semester ${Course.semesterCount + 1}",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "sans-serif",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Course.semesterList.add(Course.courseList);
                      Course.semesterList[Course.semesterCount] =
                          Course.courseList;
                      Course.semesterCount++;
                      eligbility = "You're eligable to apply changes!";
                      Course.courseCount = 0;
                      Course.courseList = [];
                      _courseKey.currentState!.reset();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "The changes was saved in the previous semester and the changes will happen in the current semester.",
                          ),
                        ),
                      );
                      setState(() {});
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Text(
              "Enter the following information to add a course to a semester: ",
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: nameControl,
              decoration: InputDecoration(
                icon: Icon(Icons.abc),
                iconColor: Colors.black,
                labelText: "Course Name",
                border: OutlineInputBorder(),
                hintText: "Enter the name of the course",
              ),
              onChanged: (value) {
                setState(() {
                  courseName = value;
                  _courseKey.currentState!.save();
                });
              },
              validator: (value) => null,
              onSaved: (newValue) {
                setState(() {
                  if (newValue != null) courseName = newValue;
                });
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: codeControl,
              decoration: InputDecoration(
                icon: Icon(Icons.numbers),
                iconColor: Colors.black,
                labelText: "Course Code",
                border: OutlineInputBorder(),
                hintText: "Enter the code set to that course",
              ),
              onChanged: (value) {
                setState(() {
                  courseCode = value;
                  _courseKey.currentState!.save();
                });
              },
              validator: (value) => null,
              onSaved: (newValue) {
                setState(() {
                  if (newValue != null) courseCode = newValue;
                });
              },
            ),
            SizedBox(height: 10),
            DropdownMenu(
              initialSelection: selectLetter,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: "A+", label: "A+"),
                DropdownMenuEntry(value: "A", label: "A"),
                DropdownMenuEntry(value: "A-", label: "A-"),
                DropdownMenuEntry(value: "B+", label: "B+"),
                DropdownMenuEntry(value: "B", label: "B"),
                DropdownMenuEntry(value: "B-", label: "B-"),
                DropdownMenuEntry(value: "C+", label: "C+"),
                DropdownMenuEntry(value: "C", label: "C"),
                DropdownMenuEntry(value: "F", label: "F"),
              ],
              label: Text("Grade Letter"),
              hintText:
                  "Select any of the letter to represent the grade of the course",
              onSelected: (value) {
                setState(() {
                  if (value != null) {
                    selectLetter = value;
                    _courseKey.currentState!.save();
                  }
                });
              },
            ),
            SizedBox(height: 25),
            TextButton(
              onPressed: () {
                setState(() {
                  Course.semesterList[Course.semesterCount] = Course.courseList;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Changes applied successfully!")),
                  );
                });
              },
              child: Text("Apply Changes"),
            ),
            SizedBox(height: 50),
            Text(
              eligbility,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    eligbility == "You're eligable to apply changes!"
                        ? Colors.green
                        : Colors.redAccent,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Course theObject = Course(courseName, courseCode, selectLetter!);
          switch (selectLetter) {
            case "A+":
              theGrade = 4;
              break;
            case "A":
              theGrade = 3.75;
              break;
            case "A-":
              theGrade = 3.5;
              break;
            case "B+":
              theGrade = 3.25;
              break;
            case "B":
              theGrade = 3;
              break;
            case "B-":
              theGrade = 2.75;
              break;
            case "C+":
              theGrade = 2.5;
              break;
            case "C":
              theGrade = 2.25;
              break;
            default:
              theGrade = 0;
          }
          Course.creditList2.add(theGrade);
          theObject.setCredits(theGrade);
          Course.courseList.add(theObject);
          Course.semesterList.add(Course.courseList);
          Course.courseCount++;
          eligbility = "You're eligable to apply changes!";
          Course.semesterList[Course.semesterCount] = Course.courseList;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("A course have been added.")));
          double? manipulator = 0;
          Course.totalGrades = 0;
          for (var item in Course.creditList2) {
            manipulator = manipulator! + item!;
          }
          manipulator = manipulator! / Course.creditList2.length;
          Course.creditList.add(manipulator);
          for (var grade in Course.creditList) {
            Course.totalGrades = Course.totalGrades! + grade!;
          }
          Course.totalGrades = Course.totalGrades! / Course.creditList.length;
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      bottomSheet: Text("Your grades are in the next tab!"),
    );
  }
}

class ViewCourses extends StatefulWidget {
  const ViewCourses({super.key});

  @override
  State<ViewCourses> createState() => _ViewCoursesState();
}

class _ViewCoursesState extends State<ViewCourses> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generated Academic Transcript"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: Course.semesterList[counter].length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(
                Course.semesterList[counter][index].code,
                style: TextStyle(
                  fontFamily: "sans-serif",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(offset: Offset(0.1, 0.1))],
                ),
              ),
              title: Center(
                child: Text(Course.semesterList[counter][index].name),
              ),
              trailing: Text(
                Course.semesterList[counter][index].letter,
                style: TextStyle(
                  fontFamily: "sans-serif",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(offset: Offset(0.1, 0.1))],
                ),
              ),
            ),
          );
        },
      ),
      bottomSheet: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total GPA = ${Course.totalGrades}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (counter > 0) counter--;
                    });
                  },
                  child: Icon(Icons.arrow_back),
                ),
                Text(
                  "Semester ${counter + 1}",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "sans-serif",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (counter < Course.semesterCount) counter++;
                    });
                  },
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
            Text("Semester GPA = ${Course.creditList[counter]}"),
          ],
        ),
      ),
    );
  }
}
