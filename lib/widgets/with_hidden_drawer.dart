import 'package:flutter/material.dart';
import 'package:church_cms/providers/hidden_drawer_provider.dart';
import 'package:church_cms/widgets/hidden_drawer.dart';
import 'package:provider/provider.dart';

class WithHiddenDrawer extends StatefulWidget {
  const WithHiddenDrawer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _WithHiddenDrawerState createState() => _WithHiddenDrawerState();
}

class _WithHiddenDrawerState extends State<WithHiddenDrawer> {
  @override
  Widget build(BuildContext context) {
    double xOffset = context.watch<HiddenDrawerProvider>().xOffset;
    double yOffset = context.watch<HiddenDrawerProvider>().yOffset;
    double scaleFactor = context.watch<HiddenDrawerProvider>().scaleFactor;
    bool isDrawerOpen = context.watch<HiddenDrawerProvider>().isDrawerOpen;
    bool isDragging = context.watch<HiddenDrawerProvider>().isDragging;
    Function openDrawer = context.watch<HiddenDrawerProvider>().openDrawer;
    Function closeDrawer = context.watch<HiddenDrawerProvider>().closeDrawer;
    Function setIsDragging =
        context.watch<HiddenDrawerProvider>().setIsDragging;

    return WillPopScope(
      // Android back handler
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey[700],
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
              width: 220,
              child: const HiddenDrawer(),
            ),
            GestureDetector(
              onTap: () => closeDrawer(),
              onHorizontalDragStart: (details) => setIsDragging(true),
              onHorizontalDragUpdate: (details) {
                if (!isDragging) return;

                const delta = 1;
                if (details.delta.dx > delta) {
                  openDrawer();
                } else if (details.delta.dx < -delta) {
                  closeDrawer();
                }

                setIsDragging(false);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOutCubic,
                transform: Matrix4.translationValues(xOffset, yOffset, 0)
                  ..scale(scaleFactor),
                child: AbsorbPointer(
                  absorbing: isDrawerOpen,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: widget.child,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
