import 'pages/ai_suggestions/ai_suggestions_page.dart';
import 'pages/voice_notes/voice_notes_page.dart';
import 'pages/handwriting/handwriting_page.dart';
import 'pages/mood_tracker/mood_tracker_page.dart';
import 'pages/habit_tracker/habit_tracker_page.dart';
import 'pages/location_reminder/location_reminder_page.dart';
import 'pages/collaboration/collaboration_page.dart';
import 'pages/attachment/attachment_page.dart';
import 'pages/calendar_sync/calendar_sync_page.dart';
import 'pages/gamification/gamification_page.dart';
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
            if (widget.isLoggedIn) ...[
              ListTile(
                leading: const Icon(Icons.lightbulb),
                title: const Text('AI Suggestions'),
                onTap: () {
                  Navigator.pop(context);
                  _openDrawerPage(const AiSuggestionsPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.mic),
                title: const Text('Voice Notes'),
                onTap: () {
                  Navigator.pop(context);
                  _openDrawerPage(const VoiceNotesPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.gesture),
                title: const Text('Handwriting'),
                onTap: () {
                  Navigator.pop(context);
                  _openDrawerPage(const HandwritingPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.emoji_emotions),
                title: const Text('Mood Tracker'),
                onTap: () {
                  Navigator.pop(context);
                  _openDrawerPage(const MoodTrackerPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.track_changes),
                title: const Text('Habit Tracker'),
                onTap: () {
                  Navigator.pop(context);
                  _openDrawerPage(const HabitTrackerPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Location Reminder'),
                onTap: () {
                  Navigator.pop(context);
                  _openDrawerPage(const LocationReminderPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Collaboration'),
                onTap: () {
                  Navigator.pop(context);
                  _openDrawerPage(const CollaborationPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_file),
                title: const Text('Attachment & Scan'),
                onTap: () {
                  Navigator.pop(context);
                  _openDrawerPage(const AttachmentPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Calendar Sync'),
                onTap: () {
                  Navigator.pop(context);
                  _openDrawerPage(const CalendarSyncPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.emoji_events),
                title: const Text('Gamification'),
                onTap: () {
                  Navigator.pop(context);
                  _openDrawerPage(const GamificationPage());
                },
              ),
            ],
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
}
