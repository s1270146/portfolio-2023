import 'package:flutter/material.dart';
import 'package:markdown_widget/config/all.dart';
import 'package:markdown_widget/widget/all.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return MarkdownWidget(
      data: data,
      config: MarkdownConfig.defaultConfig,
    );
  }
}
