import 'package:flutter/material.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verify'),
      ),
      body: Center(
        child: Text(
          'Email Verify Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
