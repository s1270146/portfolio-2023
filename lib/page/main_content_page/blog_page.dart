import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/profile/profile_title.dart';
import 'package:portfolio_2023/component/variable_provider.dart';

class BlogPage extends ConsumerWidget {
  const BlogPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(blogArticleListProvider);
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
            articles.when(
              data: (data) {
                List<Widget> widgets = [];
                int i = 0;
                for (var article in data) {
                  widgets.add(Container(
                    margin: const EdgeInsets.all(20),
                    child: article.articleTitle(i, widgetWidth, ref, 'blog'),
                  ));
                  i++;
                }
                return Column(
                  children: widgets,
                );
              },
              error: (e, trace) {
                return Text(e.toString());
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
