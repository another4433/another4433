import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'user.dart';
import 'person.dart';
import 'package:firebase_core/firebase_core.dart';

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

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  FirebaseAuth get theAuth => _auth;

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      print('Error signing in: ${e.message}');
      return null;
    }
  }

  Future<User?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      print('Error registering: ${e.message}');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _auth.authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is still signed in!');
        }
      });
    } on FirebaseAuthException catch (e) {
      print('Error signing out: ${e.message}');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Medical App'),
      debugShowCheckedModeBanner: false,
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
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  TheUser? theUser;
  User? firebaseUser;
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        setState(() {
          firebaseUser = user;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login successful!'),
              backgroundColor: Colors.green,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Welcome, ${authService.getCurrentUser()?.email}'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (BuildContext context) => TheTabs(theService: authService),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(
                'assets/Oakwood-Medical-Clinic-General-Services-scaled.jpg',
              ),
              width: 300,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Login Page',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter your email',
                  icon: Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
                String username = usernameController.text;
                String password = passwordController.text;
                String encryptedPassword = "";
                if (TheUser.getUsers().isEmpty) {
                  encryptedPassword = TheUser.encrypt(username, password);
                  authService
                      .signIn(username, encryptedPassword)
                      .then((user) {
                        if (user != null) {
                          firebaseUser = user;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Login successful!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Welcome, ${authService.getCurrentUser()?.email}',
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (BuildContext context) =>
                                      TheTabs(theService: authService),
                            ),
                          );
                        } else {
                          print('Problem with Firebase Authentication');
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Login Failed'),
                                content: Text(
                                  'An error occurred during login. Please check your credentials and try again.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      })
                      .catchError((error) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Login Failed'),
                              content: Text(
                                'An error occurred during login. Error details: ${error.message}',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      });
                } else {
                  for (TheUser user in TheUser.getUsers()) {
                    if (user.getEmail() == username) {
                      encryptedPassword = user.getPassword();
                      theUser = user;
                      break;
                    }
                  }
                  String decryptedChecker =
                      TheUser.decrypt(encryptedPassword)[1];
                  String encryptChecker = TheUser.encrypt(username, password);
                  if (encryptedPassword.isNotEmpty &&
                      encryptChecker == encryptedPassword) {
                    authService
                        .signIn(username, encryptedPassword)
                        .then((user) {
                          if (user != null) {
                            firebaseUser = user;
                            print(
                              'Firebase user: ${authService.getCurrentUser()?.email}',
                            );
                            if (decryptedChecker == password) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Login successful!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Welcome, ${theUser?.getName()}',
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          TheTabs(theService: authService),
                                ),
                              );
                              print('Password: $encryptedPassword');
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Incorrect Password'),
                                    content: Text(
                                      'The provided password is incorrect.',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            print('Problem with Firebase Authentication');
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Login Failed'),
                                  content: Text(
                                    'An error occurred during login. Please check your credentials and try again.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        })
                        .catchError((error) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Login Failed'),
                                content: Text(
                                  'An error occurred during login. Error details: ${error.message}',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        });
                  } else {
                    print('User not found for username: $username');
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('User Not Found'),
                          content: Text('The provided username was not found.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
                setState(() {});
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationPage(),
                    ),
                  );
                });
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController moneyController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  ScrollController scrollController = ScrollController();
  TheUser? theUser;
  Person? thePerson;
  AuthService authService = AuthService();
  DateTime? selectedBirthDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration Page')),
      body: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        trackVisibility: true,
        radius: Radius.circular(8),
        thickness: 5,
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage(
                    'assets/Oakwood-Medical-Clinic-General-Services-scaled.jpg',
                  ),
                  width: 300,
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  'Medical App Registration Page',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: idController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ID',
                      hintText: 'Enter your ID number',
                      icon: Icon(Icons.badge),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Enter your full name',
                      icon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: nationalityController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nationality',
                      hintText: 'Enter your nationality',
                      icon: Icon(Icons.flag),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: genderController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gender',
                      hintText: 'Enter your gender',
                      icon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: currencyController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Currency',
                      hintText: 'Enter your preferred currency',
                      icon: Icon(Icons.attach_money),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: moneyController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Money',
                      hintText: 'Enter your current balance',
                      icon: Icon(Icons.account_balance_wallet),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      icon: Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: birthController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Birth Date',
                      hintText: 'Enter your birth date (YYYY-MM-DD)',
                      icon: Icon(Icons.calendar_today),
                    ),
                    onChanged: (value) {
                      // Handle birth date input change
                      setState(() {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime(1000),
                          lastDate: DateTime(3000),
                          initialDate: DateTime.now(),
                        ).then((pickedDate) {
                          if (pickedDate != null) {
                            selectedBirthDate = pickedDate;
                            birthController.text =
                                pickedDate.toIso8601String().split('T')[0];
                          }
                        });
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle register button press
                      setState(() {
                        if (emailController.text.isEmpty &&
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Email and password field is empty. Please enter them!",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          thePerson = Person(
                            nameController.text,
                            idController.text,
                            selectedBirthDate ?? DateTime(2000, 1, 1),
                            (double.tryParse(moneyController.text)! < 0)
                                ? 0.0
                                : double.tryParse(moneyController.text) ?? 0.0,
                            currencyController.text,
                            nationalityController.text,
                            genderController.text,
                          );
                          theUser = TheUser(
                            nameController.text,
                            idController.text,
                            selectedBirthDate ?? DateTime(2000, 1, 1),
                            (double.tryParse(moneyController.text)! < 0)
                                ? 0.0
                                : double.tryParse(moneyController.text) ?? 0.0,
                            currencyController.text,
                            nationalityController.text,
                            genderController.text,
                            emailController.text,
                            TheUser.encrypt(
                              emailController.text,
                              passwordController.text,
                            ),
                          );
                          Person.getPeople().add(thePerson!);
                          TheUser.getUsers().add(theUser!);
                          if (authService.getCurrentUser() == null) {
                            authService
                                .register(
                                  emailController.text,
                                  TheUser.encrypt(
                                    emailController.text,
                                    passwordController.text,
                                  ),
                                )
                                .then((user) {
                                  if (user != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Registration successful!',
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    print(
                                      'Firebase user registered: ${authService.getCurrentUser()?.email}',
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const MyHomePage(
                                              title: 'Medical App',
                                            ),
                                      ),
                                    );
                                  } else {
                                    print('Problem with Firebase Registration');
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Regisetration Failed'),
                                          content: Text(
                                            'Failed to register user. Please check your details and try again.',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                })
                                .catchError((error) {
                                  print('Error during registration: $error');
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Registration Error'),
                                        content: Text(
                                          'An error occured during registeration. Error details: ${error.message}',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                          }
                        }
                      });
                    },
                    child: Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
