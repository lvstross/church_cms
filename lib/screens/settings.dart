import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          iconSize: 36,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.keyboard_arrow_down),
        ),
      ),
      body: Center(
        child: Text(
          'Settings Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
