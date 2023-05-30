import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/page/main_content_page/main_content_page_provider.dart';

class CustomDrawerTag extends ConsumerWidget {
  const CustomDrawerTag(
      {super.key, required this.title, required this.transitionTargetWidget});

  final String title;
  final Widget transitionTargetWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            ref.read(currentPageProvider.notifier).update(
                  (state) => transitionTargetWidget,
                );
          },
          child: Container(
            color: Colors.green,
            height: 80,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
