import 'package:flutter/material.dart';

class SpColors {
  SpColors._({required this.background});

  static SpColors light = SpColors._(
    background: SpColor._(0xFFFFFFFF),
  );

  static SpColors dark = SpColors._(
    background: SpColor._(0xFF1B1B1B),
  );

  final SpColor background;
}

class SpColor extends Color {
  SpColor._(super.value);
}
