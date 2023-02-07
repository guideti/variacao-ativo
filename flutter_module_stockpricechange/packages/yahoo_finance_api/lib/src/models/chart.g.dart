// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chart _$$_ChartFromJson(Map<String, dynamic> json) => _$_Chart(
      result: (json['result'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChartToJson(_$_Chart instance) => <String, dynamic>{
      'result': instance.result,
    };
