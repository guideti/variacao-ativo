// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indicators.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Indicators _$$_IndicatorsFromJson(Map<String, dynamic> json) =>
    _$_Indicators(
      quote: (json['quote'] as List<dynamic>)
          .map((e) => Quote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_IndicatorsToJson(_$_Indicators instance) =>
    <String, dynamic>{
      'quote': instance.quote,
    };
