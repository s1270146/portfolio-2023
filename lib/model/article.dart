import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    return Container(
      decoration: BoxDecoration(
        color: no % 2 == 0 ? myColor.green : myColor.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      width: widgetWidth,
      height: 130,
      child: Row(
        children: [
          Container(
            width: 150,
            height: 100,
            margin: const EdgeInsets.all(10),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              clipBehavior: Clip.antiAlias,
              child: Image.asset(imagePath),
            ),
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 26,
                  ),
                ),
                Text(createDate.toString()),
                const SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: overview != null,
                  child: Text(overview!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
