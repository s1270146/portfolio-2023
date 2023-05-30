import 'package:flutter/material.dart';
import 'package:portfolio_2023/component/header/custom_drawer_tag.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.blue,
            height: 120,
          ),
          const CustomDrawerTag(title: 'Profile'),
          const CustomDrawerTag(title: 'Works'),
          const CustomDrawerTag(title: 'Blog'),
          const CustomDrawerTag(title: 'Research'),
        ],
      ),
    );
  }
}
