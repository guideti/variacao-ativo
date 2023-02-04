import 'package:flutter/material.dart';

class SpColors {
  SpColors._({
    required this.background,
    required this.header,
    required this.body,
    required this.bodyLight,
  });

  static SpColors light = SpColors._(
    background: const SpColor._(0xFFFFFFFF),
    header: const SpColor._(0xFF000000),
    body: const SpColor._(0xFF000000),
    bodyLight: const SpColor._(0xFF5F676F),
  );

  static SpColors dark = SpColors._(
    background: const SpColor._(0xFF1B1B1B),
    header: const SpColor._(0xFFFFFFFF),
    body: const SpColor._(0xFFF5F5F5),
    bodyLight: const SpColor._(0xFF9AA4AE),
  );

  final SpColor background;
  final SpColor header;
  final SpColor body;
  final SpColor bodyLight;
}

class SpColor extends Color {
  const SpColor._(super.value);
}
