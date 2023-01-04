import 'package:flutter/material.dart';
import 'package:smartbin/layout/custom_drawer.dart';
import 'package:smartbin/layout/drawer_tabs.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => LayoutState();
}

class LayoutState extends State<Layout> with TickerProviderStateMixin {


  late TabController tabController;
  static late GlobalKey<ScaffoldState> layoutKey;

  @override
  void initState() {
    super.initState();
    layoutKey = GlobalKey();
    tabController = TabController(
      length: DrawerTabs.tabPages.length, 
      vsync: this
    );
  }

  @override
  void dispose() {
    layoutKey.currentState?.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: layoutKey,
      drawer: CustomDrawer(
        tabController: tabController,
      ),
      body: TabBarView(
        controller: tabController,
        children: DrawerTabs.tabPages,
      ),
    );
  }
}
