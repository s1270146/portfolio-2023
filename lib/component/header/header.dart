import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/header/header_tag.dart';
import 'package:portfolio_2023/component/variable_provider.dart';
import 'package:portfolio_2023/page/home_page.dart';
import 'package:portfolio_2023/page/base_page.dart';

class Header extends ConsumerWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxPhoneWidth = ref.watch(maxPhoneWidthProvider);
    return AppBar(
      toolbarHeight: 70,
      leadingWidth: 100,
      leading: MouseRegion(
        cursor: SystemMouseCursors.click, // クリックカーソルを指定
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
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
                transitionTargetWidget: BasePage(),
              ),
              HeaderTag(
                text: 'WORKS',
                transitionTargetWidget: BasePage(),
              ),
              HeaderTag(
                text: 'BLOG',
                transitionTargetWidget: BasePage(),
              ),
              HeaderTag(
                text: 'RESEARCH',
                transitionTargetWidget: BasePage(),
              ),
              SizedBox(
                width: 20,
              ),
            ]
          : null,
    );
  }
}
