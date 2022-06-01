import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:church_cms/screens/messaging/messaging.dart';
import 'package:church_cms/providers/hidden_drawer_provider.dart';
import 'package:church_cms/widgets/route_animations.dart';

class PrayerScreen extends StatelessWidget {
  const PrayerScreen({Key? key}) : super(key: key);

  static String title = 'Prayer Screen';
  static String iconTitle = 'Prayer';

  @override
  Widget build(BuildContext context) {
    Function openDrawer = context.watch<HiddenDrawerProvider>().openDrawer;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(PrayerScreen.title),
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
          'Prayer Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
