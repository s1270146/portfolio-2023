import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomColor {
  final Color pink;
  final Color green;
  final Color blue;
  final Color orange;

  CustomColor({
    required this.pink,
    required this.green,
    required this.blue,
    required this.orange,
  });
}

final customColorProvider = StateProvider<CustomColor>(
  (ref) => CustomColor(
    pink: const Color(0xFFFFEBEB),
    green: const Color(0xFFADE4DB),
    blue: const Color(0xFF6DA9E4),
    orange: const Color(0xFFF6BA6F),
  ),
);
