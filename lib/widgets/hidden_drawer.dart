import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:church_cms/providers/hidden_drawer_provider.dart';
import 'package:church_cms/providers/bottom_navigation_provider.dart';
import 'package:church_cms/widgets/route_animations.dart';
import 'package:church_cms/screens/settings.dart';
import 'package:church_cms/screens/auth/profile.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  _HiddenDrawerState createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  @override
  Widget build(BuildContext context) {
    Function setPageIndex =
        context.watch<BottomNavigationProvider>().setPageIndex;
    Function closeDrawer = context.watch<HiddenDrawerProvider>().closeDrawer;

    return SafeArea(
      child: Column(
        children: [
          ListTile(
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              closeDrawer();
              setPageIndex(0);
            },
            leading: const Icon(Icons.home, color: Colors.white),
          ),
          ListTile(
            title: const Text('Profile', style: TextStyle(color: Colors.white)),
            onTap: () {
              closeDrawer();
              Navigator.push(
                context,
                SlideUpRoute(
                  page: const ProfileScreen(),
                ),
              );
            },
            leading: const Icon(Icons.person, color: Colors.white),
          ),
          ListTile(
            title:
                const Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              closeDrawer();
              Navigator.push(
                context,
                SlideUpRoute(
                  page: const SettingsScreen(),
                ),
              );
            },
            leading: const Icon(Icons.settings, color: Colors.white),
          ),
          ListTile(
            title: const Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () => {},
            leading: const Icon(Icons.logout, color: Colors.white),
          )
        ],
      ),
    );
  }
}
