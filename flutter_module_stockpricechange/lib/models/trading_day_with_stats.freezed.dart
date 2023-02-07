// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trading_day_with_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TradingDayWithStats {
  TradingDay get tradingDay => throw _privateConstructorUsedError;
  double? get previousDayChange => throw _privateConstructorUsedError;
  double? get thirtyDaysChange => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TradingDayWithStatsCopyWith<TradingDayWithStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradingDayWithStatsCopyWith<$Res> {
  factory $TradingDayWithStatsCopyWith(
          TradingDayWithStats value, $Res Function(TradingDayWithStats) then) =
      _$TradingDayWithStatsCopyWithImpl<$Res, TradingDayWithStats>;
  @useResult
  $Res call(
      {TradingDay tradingDay,
      double? previousDayChange,
      double? thirtyDaysChange});

  $TradingDayCopyWith<$Res> get tradingDay;
}

/// @nodoc
class _$TradingDayWithStatsCopyWithImpl<$Res, $Val extends TradingDayWithStats>
    implements $TradingDayWithStatsCopyWith<$Res> {
  _$TradingDayWithStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradingDay = null,
    Object? previousDayChange = freezed,
    Object? thirtyDaysChange = freezed,
  }) {
    return _then(_value.copyWith(
      tradingDay: null == tradingDay
          ? _value.tradingDay
          : tradingDay // ignore: cast_nullable_to_non_nullable
              as TradingDay,
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

  @override
  @pragma('vm:prefer-inline')
  $TradingDayCopyWith<$Res> get tradingDay {
    return $TradingDayCopyWith<$Res>(_value.tradingDay, (value) {
      return _then(_value.copyWith(tradingDay: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TradingDayWithStatsCopyWith<$Res>
    implements $TradingDayWithStatsCopyWith<$Res> {
  factory _$$_TradingDayWithStatsCopyWith(_$_TradingDayWithStats value,
          $Res Function(_$_TradingDayWithStats) then) =
      __$$_TradingDayWithStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TradingDay tradingDay,
      double? previousDayChange,
      double? thirtyDaysChange});

  @override
  $TradingDayCopyWith<$Res> get tradingDay;
}

/// @nodoc
class __$$_TradingDayWithStatsCopyWithImpl<$Res>
    extends _$TradingDayWithStatsCopyWithImpl<$Res, _$_TradingDayWithStats>
    implements _$$_TradingDayWithStatsCopyWith<$Res> {
  __$$_TradingDayWithStatsCopyWithImpl(_$_TradingDayWithStats _value,
      $Res Function(_$_TradingDayWithStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradingDay = null,
    Object? previousDayChange = freezed,
    Object? thirtyDaysChange = freezed,
  }) {
    return _then(_$_TradingDayWithStats(
      tradingDay: null == tradingDay
          ? _value.tradingDay
          : tradingDay // ignore: cast_nullable_to_non_nullable
              as TradingDay,
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

class _$_TradingDayWithStats extends _TradingDayWithStats {
  const _$_TradingDayWithStats(
      {required this.tradingDay, this.previousDayChange, this.thirtyDaysChange})
      : super._();

  @override
  final TradingDay tradingDay;
  @override
  final double? previousDayChange;
  @override
  final double? thirtyDaysChange;

  @override
  String toString() {
    return 'TradingDayWithStats(tradingDay: $tradingDay, previousDayChange: $previousDayChange, thirtyDaysChange: $thirtyDaysChange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TradingDayWithStats &&
            (identical(other.tradingDay, tradingDay) ||
                other.tradingDay == tradingDay) &&
            (identical(other.previousDayChange, previousDayChange) ||
                other.previousDayChange == previousDayChange) &&
            (identical(other.thirtyDaysChange, thirtyDaysChange) ||
                other.thirtyDaysChange == thirtyDaysChange));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tradingDay, previousDayChange, thirtyDaysChange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TradingDayWithStatsCopyWith<_$_TradingDayWithStats> get copyWith =>
      __$$_TradingDayWithStatsCopyWithImpl<_$_TradingDayWithStats>(
          this, _$identity);
}

abstract class _TradingDayWithStats extends TradingDayWithStats {
  const factory _TradingDayWithStats(
      {required final TradingDay tradingDay,
      final double? previousDayChange,
      final double? thirtyDaysChange}) = _$_TradingDayWithStats;
  const _TradingDayWithStats._() : super._();

  @override
  TradingDay get tradingDay;
  @override
  double? get previousDayChange;
  @override
  double? get thirtyDaysChange;
  @override
  @JsonKey(ignore: true)
  _$$_TradingDayWithStatsCopyWith<_$_TradingDayWithStats> get copyWith =>
      throw _privateConstructorUsedError;
}
