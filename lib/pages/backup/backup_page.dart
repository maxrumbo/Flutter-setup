import 'package:flutter/material.dart';

class BackupPage extends StatelessWidget {
  const BackupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Backup & Restore')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Implement backup
              },
              child: const Text('Backup Data'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement restore
              },
              child: const Text('Restore Data'),
            ),
          ],
        ),
      ),
    );
  }
}
