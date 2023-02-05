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
  double? get previousDayChange => throw _privateConstructorUsedError;
  double? get thirtyDaysChange => throw _privateConstructorUsedError;

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
      double? previousDayChange,
      double? thirtyDaysChange});
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
    Object? previousDayChange = freezed,
    Object? thirtyDaysChange = freezed,
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
      previousDayChange: freezed == previousDayChange
          ? _value.previousDayChange
          : previousDayChange // ignore: cast_nullable_to_non_nullable
              as double?,
      thirtyDaysChange: freezed == thirtyDaysChange
          ? _value.thirtyDaysChange
          : thirtyDaysChange // ignore: cast_nullable_to_non_nullable
              as double?,
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
      double? previousDayChange,
      double? thirtyDaysChange});
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
    Object? previousDayChange = freezed,
    Object? thirtyDaysChange = freezed,
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
      previousDayChange: freezed == previousDayChange
          ? _value.previousDayChange
          : previousDayChange // ignore: cast_nullable_to_non_nullable
              as double?,
      thirtyDaysChange: freezed == thirtyDaysChange
          ? _value.thirtyDaysChange
          : thirtyDaysChange // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_TradingDay implements _TradingDay {
  const _$_TradingDay(
      {required this.day,
      required this.openPrice,
      this.previousDayChange,
      this.thirtyDaysChange});

  @override
  final DateTime day;
  @override
  final double openPrice;
  @override
  final double? previousDayChange;
  @override
  final double? thirtyDaysChange;

  @override
  String toString() {
    return 'TradingDay(day: $day, openPrice: $openPrice, previousDayChange: $previousDayChange, thirtyDaysChange: $thirtyDaysChange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TradingDay &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.previousDayChange, previousDayChange) ||
                other.previousDayChange == previousDayChange) &&
            (identical(other.thirtyDaysChange, thirtyDaysChange) ||
                other.thirtyDaysChange == thirtyDaysChange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, day, openPrice, previousDayChange, thirtyDaysChange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TradingDayCopyWith<_$_TradingDay> get copyWith =>
      __$$_TradingDayCopyWithImpl<_$_TradingDay>(this, _$identity);
}

abstract class _TradingDay implements TradingDay {
  const factory _TradingDay(
      {required final DateTime day,
      required final double openPrice,
      final double? previousDayChange,
      final double? thirtyDaysChange}) = _$_TradingDay;

  @override
  DateTime get day;
  @override
  double get openPrice;
  @override
  double? get previousDayChange;
  @override
  double? get thirtyDaysChange;
  @override
  @JsonKey(ignore: true)
  _$$_TradingDayCopyWith<_$_TradingDay> get copyWith =>
      throw _privateConstructorUsedError;
}
