import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event'),
      ),
      body: Center(
        child: Text(
          'Event Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
