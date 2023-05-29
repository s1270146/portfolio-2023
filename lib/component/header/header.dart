import 'package:flutter/material.dart';
import 'package:portfolio_2023/component/header/header_tag.dart';
import 'package:portfolio_2023/page/profile_page.dart';

class Header extends PreferredSize {
  Header({super.key})
      : super(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            leading: GestureDetector(
              child: Image.asset(
                'images/title.png',
                colorBlendMode: BlendMode.srcIn,
                color: Colors.transparent,
              ),
            ),
            title: const Text("ヘッダー"),
            automaticallyImplyLeading: false,
            actions: const [
              HeaderTag(
                text: 'PROFILE',
                transitionTargetWidget: ProfilePage(),
              ),
              HeaderTag(
                text: 'WORKS',
                transitionTargetWidget: ProfilePage(),
              ),
              HeaderTag(
                text: 'BLOG',
                transitionTargetWidget: ProfilePage(),
              ),
              HeaderTag(
                text: 'RESEARCH',
                transitionTargetWidget: ProfilePage(),
              ),
            ],
          ),
        );
}
