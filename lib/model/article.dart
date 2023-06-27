import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_2023/component/custom_color.dart';
import 'package:portfolio_2023/page/main_content_page/article_page.dart';
import 'package:portfolio_2023/page/main_content_page/main_content_page_provider.dart';

class Article {
  final String id;
  final String title;
  final DateTime createDate;
  final DateTime? editDate;
  final String imagePath;
  final String? overview;
  final String contents;

  const Article({
    required this.id,
    required this.title,
    required this.createDate,
    this.editDate,
    required this.imagePath,
    this.overview,
    required this.contents,
  });

  factory Article.fromJson(String id, Map<String, dynamic> data) {
    return Article(
        id: id,
        title: data['title'],
        createDate: data['createDate'].toDate(),
        editDate: data['editDate']?.toDate(),
        imagePath: data['imagePath'],
        overview: data['overview'],
        contents: data['contents']);
  }

  Article copyWith({
    String? id,
    String? title,
    DateTime? createDate,
    DateTime? editDate,
    String? imagePath,
    String? overview,
    String? contents,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      createDate: createDate ?? this.createDate,
      editDate: editDate ?? this.editDate,
      imagePath: imagePath ?? this.imagePath,
      overview: overview ?? this.overview,
      contents: contents ?? this.contents,
    );
  }

  Map<String, dynamic> toJson({
    String? title,
    DateTime? createDate,
    DateTime? editDate,
    String? imagePath,
    String? overview,
    String? contents,
  }) {
    return {
      'title': title ?? this.title,
      'createDate': createDate ?? this.createDate,
      'editDate': editDate ?? this.editDate,
      'imagePath': imagePath ?? this.imagePath,
      'overview': overview ?? this.overview,
      'contents': contents ?? this.contents,
    };
  }

  void toFirestore({required String collectionName}) {
    FirebaseFirestore.instance.collection(collectionName).doc(id).update(
          toJson(),
        );
  }

  Widget articleTitle(
      int index, double widgetWidth, WidgetRef ref, String category) {
    final myColor = ref.watch(customColorProvider);
    final format = DateFormat('yyyy年MM月dd日');
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          ref.read(currentPageProvider.notifier).update(
                (state) => ArticlePage(
                  data: contents,
                  category: category,
                ),
              );
        },
        child: Container(
          decoration: BoxDecoration(
            color: index % 2 == 0 ? myColor.green : myColor.orange,
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
                  child: Image.network(
                    imagePath,
                    errorBuilder: (context, object, stackTrace) {
                      print('Load failed : ${context.toString()}');
                      return const Icon(
                        Icons.error,
                        color: Colors.red,
                      );
                    },
                  ),
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
        ),
      ),
    );
  }
}
