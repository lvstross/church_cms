import 'package:flutter/material.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset'),
      ),
      body: Center(
        child: Text(
          'Reset Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
