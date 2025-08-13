import 'package:flutter/material.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reminder/Notifikasi')),
      body: Center(
        child: Text('Fitur reminder akan datang!'),
      ),
    );
  }
}
