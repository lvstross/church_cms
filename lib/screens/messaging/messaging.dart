import 'package:flutter/material.dart';

class MessagingScreen extends StatelessWidget {
  const MessagingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messaging'),
        leading: IconButton(
          iconSize: 36,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.keyboard_arrow_down),
        ),
      ),
      body: Center(
        child: Text(
          'Messaging Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
