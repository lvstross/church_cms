import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:church_cms/screens/messaging/messaging.dart';
import 'package:church_cms/providers/hidden_drawer_provider.dart';
import 'package:church_cms/widgets/route_animations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String title = 'Home Screen';
  static String iconTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    Function openDrawer = context.watch<HiddenDrawerProvider>().openDrawer;

    return Scaffold(
      appBar: AppBar(
        title: Text(HomeScreen.title),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => openDrawer(),
        ),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                SlideUpRoute(
                  page: const MessagingScreen(),
                ),
              )
            },
            icon: const Icon(Icons.messenger_outline),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Home Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
