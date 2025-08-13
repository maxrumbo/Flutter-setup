import 'package:flutter/material.dart';
import 'pages/notes/notes_page.dart';
import 'pages/todos/todos_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/auth/signup_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/settings/settings_page.dart';
import 'pages/backup/backup_page.dart';
import 'pages/reminder/reminder_page.dart';

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
  bool _isDarkMode = false;

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

  void _logout() {
    setState(() {
      _isLoggedIn = false;
      _showSignUp = false;
    });
  }

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catatan & To-Do',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MainPage(
        onLogout: _logout,
        isDarkMode: _isDarkMode,
        onThemeChanged: _toggleTheme,
        isLoggedIn: _isLoggedIn,
        onLogin: _loginSuccess,
        onShowSignUp: _goToSignUp,
        showSignUp: _showSignUp,
        onBackToLogin: _goToLogin,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final VoidCallback onLogout;
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  final bool isLoggedIn;
  final VoidCallback onLogin;
  final VoidCallback onShowSignUp;
  final bool showSignUp;
  final VoidCallback onBackToLogin;
  const MainPage({
    super.key,
    required this.onLogout,
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.isLoggedIn,
    required this.onLogin,
    required this.onShowSignUp,
    required this.showSignUp,
    required this.onBackToLogin,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const NotesPage(),
    const TodosPage(),
  ];

  void _openDrawerPage(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Jika user ingin login/signup, tampilkan halaman login/signup
    if (!widget.isLoggedIn && widget.showSignUp) {
      return SignUpPage(onLoginTap: widget.onBackToLogin);
    }
    if (!widget.isLoggedIn && !widget.showSignUp) {
      return LoginPage(
        onSignUpTap: widget.onShowSignUp,
        onLoginSuccess: widget.onLogin,
      );
    }
    // Jika sudah login, tampilkan main app
    return Scaffold(
      appBar: null,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context);
                _openDrawerPage(ProfilePage(onLogout: widget.onLogout));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              onTap: () {
                Navigator.pop(context);
                _openDrawerPage(SettingsPage(isDarkMode: widget.isDarkMode, onThemeChanged: widget.onThemeChanged));
              },
            ),
            ListTile(
              leading: const Icon(Icons.backup),
              title: const Text('Backup & Restore'),
              onTap: () {
                Navigator.pop(context);
                _openDrawerPage(const BackupPage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Reminder'),
              onTap: () {
                Navigator.pop(context);
                _openDrawerPage(const ReminderPage());
              },
            ),
            const Divider(),
            if (widget.isLoggedIn)
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                  widget.onLogout();
                },
              ),
          ],
        ),
      ),
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
