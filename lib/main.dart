import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:church_cms/providers/bottom_navigation_provider.dart';
import 'package:church_cms/providers/hidden_drawer_provider.dart';
import 'package:church_cms/screens/home.dart';
import 'package:church_cms/screens/media/media_list.dart';
import 'package:church_cms/screens/events/events_list.dart';
import 'package:church_cms/screens/prayer.dart';
import 'package:church_cms/screens/more.dart';
import 'package:church_cms/widgets/nav_icon.dart';
import 'package:church_cms/widgets/with_hidden_drawer.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HiddenDrawerProvider()),
      ChangeNotifierProvider(create: (_) => BottomNavigationProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Church CMS',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final pages = [
    const HomeScreen(),
    const MediaListScreen(),
    const EventsListScreen(),
    const PrayerScreen(),
    const MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    int pageIndex = context.watch<BottomNavigationProvider>().pageIndex;
    Function setPageIndex =
        context.watch<BottomNavigationProvider>().setPageIndex;

    return WithHiddenDrawer(
      child: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Column(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavIcon(
                      text: HomeScreen.iconTitle,
                      size: 29,
                      active: pageIndex == 0,
                      activeIcon: const Icon(Icons.home_sharp),
                      inactiveIcon: const Icon(Icons.home_outlined),
                      onPress: () => setPageIndex(0),
                    ),
                    NavIcon(
                      text: MediaListScreen.iconTitle,
                      size: 28,
                      active: pageIndex == 1,
                      activeIcon: const Icon(Icons.mic),
                      inactiveIcon: const Icon(Icons.mic_none),
                      onPress: () => setPageIndex(1),
                    ),
                    NavIcon(
                      text: EventsListScreen.iconTitle,
                      size: 28,
                      active: pageIndex == 2,
                      activeIcon: const Icon(Icons.calendar_month),
                      inactiveIcon: const Icon(Icons.calendar_month_outlined),
                      onPress: () => setPageIndex(2),
                    ),
                    NavIcon(
                      text: PrayerScreen.iconTitle,
                      size: 26,
                      active: pageIndex == 3,
                      activeIcon: const Icon(Icons.back_hand),
                      inactiveIcon: const Icon(Icons.back_hand_outlined),
                      onPress: () => setPageIndex(3),
                    ),
                    NavIcon(
                      text: MoreScreen.iconTitle,
                      size: 28,
                      active: pageIndex == 1,
                      activeIcon: const Icon(Icons.more_horiz),
                      inactiveIcon: const Icon(Icons.more_horiz),
                      onPress: () => setPageIndex(4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
