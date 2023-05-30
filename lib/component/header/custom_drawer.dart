import 'package:flutter/material.dart';
import 'package:portfolio_2023/component/header/custom_drawer_tag.dart';
import 'package:portfolio_2023/page/main_content_page/blog_page.dart';
import 'package:portfolio_2023/page/main_content_page/profile_page.dart';
import 'package:portfolio_2023/page/main_content_page/research_page.dart';
import 'package:portfolio_2023/page/main_content_page/works_page.dart';

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
          const CustomDrawerTag(
            title: 'Profile',
            transitionTargetWidget: ProfilePage(),
          ),
          const CustomDrawerTag(
            title: 'Works',
            transitionTargetWidget: WorksPage(),
          ),
          const CustomDrawerTag(
            title: 'Blog',
            transitionTargetWidget: BlogPage(),
          ),
          const CustomDrawerTag(
            title: 'Research',
            transitionTargetWidget: ResearchPage(),
          ),
        ],
      ),
    );
  }
}
