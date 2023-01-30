// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'historical_data_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoricalDataItem {
  int get timestamp => throw _privateConstructorUsedError;
  double get openPrice => throw _privateConstructorUsedError;
  double? get dayOneChange => throw _privateConstructorUsedError;
  double? get previousDayChange => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoricalDataItemCopyWith<HistoricalDataItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoricalDataItemCopyWith<$Res> {
  factory $HistoricalDataItemCopyWith(
          HistoricalDataItem value, $Res Function(HistoricalDataItem) then) =
      _$HistoricalDataItemCopyWithImpl<$Res, HistoricalDataItem>;
  @useResult
  $Res call(
      {int timestamp,
      double openPrice,
      double? dayOneChange,
      double? previousDayChange});
}

/// @nodoc
class _$HistoricalDataItemCopyWithImpl<$Res, $Val extends HistoricalDataItem>
    implements $HistoricalDataItemCopyWith<$Res> {
  _$HistoricalDataItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? openPrice = null,
    Object? dayOneChange = freezed,
    Object? previousDayChange = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      openPrice: null == openPrice
          ? _value.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      dayOneChange: freezed == dayOneChange
          ? _value.dayOneChange
          : dayOneChange // ignore: cast_nullable_to_non_nullable
              as double?,
      previousDayChange: freezed == previousDayChange
          ? _value.previousDayChange
          : previousDayChange // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoricalDataItemCopyWith<$Res>
    implements $HistoricalDataItemCopyWith<$Res> {
  factory _$$_HistoricalDataItemCopyWith(_$_HistoricalDataItem value,
          $Res Function(_$_HistoricalDataItem) then) =
      __$$_HistoricalDataItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int timestamp,
      double openPrice,
      double? dayOneChange,
      double? previousDayChange});
}

/// @nodoc
class __$$_HistoricalDataItemCopyWithImpl<$Res>
    extends _$HistoricalDataItemCopyWithImpl<$Res, _$_HistoricalDataItem>
    implements _$$_HistoricalDataItemCopyWith<$Res> {
  __$$_HistoricalDataItemCopyWithImpl(
      _$_HistoricalDataItem _value, $Res Function(_$_HistoricalDataItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? openPrice = null,
    Object? dayOneChange = freezed,
    Object? previousDayChange = freezed,
  }) {
    return _then(_$_HistoricalDataItem(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      openPrice: null == openPrice
          ? _value.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      dayOneChange: freezed == dayOneChange
          ? _value.dayOneChange
          : dayOneChange // ignore: cast_nullable_to_non_nullable
              as double?,
      previousDayChange: freezed == previousDayChange
          ? _value.previousDayChange
          : previousDayChange // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_HistoricalDataItem implements _HistoricalDataItem {
  _$_HistoricalDataItem(
      {required this.timestamp,
      required this.openPrice,
      this.dayOneChange,
      this.previousDayChange});

  @override
  final int timestamp;
  @override
  final double openPrice;
  @override
  final double? dayOneChange;
  @override
  final double? previousDayChange;

  @override
  String toString() {
    return 'HistoricalDataItem(timestamp: $timestamp, openPrice: $openPrice, dayOneChange: $dayOneChange, previousDayChange: $previousDayChange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoricalDataItem &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.dayOneChange, dayOneChange) ||
                other.dayOneChange == dayOneChange) &&
            (identical(other.previousDayChange, previousDayChange) ||
                other.previousDayChange == previousDayChange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, timestamp, openPrice, dayOneChange, previousDayChange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoricalDataItemCopyWith<_$_HistoricalDataItem> get copyWith =>
      __$$_HistoricalDataItemCopyWithImpl<_$_HistoricalDataItem>(
          this, _$identity);
}

abstract class _HistoricalDataItem implements HistoricalDataItem {
  factory _HistoricalDataItem(
      {required final int timestamp,
      required final double openPrice,
      final double? dayOneChange,
      final double? previousDayChange}) = _$_HistoricalDataItem;

  @override
  int get timestamp;
  @override
  double get openPrice;
  @override
  double? get dayOneChange;
  @override
  double? get previousDayChange;
  @override
  @JsonKey(ignore: true)
  _$$_HistoricalDataItemCopyWith<_$_HistoricalDataItem> get copyWith =>
      throw _privateConstructorUsedError;
}
