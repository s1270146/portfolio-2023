import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/custom_color.dart';
import 'package:portfolio_2023/page/main_content_page/main_content_page_provider.dart';

class HeaderTag extends ConsumerWidget {
  const HeaderTag({
    super.key,
    required this.transitionTargetWidget,
    required this.text,
  });

  final Widget transitionTargetWidget;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myColor = ref.watch(customColorProvider);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => ref.read(currentPageProvider.notifier).update(
              (state) => transitionTargetWidget,
            ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 26,
                color: myColor.pink,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
