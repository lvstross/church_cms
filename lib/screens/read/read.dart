import 'package:flutter/material.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read'),
      ),
      body: Center(
        child: Text(
          'Read Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
