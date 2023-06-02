import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileSentence extends ConsumerWidget {
  const ProfileSentence({
    super.key,
    required this.sentence,
    required this.profileSentenceWidth,
  });

  final String sentence;
  final double profileSentenceWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: profileSentenceWidth,
      margin: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Text(
        sentence,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
