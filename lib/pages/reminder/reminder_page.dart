import 'package:flutter/material.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Reminder/Notifikasi')),
      body: Center(
        child: Text('Fitur reminder akan datang!', style: theme.textTheme.bodyLarge),
      ),
    );
  }
}
