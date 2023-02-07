// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Chart _$ChartFromJson(Map<String, dynamic> json) {
  return _Chart.fromJson(json);
}

/// @nodoc
mixin _$Chart {
  List<Result> get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartCopyWith<Chart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartCopyWith<$Res> {
  factory $ChartCopyWith(Chart value, $Res Function(Chart) then) =
      _$ChartCopyWithImpl<$Res, Chart>;
  @useResult
  $Res call({List<Result> result});
}

/// @nodoc
class _$ChartCopyWithImpl<$Res, $Val extends Chart>
    implements $ChartCopyWith<$Res> {
  _$ChartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Result>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChartCopyWith<$Res> implements $ChartCopyWith<$Res> {
  factory _$$_ChartCopyWith(_$_Chart value, $Res Function(_$_Chart) then) =
      __$$_ChartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Result> result});
}

/// @nodoc
class __$$_ChartCopyWithImpl<$Res> extends _$ChartCopyWithImpl<$Res, _$_Chart>
    implements _$$_ChartCopyWith<$Res> {
  __$$_ChartCopyWithImpl(_$_Chart _value, $Res Function(_$_Chart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_Chart(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Result>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chart implements _Chart {
  _$_Chart({required final List<Result> result}) : _result = result;

  factory _$_Chart.fromJson(Map<String, dynamic> json) =>
      _$$_ChartFromJson(json);

  final List<Result> _result;
  @override
  List<Result> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'Chart(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chart &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChartCopyWith<_$_Chart> get copyWith =>
      __$$_ChartCopyWithImpl<_$_Chart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChartToJson(
      this,
    );
  }
}

abstract class _Chart implements Chart {
  factory _Chart({required final List<Result> result}) = _$_Chart;

  factory _Chart.fromJson(Map<String, dynamic> json) = _$_Chart.fromJson;

  @override
  List<Result> get result;
  @override
  @JsonKey(ignore: true)
  _$$_ChartCopyWith<_$_Chart> get copyWith =>
      throw _privateConstructorUsedError;
}
