// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  List<TradingDayWithStats> get tradingDays =>
      throw _privateConstructorUsedError;
  DataStatus get dataStatus => throw _privateConstructorUsedError;
  VisualisationType get visualisationType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {List<TradingDayWithStats> tradingDays,
      DataStatus dataStatus,
      VisualisationType visualisationType});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradingDays = null,
    Object? dataStatus = null,
    Object? visualisationType = null,
  }) {
    return _then(_value.copyWith(
      tradingDays: null == tradingDays
          ? _value.tradingDays
          : tradingDays // ignore: cast_nullable_to_non_nullable
              as List<TradingDayWithStats>,
      dataStatus: null == dataStatus
          ? _value.dataStatus
          : dataStatus // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      visualisationType: null == visualisationType
          ? _value.visualisationType
          : visualisationType // ignore: cast_nullable_to_non_nullable
              as VisualisationType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TradingDayWithStats> tradingDays,
      DataStatus dataStatus,
      VisualisationType visualisationType});
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradingDays = null,
    Object? dataStatus = null,
    Object? visualisationType = null,
  }) {
    return _then(_$_AppState(
      tradingDays: null == tradingDays
          ? _value._tradingDays
          : tradingDays // ignore: cast_nullable_to_non_nullable
              as List<TradingDayWithStats>,
      dataStatus: null == dataStatus
          ? _value.dataStatus
          : dataStatus // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      visualisationType: null == visualisationType
          ? _value.visualisationType
          : visualisationType // ignore: cast_nullable_to_non_nullable
              as VisualisationType,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  _$_AppState(
      {required final List<TradingDayWithStats> tradingDays,
      required this.dataStatus,
      required this.visualisationType})
      : _tradingDays = tradingDays;

  final List<TradingDayWithStats> _tradingDays;
  @override
  List<TradingDayWithStats> get tradingDays {
    if (_tradingDays is EqualUnmodifiableListView) return _tradingDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tradingDays);
  }

  @override
  final DataStatus dataStatus;
  @override
  final VisualisationType visualisationType;

  @override
  String toString() {
    return 'AppState(tradingDays: $tradingDays, dataStatus: $dataStatus, visualisationType: $visualisationType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            const DeepCollectionEquality()
                .equals(other._tradingDays, _tradingDays) &&
            (identical(other.dataStatus, dataStatus) ||
                other.dataStatus == dataStatus) &&
            (identical(other.visualisationType, visualisationType) ||
                other.visualisationType == visualisationType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tradingDays),
      dataStatus,
      visualisationType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  factory _AppState(
      {required final List<TradingDayWithStats> tradingDays,
      required final DataStatus dataStatus,
      required final VisualisationType visualisationType}) = _$_AppState;

  @override
  List<TradingDayWithStats> get tradingDays;
  @override
  DataStatus get dataStatus;
  @override
  VisualisationType get visualisationType;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
