import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universities in Bahrain',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const MyHomePage(title: 'Schedule Planner'),
    );
  }
}

class Course {
  String name, code, days, timeStart, timeEnd;
  double hour, credit;
  bool isLab, isPractical;
  double? price;

  Course(
    this.name,
    this.code,
    this.days,
    this.timeStart,
    this.timeEnd,
    this.hour,
    this.credit,
    this.isLab,
    this.isPractical,
  ) : price = hour * credit;

  double? get thePrice {
    return price;
  }

  static List<Course> courseList = [];
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [const AddCourse(), const CourseList()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Course"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),
        ],
      ),
    );
  }
}

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});
  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  bool? theDefault1, theDefault2, theDefault3, theDefault6, theDefault7;
  String concat = "";
  double theDefault4 = 3, theDefault5 = 3;
  int counter = 0;
  bool isLab = false, isPractical = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Course"), backgroundColor: Colors.indigo),
      body: Center(
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          scrollbarOrientation: ScrollbarOrientation.right,
          thickness: 5,
          radius: Radius.circular(5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Course Name",
                      hintText: "Enter course name",
                      icon: Icon(Icons.abc_outlined),
                    ),
                    controller: controller1,
                  ),
                ),
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Course Code",
                      hintText: "Enter course code",
                      icon: Icon(Icons.golf_course_outlined),
                    ),
                    controller: controller2,
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Course Days"),
                      CheckboxListTile(
                        title: Text("U"),
                        subtitle: Text("Sunday"),
                        value: theDefault1,
                        tristate: true,
                        onChanged: (value) {
                          setState(() {
                            theDefault1 = value;
                            concat += "U";
                            setState(() {});
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("M"),
                        subtitle: Text("Monday"),
                        value: theDefault6,
                        tristate: true,
                        onChanged: (value) {
                          setState(() {
                            theDefault6 = value;
                            concat += "M";
                            setState(() {});
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("T"),
                        subtitle: Text("Tuesday"),
                        value: theDefault2,
                        tristate: true,
                        onChanged: (value) {
                          setState(() {
                            theDefault2 = value;
                            concat += "T";
                            setState(() {});
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("W"),
                        subtitle: Text("Wednesday"),
                        value: theDefault7,
                        tristate: true,
                        onChanged: (value) {
                          setState(() {
                            theDefault7 = value;
                            concat += "W";
                            setState(() {});
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("H"),
                        subtitle: Text("Thursday"),
                        value: theDefault3,
                        tristate: true,
                        onChanged: (value) {
                          setState(() {
                            theDefault3 = value;
                            concat += "H";
                            setState(() {});
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Course Start Time",
                      hintText: "Select course starting time",
                      icon: Icon(Icons.access_time_outlined),
                    ),
                    controller: controller3,
                    onChanged: (value) {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        controller3.text = value.toString().substring(
                          value.toString().indexOf("(") + 1,
                          value.toString().indexOf(")"),
                        );
                        setState(() {});
                      });
                    },
                  ),
                ),
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Course end Time",
                      hintText: "Select course ending time",
                      icon: Icon(Icons.access_time_outlined),
                    ),
                    controller: controller4,
                    onChanged: (value) {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        controller4.text = value.toString().substring(
                          value.toString().indexOf("(") + 1,
                          value.toString().indexOf(")"),
                        );
                        setState(() {});
                      });
                    },
                  ),
                ),
                Card(
                  child: Slider(
                    value: theDefault4,
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: "Course Hours",
                    onChanged: (value) {
                      setState(() {
                        theDefault4 = value;
                      });
                    },
                  ),
                ),
                Text("Selected hour: $theDefault4"),
                Card(
                  child: Slider(
                    value: theDefault5,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: "Course Credits",
                    onChanged: (value) {
                      setState(() {
                        theDefault5 = value;
                      });
                    },
                  ),
                ),
                Text("Selected credit: $theDefault5"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Enable the option if the course contains lab  "),
                    Card(
                      child: Switch(
                        value: isLab,
                        onChanged: (value) {
                          isLab = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Enable the option if the course is practical    "),
                    Card(
                      child: Switch(
                        value: isPractical,
                        onChanged: (value) {
                          isPractical = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Course object = Course(
                      controller1.text,
                      controller2.text,
                      concat,
                      controller3.text,
                      controller4.text,
                      theDefault4,
                      theDefault5,
                      isLab,
                      isPractical,
                    );
                    Course.courseList.add(object);
                    counter++;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("A course have been added to the list"),
                      ),
                    );
                    concat = "";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CourseList()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Tap on the course list tab that is the next tab to reset the course days when tapping the add course tab.",
                        ),
                      ),
                    );
                    setState(() {});
                  },
                  child: Text("Add course"),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  String lab = "";
  String practical = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Schedule"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: Course.courseList.length,
        itemBuilder: (context, index) {
          lab = Course.courseList[index].isLab ? "With Lab" : "No Lab";
          practical =
              Course.courseList[index].isPractical
                  ? "Practical"
                  : "No Practical";
          return Card(
            child: ListTile(
              leading: Text(Course.courseList[index].code),
              title: Text(Course.courseList[index].name),
              subtitle: Text(
                "${Course.courseList[index].days}, \t ${Course.courseList[index].timeStart} - ${Course.courseList[index].timeEnd}",
              ),
              trailing: Text("$practical\n$lab"),
            ),
          );
        },
      ),
    );
  }
}
