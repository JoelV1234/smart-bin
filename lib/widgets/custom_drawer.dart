import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({ Key? key }) : super(key: key);

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 60),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Grocery List'), 
            onTap: () {}
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'), 
            onTap: () {}
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Waste goals'), 
            onTap: () {}
          ),        
        ],
      ),
    );
  }
}