// ignore_for_file: annotate_overrides, overridden_fields

import 'package:flutter/material.dart';
import 'package:smartbin/layout/layout.dart';

class AppPage extends Scaffold {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final BottomNavigationBar? customBottomNavigationBar;
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  AppPage({Key? key,
    required this.title,
    required this.body,
    this.actions,
    this.leading,
    this.floatingActionButton,
    this.customBottomNavigationBar,
  }) : super(
    key: key,
    backgroundColor: const Color.fromARGB(255, 237, 247, 235),
    bottomNavigationBar: customBottomNavigationBar,
    appBar: AppBar(
        title: Text(title),
        actions: actions,
        leading: IconButton(
          onPressed: () => LayoutState.layoutKey.currentState?.openDrawer(), 
          icon: const Icon(Icons.menu)
        ),
    ),
    body: body,
    floatingActionButton: floatingActionButton
  );
}
