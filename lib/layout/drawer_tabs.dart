// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smartbin/pages/device_page.dart';
import 'package:smartbin/pages/grocery_list_page.dart';

class DrawerTabs {
  static List<Widget> tabPages = pageTabs.map((pageTab) => pageTab.page).toList();

  static List<PageTab> pageTabs = [
    groceryPageTab,
    devicePageTab
  ]..sort((a,b) => a.index.compareTo(b.index));


  static PageTab groceryPageTab = PageTab(
    page: const GroceryListPage(), 
    icon: Icons.list, 
    title: 'Grocery list', 
    index: 0
  );

  static PageTab devicePageTab = PageTab(
    page: const DevicePage(), 
    icon: Icons.developer_board, 
    title: 'Device', 
    index: 1
  );
}


class PageTab extends Equatable{
  Widget page;
  IconData icon;
  String title;
  int index;
  PageTab({
    required this.page,
    required this.icon,
    required this.title,
    required this.index
  });
  
  @override
  List<Object> get props => [index];
}
