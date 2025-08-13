import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback onLogout;
  const ProfilePage({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    // Dummy user info, replace with real user data
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Email: user@email.com'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman edit profil
              },
              child: const Text('Edit Profil'),
            ),
            ElevatedButton(
              onPressed: onLogout,
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
