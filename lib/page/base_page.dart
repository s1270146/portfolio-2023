import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/custom_color.dart';
import 'package:portfolio_2023/component/header/custom_drawer.dart';
import 'package:portfolio_2023/component/header/header.dart';
import 'package:portfolio_2023/component/variable_provider.dart';
import 'package:portfolio_2023/page/main_content_page/main_content_page_provider.dart';

class BasePage extends ConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxPhoneWidth = ref.watch(mediumSizeProvider);
    final currentPage = ref.watch(currentPageProvider);
    final myColor = ref.watch(customColorProvider);
    return Scaffold(
      backgroundColor: myColor.pink,
      appBar: const Header(),
      endDrawer: MediaQuery.of(context).size.width > maxPhoneWidth
          ? null
          : const CustomDrawer(),
      body: currentPage,
    );
  }
}
