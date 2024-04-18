import 'package:flutter/material.dart';

class SplitView extends StatelessWidget {
  final Widget menu;
  final Widget content;
  final double breakpoint;
  final double drawerWidth;

  const SplitView({
    super.key,
    required this.menu,
    required this.content,
    this.drawerWidth = 300,
    this.breakpoint = 992,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= breakpoint
        ? Row(
            children: [
              SizedBox(
                width: drawerWidth,
                child: Scaffold(body: menu),
              ),
              const VerticalDivider(width: 1),
              Expanded(child: content),
            ],
          )
        : Scaffold(
            body: content,
            drawer: Drawer(child: menu),
          );
  }
}
