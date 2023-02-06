// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return _Quote.fromJson(json);
}

/// @nodoc
mixin _$Quote {
  List<double> get open => throw _privateConstructorUsedError;
  List<double> get close => throw _privateConstructorUsedError;
  List<double> get low => throw _privateConstructorUsedError;
  List<double> get high => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteCopyWith<Quote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteCopyWith<$Res> {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) then) =
      _$QuoteCopyWithImpl<$Res, Quote>;
  @useResult
  $Res call(
      {List<double> open,
      List<double> close,
      List<double> low,
      List<double> high});
}

/// @nodoc
class _$QuoteCopyWithImpl<$Res, $Val extends Quote>
    implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = null,
    Object? close = null,
    Object? low = null,
    Object? high = null,
  }) {
    return _then(_value.copyWith(
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as List<double>,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as List<double>,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as List<double>,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuoteCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$$_QuoteCopyWith(_$_Quote value, $Res Function(_$_Quote) then) =
      __$$_QuoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<double> open,
      List<double> close,
      List<double> low,
      List<double> high});
}

/// @nodoc
class __$$_QuoteCopyWithImpl<$Res> extends _$QuoteCopyWithImpl<$Res, _$_Quote>
    implements _$$_QuoteCopyWith<$Res> {
  __$$_QuoteCopyWithImpl(_$_Quote _value, $Res Function(_$_Quote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = null,
    Object? close = null,
    Object? low = null,
    Object? high = null,
  }) {
    return _then(_$_Quote(
      open: null == open
          ? _value._open
          : open // ignore: cast_nullable_to_non_nullable
              as List<double>,
      close: null == close
          ? _value._close
          : close // ignore: cast_nullable_to_non_nullable
              as List<double>,
      low: null == low
          ? _value._low
          : low // ignore: cast_nullable_to_non_nullable
              as List<double>,
      high: null == high
          ? _value._high
          : high // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quote implements _Quote {
  const _$_Quote(
      {required final List<double> open,
      required final List<double> close,
      required final List<double> low,
      required final List<double> high})
      : _open = open,
        _close = close,
        _low = low,
        _high = high;

  factory _$_Quote.fromJson(Map<String, dynamic> json) =>
      _$$_QuoteFromJson(json);

  final List<double> _open;
  @override
  List<double> get open {
    if (_open is EqualUnmodifiableListView) return _open;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_open);
  }

  final List<double> _close;
  @override
  List<double> get close {
    if (_close is EqualUnmodifiableListView) return _close;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_close);
  }

  final List<double> _low;
  @override
  List<double> get low {
    if (_low is EqualUnmodifiableListView) return _low;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_low);
  }

  final List<double> _high;
  @override
  List<double> get high {
    if (_high is EqualUnmodifiableListView) return _high;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_high);
  }

  @override
  String toString() {
    return 'Quote(open: $open, close: $close, low: $low, high: $high)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quote &&
            const DeepCollectionEquality().equals(other._open, _open) &&
            const DeepCollectionEquality().equals(other._close, _close) &&
            const DeepCollectionEquality().equals(other._low, _low) &&
            const DeepCollectionEquality().equals(other._high, _high));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_open),
      const DeepCollectionEquality().hash(_close),
      const DeepCollectionEquality().hash(_low),
      const DeepCollectionEquality().hash(_high));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuoteCopyWith<_$_Quote> get copyWith =>
      __$$_QuoteCopyWithImpl<_$_Quote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuoteToJson(
      this,
    );
  }
}

abstract class _Quote implements Quote {
  const factory _Quote(
      {required final List<double> open,
      required final List<double> close,
      required final List<double> low,
      required final List<double> high}) = _$_Quote;

  factory _Quote.fromJson(Map<String, dynamic> json) = _$_Quote.fromJson;

  @override
  List<double> get open;
  @override
  List<double> get close;
  @override
  List<double> get low;
  @override
  List<double> get high;
  @override
  @JsonKey(ignore: true)
  _$$_QuoteCopyWith<_$_Quote> get copyWith =>
      throw _privateConstructorUsedError;
}
