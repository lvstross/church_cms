import 'package:flutter/material.dart';

class PhoneVerifyScreen extends StatelessWidget {
  const PhoneVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Verify'),
      ),
      body: Center(
        child: Text(
          'Phone Verify Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
