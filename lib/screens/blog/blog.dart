import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
      ),
      body: Center(
        child: Text(
          'Blog Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
