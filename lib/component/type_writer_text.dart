import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/page/base_page.dart';
import 'package:portfolio_2023/page/main_content_page/main_content_page_provider.dart';

class TypeWriterText extends ConsumerWidget {
  const TypeWriterText({
    super.key,
    required this.displayText,
    required this.transitionTargetWidget,
  });

  final String displayText;
  final Widget transitionTargetWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {},
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 60.0,
          fontFamily: 'Agne',
        ),
        child: AnimatedTextKit(
          totalRepeatCount: 20,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BasePage(),
              ),
            );
            ref.read(currentPageProvider.notifier).update(
                  (state) => transitionTargetWidget,
                );
          },
          pause: const Duration(milliseconds: 3000),
          animatedTexts: [
            TypewriterAnimatedText(
              displayText,
              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              displayText.toUpperCase(),
              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              displayText.toLowerCase(),
              speed: const Duration(milliseconds: 100),
            ),
          ],
        ),
      ),
    );
  }
}
