import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/custom_color.dart';
import 'package:portfolio_2023/component/header/custom_drawer_tag.dart';
import 'package:portfolio_2023/page/main_content_page/blog_page.dart';
import 'package:portfolio_2023/page/main_content_page/profile_page.dart';
import 'package:portfolio_2023/page/main_content_page/research_page.dart';
import 'package:portfolio_2023/page/main_content_page/works_page.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myColor = ref.watch(customColorProvider);
    return Drawer(
      backgroundColor: myColor.green,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: myColor.green,
            height: 80,
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
