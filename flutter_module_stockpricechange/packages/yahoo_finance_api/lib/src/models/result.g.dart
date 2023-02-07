// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      timestamp:
          (json['timestamp'] as List<dynamic>).map((e) => e as int).toList(),
      indicators:
          Indicators.fromJson(json['indicators'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'indicators': instance.indicators,
    };
