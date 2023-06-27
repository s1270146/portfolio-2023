import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/config/all.dart';
import 'package:markdown_widget/widget/all.dart';
import 'package:portfolio_2023/component/custom_color.dart';
import 'package:portfolio_2023/page/main_content_page/blog_page.dart';
import 'package:portfolio_2023/page/main_content_page/main_content_page_provider.dart';
import 'package:portfolio_2023/page/main_content_page/profile_page.dart';
import 'package:portfolio_2023/page/main_content_page/research_page.dart';
import 'package:portfolio_2023/page/main_content_page/works_page.dart';

class ArticlePage extends ConsumerWidget {
  const ArticlePage({
    super.key,
    required this.data,
    required this.category,
  });
  final String data;
  final String category;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myColor = ref.watch(customColorProvider);
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 9 / 10,
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: myColor.blue,
                      ),
                      onPressed: () {
                        ref
                            .read(currentPageProvider.notifier)
                            .update((state) => backPage());
                      },
                      child: Text('$category一覧に戻る'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 9 / 10,
                height: MediaQuery.of(context).size.height * 5 / 6,
                child: MarkdownWidget(
                  data: data,
                  config: MarkdownConfig.defaultConfig,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget backPage() {
    if (category == 'works') {
      return const WorksPage();
    } else if (category == 'research') {
      return const ResearchPage();
    } else if (category == 'blog') {
      return const BlogPage();
    }
    return const ProfilePage();
  }
}
