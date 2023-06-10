import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/profile/profile_title.dart';
import 'package:portfolio_2023/component/variable_provider.dart';
import 'package:portfolio_2023/model/article.dart';

class BlogPage extends ConsumerWidget {
  const BlogPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Article> articles = [];
    final mediumSize = ref.watch(mediumSizeProvider);
    final widgetWidth = mediumSize < MediaQuery.of(context).size.width
        ? 600.0
        : MediaQuery.of(context).size.width / 6 * 5;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child:
                  ProfileTitle(profileTitleWidth: widgetWidth, title: 'Blog'),
            ),
            for (int i = 0; i < articles.length; i++) ...{
              Container(
                margin: const EdgeInsets.all(20),
                child: articles[i].articleTitle(i, widgetWidth, ref),
              )
            }
          ],
        ),
      ),
    );
  }
}
