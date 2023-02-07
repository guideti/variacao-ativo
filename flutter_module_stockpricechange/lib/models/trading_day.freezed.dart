// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trading_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TradingDay {
  DateTime get day => throw _privateConstructorUsedError;
  double get openPrice => throw _privateConstructorUsedError;
  double get closePrice => throw _privateConstructorUsedError;
  double get lowPrice => throw _privateConstructorUsedError;
  double get highPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TradingDayCopyWith<TradingDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradingDayCopyWith<$Res> {
  factory $TradingDayCopyWith(
          TradingDay value, $Res Function(TradingDay) then) =
      _$TradingDayCopyWithImpl<$Res, TradingDay>;
  @useResult
  $Res call(
      {DateTime day,
      double openPrice,
      double closePrice,
      double lowPrice,
      double highPrice});
}

/// @nodoc
class _$TradingDayCopyWithImpl<$Res, $Val extends TradingDay>
    implements $TradingDayCopyWith<$Res> {
  _$TradingDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? openPrice = null,
    Object? closePrice = null,
    Object? lowPrice = null,
    Object? highPrice = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      openPrice: null == openPrice
          ? _value.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      closePrice: null == closePrice
          ? _value.closePrice
          : closePrice // ignore: cast_nullable_to_non_nullable
              as double,
      lowPrice: null == lowPrice
          ? _value.lowPrice
          : lowPrice // ignore: cast_nullable_to_non_nullable
              as double,
      highPrice: null == highPrice
          ? _value.highPrice
          : highPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TradingDayCopyWith<$Res>
    implements $TradingDayCopyWith<$Res> {
  factory _$$_TradingDayCopyWith(
          _$_TradingDay value, $Res Function(_$_TradingDay) then) =
      __$$_TradingDayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime day,
      double openPrice,
      double closePrice,
      double lowPrice,
      double highPrice});
}

/// @nodoc
class __$$_TradingDayCopyWithImpl<$Res>
    extends _$TradingDayCopyWithImpl<$Res, _$_TradingDay>
    implements _$$_TradingDayCopyWith<$Res> {
  __$$_TradingDayCopyWithImpl(
      _$_TradingDay _value, $Res Function(_$_TradingDay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? openPrice = null,
    Object? closePrice = null,
    Object? lowPrice = null,
    Object? highPrice = null,
  }) {
    return _then(_$_TradingDay(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      openPrice: null == openPrice
          ? _value.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      closePrice: null == closePrice
          ? _value.closePrice
          : closePrice // ignore: cast_nullable_to_non_nullable
              as double,
      lowPrice: null == lowPrice
          ? _value.lowPrice
          : lowPrice // ignore: cast_nullable_to_non_nullable
              as double,
      highPrice: null == highPrice
          ? _value.highPrice
          : highPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_TradingDay implements _TradingDay {
  _$_TradingDay(
      {required this.day,
      required this.openPrice,
      required this.closePrice,
      required this.lowPrice,
      required this.highPrice});

  @override
  final DateTime day;
  @override
  final double openPrice;
  @override
  final double closePrice;
  @override
  final double lowPrice;
  @override
  final double highPrice;

  @override
  String toString() {
    return 'TradingDay(day: $day, openPrice: $openPrice, closePrice: $closePrice, lowPrice: $lowPrice, highPrice: $highPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TradingDay &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.closePrice, closePrice) ||
                other.closePrice == closePrice) &&
            (identical(other.lowPrice, lowPrice) ||
                other.lowPrice == lowPrice) &&
            (identical(other.highPrice, highPrice) ||
                other.highPrice == highPrice));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, day, openPrice, closePrice, lowPrice, highPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TradingDayCopyWith<_$_TradingDay> get copyWith =>
      __$$_TradingDayCopyWithImpl<_$_TradingDay>(this, _$identity);
}

abstract class _TradingDay implements TradingDay {
  factory _TradingDay(
      {required final DateTime day,
      required final double openPrice,
      required final double closePrice,
      required final double lowPrice,
      required final double highPrice}) = _$_TradingDay;

  @override
  DateTime get day;
  @override
  double get openPrice;
  @override
  double get closePrice;
  @override
  double get lowPrice;
  @override
  double get highPrice;
  @override
  @JsonKey(ignore: true)
  _$$_TradingDayCopyWith<_$_TradingDay> get copyWith =>
      throw _privateConstructorUsedError;
}
