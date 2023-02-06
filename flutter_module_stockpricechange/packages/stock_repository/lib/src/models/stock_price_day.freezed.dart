// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_price_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StockPriceDay {
  int get timestamp => throw _privateConstructorUsedError;
  double get open => throw _privateConstructorUsedError;
  double get close => throw _privateConstructorUsedError;
  double get low => throw _privateConstructorUsedError;
  double get high => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockPriceDayCopyWith<StockPriceDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockPriceDayCopyWith<$Res> {
  factory $StockPriceDayCopyWith(
          StockPriceDay value, $Res Function(StockPriceDay) then) =
      _$StockPriceDayCopyWithImpl<$Res, StockPriceDay>;
  @useResult
  $Res call(
      {int timestamp, double open, double close, double low, double high});
}

/// @nodoc
class _$StockPriceDayCopyWithImpl<$Res, $Val extends StockPriceDay>
    implements $StockPriceDayCopyWith<$Res> {
  _$StockPriceDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? open = null,
    Object? close = null,
    Object? low = null,
    Object? high = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StockPriceDayCopyWith<$Res>
    implements $StockPriceDayCopyWith<$Res> {
  factory _$$_StockPriceDayCopyWith(
          _$_StockPriceDay value, $Res Function(_$_StockPriceDay) then) =
      __$$_StockPriceDayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int timestamp, double open, double close, double low, double high});
}

/// @nodoc
class __$$_StockPriceDayCopyWithImpl<$Res>
    extends _$StockPriceDayCopyWithImpl<$Res, _$_StockPriceDay>
    implements _$$_StockPriceDayCopyWith<$Res> {
  __$$_StockPriceDayCopyWithImpl(
      _$_StockPriceDay _value, $Res Function(_$_StockPriceDay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? open = null,
    Object? close = null,
    Object? low = null,
    Object? high = null,
  }) {
    return _then(_$_StockPriceDay(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_StockPriceDay implements _StockPriceDay {
  _$_StockPriceDay(
      {required this.timestamp,
      required this.open,
      required this.close,
      required this.low,
      required this.high});

  @override
  final int timestamp;
  @override
  final double open;
  @override
  final double close;
  @override
  final double low;
  @override
  final double high;

  @override
  String toString() {
    return 'StockPriceDay(timestamp: $timestamp, open: $open, close: $close, low: $low, high: $high)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockPriceDay &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.high, high) || other.high == high));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, timestamp, open, close, low, high);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StockPriceDayCopyWith<_$_StockPriceDay> get copyWith =>
      __$$_StockPriceDayCopyWithImpl<_$_StockPriceDay>(this, _$identity);
}

abstract class _StockPriceDay implements StockPriceDay {
  factory _StockPriceDay(
      {required final int timestamp,
      required final double open,
      required final double close,
      required final double low,
      required final double high}) = _$_StockPriceDay;

  @override
  int get timestamp;
  @override
  double get open;
  @override
  double get close;
  @override
  double get low;
  @override
  double get high;
  @override
  @JsonKey(ignore: true)
  _$$_StockPriceDayCopyWith<_$_StockPriceDay> get copyWith =>
      throw _privateConstructorUsedError;
}
