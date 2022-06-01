import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:church_cms/screens/messaging/messaging.dart';
import 'package:church_cms/providers/hidden_drawer_provider.dart';
import 'package:church_cms/widgets/route_animations.dart';

class MediaListScreen extends StatelessWidget {
  const MediaListScreen({Key? key}) : super(key: key);

  static String title = 'Media List Screen';
  static String iconTitle = 'Media';

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Podcast'),
    Tab(text: 'Videos'),
  ];

  @override
  Widget build(BuildContext context) {
    Function openDrawer = context.watch<HiddenDrawerProvider>().openDrawer;

    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(MediaListScreen.title),
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
            bottom: TabBar(
              indicatorColor: Theme.of(context).colorScheme.tertiary,
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return Center(
                child: Text(
                  '${tab.text!} Tab',
                  style: Theme.of(context).textTheme.headline4,
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
