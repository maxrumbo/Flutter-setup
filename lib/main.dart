import 'package:flutter/material.dart';
import 'pages/notes/notes_page.dart';
import 'pages/todos/todos_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/auth/signup_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  bool _showSignUp = false;

  void _goToSignUp() {
    setState(() {
      _showSignUp = true;
    });
  }

  void _goToLogin() {
    setState(() {
      _showSignUp = false;
    });
  }

  void _loginSuccess() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catatan & To-Do',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: _isLoggedIn
          ? const MainPage()
          : (_showSignUp
              ? SignUpPage(onLoginTap: _goToLogin)
              : LoginPage(onSignUpTap: _goToSignUp, onLoginSuccess: _loginSuccess)),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const NotesPage(),
    const TodosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Catatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'To-Do',
          ),
        ],
      ),
    );
  }
}
