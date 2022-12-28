import 'package:flutter/material.dart';
import 'package:smartbin/pages/home_page.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}
