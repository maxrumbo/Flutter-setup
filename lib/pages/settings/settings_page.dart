import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  const SettingsPage({super.key, required this.isDarkMode, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Pengaturan')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Mode Gelap', style: theme.textTheme.bodyLarge),
            value: isDarkMode,
            onChanged: onThemeChanged,
            activeColor: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
