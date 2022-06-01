import 'package:flutter/material.dart';

class BlogListScreen extends StatelessWidget {
  const BlogListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Blog List'),
      ),
      body: Center(
        child: Text(
          'Blog List Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
