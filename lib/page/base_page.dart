import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/component/header/header.dart';
import 'package:portfolio_2023/component/variable_provider.dart';

class BasePage extends ConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxPhoneWidth = ref.watch(maxPhoneWidthProvider);
    return Scaffold(
      appBar: const Header(),
      endDrawer:
          MediaQuery.of(context).size.width > maxPhoneWidth ? null : Drawer(),
      body: Container(),
    );
  }
}
