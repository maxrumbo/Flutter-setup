import 'pages/notes/notes_page.dart';
import 'dart:ui';
import 'package:flutter/material.dart';


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
  bool _isDarkMode = true;

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

    final ThemeData tokyoNightDark = ThemeData(
      fontFamily: 'FiraMono',
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF1a1b26),
      scaffoldBackgroundColor: const Color(0xFF1a1b26),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF16161e),
        foregroundColor: Color(0xFFc0caf5),
        elevation: 0,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFF16161e),
      ),
      colorScheme: ColorScheme.dark(
        primary: Color(0xFF7aa2f7),
        secondary: Color(0xFFbb9af7),
        background: Color(0xFF1a1b26),
        surface: Color(0xFF16161e),
        onPrimary: Color(0xFF1a1b26),
        onSecondary: Color(0xFF1a1b26),
        onBackground: Color(0xFFc0caf5),
        onSurface: Color(0xFFc0caf5),
        error: Color(0xFFf7768e),
        onError: Color(0xFF1a1b26),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF7aa2f7)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFc0caf5)),
        bodyMedium: TextStyle(color: Color(0xFFc0caf5)),
        titleLarge: TextStyle(color: Color(0xFF7aa2f7)),
      ),
      dividerColor: Color(0xFF292e42),
      cardColor: Color(0xFF24283b),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(Color(0xFF7aa2f7)),
        trackColor: MaterialStatePropertyAll(Color(0xFF292e42)),
      ),
    );

    final ThemeData modernLight = ThemeData(
      fontFamily: 'FiraMono',
      brightness: Brightness.light,
      primaryColor: const Color(0xFF7aa2f7),
      scaffoldBackgroundColor: const Color(0xFFF7F8FA),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF7F8FA),
        foregroundColor: Color(0xFF1a1b26),
        elevation: 0,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFFF7F8FA),
      ),
      colorScheme: ColorScheme.light(
        primary: Color(0xFF7aa2f7),
        secondary: Color(0xFFbb9af7),
        background: Color(0xFFF7F8FA),
        surface: Color(0xFFFFFFFF),
        onPrimary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFF1a1b26),
        onBackground: Color(0xFF1a1b26),
        onSurface: Color(0xFF1a1b26),
        error: Color(0xFFf7768e),
        onError: Color(0xFFFFFFFF),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF7aa2f7)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF1a1b26)),
        bodyMedium: TextStyle(color: Color(0xFF1a1b26)),
        titleLarge: TextStyle(color: Color(0xFF7aa2f7)),
      ),
      dividerColor: Color(0xFFe0e3e8),
      cardColor: Color(0xFFFFFFFF),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(Color(0xFF7aa2f7)),
        trackColor: MaterialStatePropertyAll(Color(0xFFbb9af7)),
      ),
    );

    return MaterialApp(
      title: 'Catatan & To-Do',
      theme: _isDarkMode ? tokyoNightDark : modernLight,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notes & To-Do'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF16161e),
              ),
              child: Text('Menu', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text('Catatan'),
            ),
            ListTile(
              leading: Icon(Icons.check_box),
              title: Text('To-Do'),
            ),
          ],
        ),
      ),
      body: const NotesPage(),
    );
  }
}

