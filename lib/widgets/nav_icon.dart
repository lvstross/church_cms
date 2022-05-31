import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {
  const NavIcon({
    Key? key,
    required this.text,
    required this.size,
    required this.active,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.onPress,
  }) : super(key: key);

  final String text;
  final double size;
  final bool active;
  final Icon activeIcon;
  final Icon inactiveIcon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: size,
        color: Colors.white,
        padding: const EdgeInsets.all(0),
        enableFeedback: false,
        onPressed: onPress,
        icon: Column(
          children: [
            active ? activeIcon : inactiveIcon,
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ));
  }
}
