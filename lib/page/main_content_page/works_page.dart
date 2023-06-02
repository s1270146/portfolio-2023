import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/profile/profile_title.dart';
import 'package:portfolio_2023/model/article.dart';

class WorksPage extends ConsumerWidget {
  const WorksPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Article> articles = [
      Article(
        title: 'テスト1',
        createDate: DateTime.now(),
        imagePath: "images/back.jpg",
        overview:
            'tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt',
      ),
      Article(
        title: 'テスト2',
        createDate: DateTime.now(),
        imagePath: "images/back.jpg",
        overview: 'tttttttttttttttttttttttttttttttttttttttttttt',
      ),
      Article(
        title: 'テスト3',
        createDate: DateTime.now(),
        imagePath: "images/back.jpg",
        overview: 'tttttttttttttttttttttttttttttttttttttttttttt',
      ),
      Article(
        title: 'テスト4',
        createDate: DateTime.now(),
        imagePath: "images/back.jpg",
        overview: 'tttttttttttttttttttttttttttttttttttttttttttt',
      ),
    ];
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: const ProfileTitle(profileTitleWidth: 500, title: 'Works'),
            ),
            for (int i = 0; i < articles.length; i++) ...{
              Container(
                margin: const EdgeInsets.all(20),
                child: articles[i].articleTitle(i, 500, ref),
              )
            }
          ],
        ),
      ),
    );
  }
}
