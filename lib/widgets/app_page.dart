// ignore_for_file: annotate_overrides, overridden_fields

import 'package:flutter/material.dart';
import 'package:smartbin/widgets/custom_drawer.dart';

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
    bottomNavigationBar: customBottomNavigationBar,
    appBar: AppBar(
        title: Text(title),
        actions: actions,
        leading: leading,
    ),
    body: body,
    drawer: const CustomDrawer(),
    floatingActionButton: floatingActionButton
  );
}
