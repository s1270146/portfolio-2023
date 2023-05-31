import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/custom_color.dart';

class SkillGauge extends ConsumerWidget {
  const SkillGauge({
    super.key,
    required this.skillPoint,
    required this.skillName,
    required this.widgetWidth,
  });

  final int skillPoint;
  final String skillName;
  final double widgetWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      width: widgetWidth,
      child: Column(
        children: [
          SizedBox(
            width: widgetWidth,
            child: Text(
              skillName,
              style: const TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            width: widgetWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: widgetWidth * 0.75,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: LinearProgressIndicator(
                      value: (skillPoint).toDouble() / 100,
                      valueColor:
                          AlwaysStoppedAnimation(getCurrentHpColor(skillPoint)),
                      backgroundColor: Colors.grey,
                      minHeight: 20,
                    ),
                  ),
                ),
                Text(
                  '${skillPoint.toString().padLeft(4, '  ')}/100',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getCurrentHpColor(int value) {
    if (value > 80) {
      return Colors.red;
    }
    if (value > 100 / 2) {
      return const Color.fromARGB(255, 255, 136, 0);
    }
    if (value > 100 / 5) {
      return const Color.fromARGB(255, 255, 221, 0);
    }
    return Colors.green;
  }
}
