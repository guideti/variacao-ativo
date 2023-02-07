// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quote _$$_QuoteFromJson(Map<String, dynamic> json) => _$_Quote(
      open: (json['open'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      close: (json['close'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      low: (json['low'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      high: (json['high'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_QuoteToJson(_$_Quote instance) => <String, dynamic>{
      'open': instance.open,
      'close': instance.close,
      'low': instance.low,
      'high': instance.high,
    };
