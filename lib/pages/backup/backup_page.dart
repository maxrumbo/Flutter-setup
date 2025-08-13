import 'package:flutter/material.dart';

class BackupPage extends StatelessWidget {
  const BackupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Backup & Restore')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  // TODO: Implement backup
                },
                child: const Text('Backup Data'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.secondary,
                  foregroundColor: theme.colorScheme.onSecondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  // TODO: Implement restore
                },
                child: const Text('Restore Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
