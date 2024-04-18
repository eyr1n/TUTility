import 'package:flutter/material.dart';
import 'package:tutility/scope_functions.dart';

class PageScaffold extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Widget? body;

  const PageScaffold({
    super.key,
    this.title,
    this.actions,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Scaffold.maybeOf(context)?.let(
          (scaffold) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              scaffold.openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        title: title,
        actions: actions,
        centerTitle: false,
      ),
      body: body,
    );
  }
}
