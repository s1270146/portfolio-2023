import 'package:flutter/material.dart';

class HeaderTag extends StatelessWidget {
  const HeaderTag({
    super.key,
    required this.transitionTargetWidget,
    required this.text,
  });

  final Widget transitionTargetWidget;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 26,
          ),
        ),
      ),
    );
  }
}
