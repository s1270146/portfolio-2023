import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_2023/page/main_content_page/profile_page.dart';

final currentPageProvider = StateProvider<Widget>(
  (ref) => const ProfilePage(),
);
