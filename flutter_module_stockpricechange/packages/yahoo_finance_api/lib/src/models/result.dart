import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yahoo_finance_api/src/models/indicators.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  factory Result({
    required List<int> timestamp,
    required Indicators indicators,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
