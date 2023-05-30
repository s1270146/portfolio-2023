import 'package:flutter/material.dart';

class SkillGauge extends StatelessWidget {
  const SkillGauge({
    super.key,
    required this.skillPoint,
    required this.skillName,
    required this.halfWidth,
  });

  final int skillPoint;
  final String skillName;
  final double halfWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: halfWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 50, child: Text(skillName)),
          SizedBox(
            width: 300,
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
          Text('${skillPoint.toString().padLeft(4, '  ')}/100'),
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
