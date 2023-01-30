import 'package:freezed_annotation/freezed_annotation.dart';

import 'quote.dart';

part 'indicators.freezed.dart';
part 'indicators.g.dart';

@freezed
class Indicators with _$Indicators {
  factory Indicators({
    required Quote quote,
  }) = _Indicators;

  factory Indicators.fromJson(Map<String, dynamic> json) => _$IndicatorsFromJson(json);
}
