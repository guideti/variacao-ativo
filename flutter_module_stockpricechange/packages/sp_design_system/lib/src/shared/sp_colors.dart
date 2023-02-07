import 'package:flutter/material.dart';

class SpColors {
  SpColors._({
    required this.background,
    required this.header,
    required this.body,
    required this.bodyLight,
    required this.border,
  });

  static SpColors light = SpColors._(
    background: const SpColor._(0xFFFFFFFF),
    header: const SpColor._(0xFF000000),
    body: const SpColor._(0xFF000000),
    bodyLight: const SpColor._(0xFF5F676F),
    border: const SpColor._(0xFFE6E6E6),
  );

  static SpColors dark = SpColors._(
    background: const SpColor._(0xFF1B1B1B),
    header: const SpColor._(0xFFFFFFFF),
    body: const SpColor._(0xFFF5F5F5),
    bodyLight: const SpColor._(0xFF9AA4AE),
    border: const SpColor._(0xFF3F3F3F),
  );

  final SpColor background;
  final SpColor header;
  final SpColor body;
  final SpColor bodyLight;
  final SpColor border;

  static const SpColor green = SpColor._(0xFF19AF00);
  static const SpColor green10 = SpColor._(0x1919AF00);
  static const SpColor green40 = SpColor._(0x6619AF00);

  static const SpColor red = SpColor._(0xFFD92A2A);
}

class SpColor extends Color {
  const SpColor._(super.value);
}
