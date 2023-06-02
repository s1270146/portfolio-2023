import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/custom_color.dart';
import 'package:portfolio_2023/component/header/header_tag.dart';
import 'package:portfolio_2023/component/variable_provider.dart';
import 'package:portfolio_2023/page/main_content_page/blog_page.dart';
import 'package:portfolio_2023/page/main_content_page/profile_page.dart';
import 'package:portfolio_2023/page/main_content_page/research_page.dart';
import 'package:portfolio_2023/page/main_content_page/works_page.dart';

class Header extends ConsumerWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myColor = ref.watch(customColorProvider);
    final maxPhoneWidth = ref.watch(mediumSizeProvider);
    return AppBar(
      iconTheme: IconThemeData(
        color: myColor.pink,
        size: 50,
      ),
      backgroundColor: myColor.blue,
      toolbarHeight: 70,
      leadingWidth: 100,
      leading: MouseRegion(
        cursor: SystemMouseCursors.click, // クリックカーソルを指定
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            // padding: const EdgeInsets.all(0),
            child: Image.asset(
              'images/title.png',
              colorBlendMode: BlendMode.srcIn,
              color: Colors.transparent,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      // title: const Text("ヘッダー"),
      automaticallyImplyLeading: false, // 戻るボタン無くす
      elevation: 0.0, // 影を無くす
      actions: MediaQuery.of(context).size.width > maxPhoneWidth
          ? const [
              HeaderTag(
                text: 'PROFILE',
                transitionTargetWidget: ProfilePage(),
              ),
              HeaderTag(
                text: 'WORKS',
                transitionTargetWidget: WorksPage(),
              ),
              HeaderTag(
                text: 'BLOG',
                transitionTargetWidget: BlogPage(),
              ),
              HeaderTag(
                text: 'RESEARCH',
                transitionTargetWidget: ResearchPage(),
              ),
              SizedBox(
                width: 20,
              ),
            ]
          : null,
    );
  }
}
