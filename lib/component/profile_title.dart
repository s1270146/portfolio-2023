import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/custom_color.dart';

class ProfileTitle extends ConsumerWidget {
  const ProfileTitle({
    super.key,
    required this.title,
    required this.profileTitleWidth,
  });

  final String title;
  final double profileTitleWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myColor = ref.watch(customColorProvider);

    return Container(
      width: profileTitleWidth,
      margin: const EdgeInsets.only(
        bottom: 5,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: myColor.blue,
            width: 1,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 32,
          color: myColor.blue,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
