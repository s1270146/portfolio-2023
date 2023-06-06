import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_2023/component/custom_color.dart';

class Article {
  final String title;
  final DateTime createDate;
  final DateTime? editDate;
  final String imagePath;
  final String? overview;

  const Article({
    required this.title,
    required this.createDate,
    this.editDate,
    required this.imagePath,
    this.overview,
  });

  Widget articleTitle(int no, double widgetWidth, WidgetRef ref) {
    final myColor = ref.watch(customColorProvider);
    final format = DateFormat('yyyy年MM月dd日');
    return Container(
      decoration: BoxDecoration(
        color: no % 2 == 0 ? myColor.green : myColor.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      width: widgetWidth,
      height: widgetWidth > 450 ? 130 : 100,
      child: Row(
        children: [
          Container(
            width: widgetWidth / 10 * 3,
            height: widgetWidth / 10 * 2,
            margin: widgetWidth > 500
                ? const EdgeInsets.all(10)
                : const EdgeInsets.all(3),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              clipBehavior: Clip.antiAlias,
              child: Image.asset(imagePath),
            ),
          ),
          Container(
            width: widgetWidth / 5 * 3,
            margin: widgetWidth > 500
                ? const EdgeInsets.all(10)
                : const EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: widgetWidth > 450
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
                Text(
                  format.format(createDate),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: overview != null && widgetWidth > 450,
                  child: Text(
                    overview!,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}