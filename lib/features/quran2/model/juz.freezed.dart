// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'juz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Juz {
  int get id;
  @JsonKey(name: 'first_verse_id')
  int get firstVerseId;
  @JsonKey(name: 'last_verse_id')
  int get lastVerseId;
  @JsonKey(name: 'verses_count')
  int get versesCount;
  @JsonKey(name: 'verse_mapping')
  Map<String, String> get versesMapping;

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JuzCopyWith<Juz> get copyWith =>
      _$JuzCopyWithImpl<Juz>(this as Juz, _$identity);

  /// Serializes this Juz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Juz &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstVerseId, firstVerseId) ||
                other.firstVerseId == firstVerseId) &&
            (identical(other.lastVerseId, lastVerseId) ||
                other.lastVerseId == lastVerseId) &&
            (identical(other.versesCount, versesCount) ||
                other.versesCount == versesCount) &&
            const DeepCollectionEquality()
                .equals(other.versesMapping, versesMapping));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstVerseId, lastVerseId,
      versesCount, const DeepCollectionEquality().hash(versesMapping));

  @override
  String toString() {
    return 'Juz(id: $id, firstVerseId: $firstVerseId, lastVerseId: $lastVerseId, versesCount: $versesCount, versesMapping: $versesMapping)';
  }
}

/// @nodoc
abstract mixin class $JuzCopyWith<$Res> {
  factory $JuzCopyWith(Juz value, $Res Function(Juz) _then) = _$JuzCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'first_verse_id') int firstVerseId,
      @JsonKey(name: 'last_verse_id') int lastVerseId,
      @JsonKey(name: 'verses_count') int versesCount,
      @JsonKey(name: 'verse_mapping') Map<String, String> versesMapping});
}

/// @nodoc
class _$JuzCopyWithImpl<$Res> implements $JuzCopyWith<$Res> {
  _$JuzCopyWithImpl(this._self, this._then);

  final Juz _self;
  final $Res Function(Juz) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstVerseId: null == firstVerseId
          ? _self.firstVerseId
          : firstVerseId // ignore: cast_nullable_to_non_nullable
              as int,
      lastVerseId: null == lastVerseId
          ? _self.lastVerseId
          : lastVerseId // ignore: cast_nullable_to_non_nullable
              as int,
      versesCount: null == versesCount
          ? _self.versesCount
          : versesCount // ignore: cast_nullable_to_non_nullable
              as int,
      versesMapping: null == versesMapping
          ? _self.versesMapping
          : versesMapping // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Juz implements Juz {
  _Juz(
      {this.id = 0,
      @JsonKey(name: 'first_verse_id') this.firstVerseId = 0,
      @JsonKey(name: 'last_verse_id') this.lastVerseId = 0,
      @JsonKey(name: 'verses_count') this.versesCount = 0,
      @JsonKey(name: 'verse_mapping')
      final Map<String, String> versesMapping = const {}})
      : _versesMapping = versesMapping;
  factory _Juz.fromJson(Map<String, dynamic> json) => _$JuzFromJson(json);

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

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$JuzCopyWith<_Juz> get copyWith =>
      __$JuzCopyWithImpl<_Juz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$JuzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Juz &&
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

  @override
  String toString() {
    return 'Juz(id: $id, firstVerseId: $firstVerseId, lastVerseId: $lastVerseId, versesCount: $versesCount, versesMapping: $versesMapping)';
  }
}

/// @nodoc
abstract mixin class _$JuzCopyWith<$Res> implements $JuzCopyWith<$Res> {
  factory _$JuzCopyWith(_Juz value, $Res Function(_Juz) _then) =
      __$JuzCopyWithImpl;
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
class __$JuzCopyWithImpl<$Res> implements _$JuzCopyWith<$Res> {
  __$JuzCopyWithImpl(this._self, this._then);

  final _Juz _self;
  final $Res Function(_Juz) _then;

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstVerseId = null,
    Object? lastVerseId = null,
    Object? versesCount = null,
    Object? versesMapping = null,
  }) {
    return _then(_Juz(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstVerseId: null == firstVerseId
          ? _self.firstVerseId
          : firstVerseId // ignore: cast_nullable_to_non_nullable
              as int,
      lastVerseId: null == lastVerseId
          ? _self.lastVerseId
          : lastVerseId // ignore: cast_nullable_to_non_nullable
              as int,
      versesCount: null == versesCount
          ? _self.versesCount
          : versesCount // ignore: cast_nullable_to_non_nullable
              as int,
      versesMapping: null == versesMapping
          ? _self._versesMapping
          : versesMapping // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

// dart format on
