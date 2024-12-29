// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'juz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Juz _$JuzFromJson(Map<String, dynamic> json) {
  return _Juz.fromJson(json);
}

/// @nodoc
mixin _$Juz {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_verse_id')
  int get firstVerseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_verse_id')
  int get lastVerseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'verses_count')
  int get versesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'verse_mapping')
  Map<String, String> get versesMapping => throw _privateConstructorUsedError;

  /// Serializes this Juz to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JuzCopyWith<Juz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JuzCopyWith<$Res> {
  factory $JuzCopyWith(Juz value, $Res Function(Juz) then) =
      _$JuzCopyWithImpl<$Res, Juz>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'first_verse_id') int firstVerseId,
      @JsonKey(name: 'last_verse_id') int lastVerseId,
      @JsonKey(name: 'verses_count') int versesCount,
      @JsonKey(name: 'verse_mapping') Map<String, String> versesMapping});
}

/// @nodoc
class _$JuzCopyWithImpl<$Res, $Val extends Juz> implements $JuzCopyWith<$Res> {
  _$JuzCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstVerseId = null,
    Object? lastVerseId = null,
    Object? versesCount = null,
    Object? versesMapping = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstVerseId: null == firstVerseId
          ? _value.firstVerseId
          : firstVerseId // ignore: cast_nullable_to_non_nullable
              as int,
      lastVerseId: null == lastVerseId
          ? _value.lastVerseId
          : lastVerseId // ignore: cast_nullable_to_non_nullable
              as int,
      versesCount: null == versesCount
          ? _value.versesCount
          : versesCount // ignore: cast_nullable_to_non_nullable
              as int,
      versesMapping: null == versesMapping
          ? _value.versesMapping
          : versesMapping // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JuzImplCopyWith<$Res> implements $JuzCopyWith<$Res> {
  factory _$$JuzImplCopyWith(_$JuzImpl value, $Res Function(_$JuzImpl) then) =
      __$$JuzImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'first_verse_id') int firstVerseId,
      @JsonKey(name: 'last_verse_id') int lastVerseId,
      @JsonKey(name: 'verses_count') int versesCount,
      @JsonKey(name: 'verse_mapping') Map<String, String> versesMapping});
}

/// @nodoc
class __$$JuzImplCopyWithImpl<$Res> extends _$JuzCopyWithImpl<$Res, _$JuzImpl>
    implements _$$JuzImplCopyWith<$Res> {
  __$$JuzImplCopyWithImpl(_$JuzImpl _value, $Res Function(_$JuzImpl) _then)
      : super(_value, _then);

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstVerseId = null,
    Object? lastVerseId = null,
    Object? versesCount = null,
    Object? versesMapping = null,
  }) {
    return _then(_$JuzImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstVerseId: null == firstVerseId
          ? _value.firstVerseId
          : firstVerseId // ignore: cast_nullable_to_non_nullable
              as int,
      lastVerseId: null == lastVerseId
          ? _value.lastVerseId
          : lastVerseId // ignore: cast_nullable_to_non_nullable
              as int,
      versesCount: null == versesCount
          ? _value.versesCount
          : versesCount // ignore: cast_nullable_to_non_nullable
              as int,
      versesMapping: null == versesMapping
          ? _value._versesMapping
          : versesMapping // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JuzImpl implements _Juz {
  _$JuzImpl(
      {this.id = 0,
      @JsonKey(name: 'first_verse_id') this.firstVerseId = 0,
      @JsonKey(name: 'last_verse_id') this.lastVerseId = 0,
      @JsonKey(name: 'verses_count') this.versesCount = 0,
      @JsonKey(name: 'verse_mapping')
      final Map<String, String> versesMapping = const {}})
      : _versesMapping = versesMapping;

  factory _$JuzImpl.fromJson(Map<String, dynamic> json) =>
      _$$JuzImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'first_verse_id')
  final int firstVerseId;
  @override
  @JsonKey(name: 'last_verse_id')
  final int lastVerseId;
  @override
  @JsonKey(name: 'verses_count')
  final int versesCount;
  final Map<String, String> _versesMapping;
  @override
  @JsonKey(name: 'verse_mapping')
  Map<String, String> get versesMapping {
    if (_versesMapping is EqualUnmodifiableMapView) return _versesMapping;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_versesMapping);
  }

  @override
  String toString() {
    return 'Juz(id: $id, firstVerseId: $firstVerseId, lastVerseId: $lastVerseId, versesCount: $versesCount, versesMapping: $versesMapping)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JuzImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstVerseId, firstVerseId) ||
                other.firstVerseId == firstVerseId) &&
            (identical(other.lastVerseId, lastVerseId) ||
                other.lastVerseId == lastVerseId) &&
            (identical(other.versesCount, versesCount) ||
                other.versesCount == versesCount) &&
            const DeepCollectionEquality()
                .equals(other._versesMapping, _versesMapping));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstVerseId, lastVerseId,
      versesCount, const DeepCollectionEquality().hash(_versesMapping));

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JuzImplCopyWith<_$JuzImpl> get copyWith =>
      __$$JuzImplCopyWithImpl<_$JuzImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JuzImplToJson(
      this,
    );
  }
}

abstract class _Juz implements Juz {
  factory _Juz(
      {final int id,
      @JsonKey(name: 'first_verse_id') final int firstVerseId,
      @JsonKey(name: 'last_verse_id') final int lastVerseId,
      @JsonKey(name: 'verses_count') final int versesCount,
      @JsonKey(name: 'verse_mapping')
      final Map<String, String> versesMapping}) = _$JuzImpl;

  factory _Juz.fromJson(Map<String, dynamic> json) = _$JuzImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'first_verse_id')
  int get firstVerseId;
  @override
  @JsonKey(name: 'last_verse_id')
  int get lastVerseId;
  @override
  @JsonKey(name: 'verses_count')
  int get versesCount;
  @override
  @JsonKey(name: 'verse_mapping')
  Map<String, String> get versesMapping;

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JuzImplCopyWith<_$JuzImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
