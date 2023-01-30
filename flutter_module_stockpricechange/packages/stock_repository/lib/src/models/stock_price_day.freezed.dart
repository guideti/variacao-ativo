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
  DateTime get date => throw _privateConstructorUsedError;
  double get open => throw _privateConstructorUsedError;

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
  $Res call({DateTime date, double open});
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
    Object? date = null,
    Object? open = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
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
  $Res call({DateTime date, double open});
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
    Object? date = null,
    Object? open = null,
  }) {
    return _then(_$_StockPriceDay(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_StockPriceDay implements _StockPriceDay {
  _$_StockPriceDay({required this.date, required this.open});

  @override
  final DateTime date;
  @override
  final double open;

  @override
  String toString() {
    return 'StockPriceDay(date: $date, open: $open)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockPriceDay &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.open, open) || other.open == open));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, open);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StockPriceDayCopyWith<_$_StockPriceDay> get copyWith =>
      __$$_StockPriceDayCopyWithImpl<_$_StockPriceDay>(this, _$identity);
}

abstract class _StockPriceDay implements StockPriceDay {
  factory _StockPriceDay(
      {required final DateTime date,
      required final double open}) = _$_StockPriceDay;

  @override
  DateTime get date;
  @override
  double get open;
  @override
  @JsonKey(ignore: true)
  _$$_StockPriceDayCopyWith<_$_StockPriceDay> get copyWith =>
      throw _privateConstructorUsedError;
}
