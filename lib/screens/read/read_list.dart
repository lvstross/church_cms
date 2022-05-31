import 'package:flutter/material.dart';

class ReadListScreen extends StatelessWidget {
  const ReadListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read List'),
      ),
      body: Center(
        child: Text(
          'Read List Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
