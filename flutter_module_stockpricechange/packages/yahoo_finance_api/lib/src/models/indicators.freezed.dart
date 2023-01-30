// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'indicators.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Indicators _$IndicatorsFromJson(Map<String, dynamic> json) {
  return _Indicators.fromJson(json);
}

/// @nodoc
mixin _$Indicators {
  Quote get quote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndicatorsCopyWith<Indicators> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndicatorsCopyWith<$Res> {
  factory $IndicatorsCopyWith(
          Indicators value, $Res Function(Indicators) then) =
      _$IndicatorsCopyWithImpl<$Res, Indicators>;
  @useResult
  $Res call({Quote quote});

  $QuoteCopyWith<$Res> get quote;
}

/// @nodoc
class _$IndicatorsCopyWithImpl<$Res, $Val extends Indicators>
    implements $IndicatorsCopyWith<$Res> {
  _$IndicatorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quote = null,
  }) {
    return _then(_value.copyWith(
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Quote,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuoteCopyWith<$Res> get quote {
    return $QuoteCopyWith<$Res>(_value.quote, (value) {
      return _then(_value.copyWith(quote: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_IndicatorsCopyWith<$Res>
    implements $IndicatorsCopyWith<$Res> {
  factory _$$_IndicatorsCopyWith(
          _$_Indicators value, $Res Function(_$_Indicators) then) =
      __$$_IndicatorsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Quote quote});

  @override
  $QuoteCopyWith<$Res> get quote;
}

/// @nodoc
class __$$_IndicatorsCopyWithImpl<$Res>
    extends _$IndicatorsCopyWithImpl<$Res, _$_Indicators>
    implements _$$_IndicatorsCopyWith<$Res> {
  __$$_IndicatorsCopyWithImpl(
      _$_Indicators _value, $Res Function(_$_Indicators) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quote = null,
  }) {
    return _then(_$_Indicators(
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Quote,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Indicators implements _Indicators {
  _$_Indicators({required this.quote});

  factory _$_Indicators.fromJson(Map<String, dynamic> json) =>
      _$$_IndicatorsFromJson(json);

  @override
  final Quote quote;

  @override
  String toString() {
    return 'Indicators(quote: $quote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Indicators &&
            (identical(other.quote, quote) || other.quote == quote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IndicatorsCopyWith<_$_Indicators> get copyWith =>
      __$$_IndicatorsCopyWithImpl<_$_Indicators>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IndicatorsToJson(
      this,
    );
  }
}

abstract class _Indicators implements Indicators {
  factory _Indicators({required final Quote quote}) = _$_Indicators;

  factory _Indicators.fromJson(Map<String, dynamic> json) =
      _$_Indicators.fromJson;

  @override
  Quote get quote;
  @override
  @JsonKey(ignore: true)
  _$$_IndicatorsCopyWith<_$_Indicators> get copyWith =>
      throw _privateConstructorUsedError;
}
