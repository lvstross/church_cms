import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:church_cms/screens/messaging/messaging.dart';
import 'package:church_cms/providers/hidden_drawer_provider.dart';
import 'package:church_cms/widgets/route_animations.dart';
import 'package:church_cms/screens/blog/blog_list.dart';
import 'package:church_cms/screens/read/read_list.dart';
import 'package:church_cms/widgets/route_animations.dart';

class Screen {
  String title;
  Widget screen;
  Screen({required this.title, required this.screen});
}

final List<Screen> screens = [
  Screen(title: 'Blog', screen: const BlogListScreen()),
  Screen(title: 'Reading', screen: const ReadListScreen()),
];

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  static String title = 'More Screen';
  static String iconTitle = 'More';

  @override
  Widget build(BuildContext context) {
    Function openDrawer = context.watch<HiddenDrawerProvider>().openDrawer;

    return Scaffold(
      appBar: AppBar(
        title: Text(MoreScreen.title),
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
      body: GridView.builder(
          itemCount: screens.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context, SlideLeftRoute(page: screens[index].screen));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                      child: Text(
                    screens[index].title,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  )),
                ),
              ),
            );
          }),
    );
  }
}
