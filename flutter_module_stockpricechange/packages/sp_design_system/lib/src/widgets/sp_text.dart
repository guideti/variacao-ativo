import 'package:flutter/material.dart';
import 'package:sp_design_system/sp_design_system.dart';

class SpText extends StatelessWidget {
  const SpText._(this.text, this.color, this._textStyle);

  SpText.header(String text, {required SpColor color}) : this._(text, color, SpTextStyles.header);
  SpText.bodyRegular14(String text, {required SpColor color}) : this._(text, color, SpTextStyles.bodyRegular14);
  SpText.bodyRegular12(String text, {required SpColor color}) : this._(text, color, SpTextStyles.bodyRegular12);
  SpText.bodyMedium14(String text, {required SpColor color}) : this._(text, color, SpTextStyles.bodyMedium14);

  final String text;
  final SpColor color;
  final TextStyle _textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _textStyle.copyWith(color: color),
    );
  }
}
