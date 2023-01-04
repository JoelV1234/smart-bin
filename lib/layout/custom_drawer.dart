import 'package:flutter/material.dart';
import 'package:smartbin/layout/drawer_tabs.dart';
import 'package:smartbin/layout/layout.dart';

class CustomDrawer extends StatefulWidget {
  final TabController tabController;
  const CustomDrawer({ Key? key,
    required this.tabController
  }) : super(key: key);

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {

  void navigateTo(int tabIndex) {
    widget.tabController.animateTo(tabIndex);
    LayoutState.layoutKey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 60),
        ] + DrawerTabs.pageTabs.map((tab) => ListTile(
            leading: Icon(tab.icon),
            title: Text(tab.title), 
            onTap: () => navigateTo(tab.index)
          )).toList()
        + [
          
        ],
      ),
    );
  }
}