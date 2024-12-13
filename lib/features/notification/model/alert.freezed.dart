// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Alert _$AlertFromJson(Map<String, dynamic> json) {
  return _Alert.fromJson(json);
}

/// @nodoc
mixin _$Alert {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  @IntToBoolConverter()
  bool get isRead => throw _privateConstructorUsedError;
  @IntToBoolConverter()
  bool get pinned => throw _privateConstructorUsedError;
  @JsonKey(name: 'pinned_duration')
  int get pinnedDuration => throw _privateConstructorUsedError;

  /// Serializes this Alert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlertCopyWith<Alert> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertCopyWith<$Res> {
  factory $AlertCopyWith(Alert value, $Res Function(Alert) then) =
      _$AlertCopyWithImpl<$Res, Alert>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      String? title,
      String? body,
      String? image,
      String? topic,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'is_read') @IntToBoolConverter() bool isRead,
      @IntToBoolConverter() bool pinned,
      @JsonKey(name: 'pinned_duration') int pinnedDuration});
}

/// @nodoc
class _$AlertCopyWithImpl<$Res, $Val extends Alert>
    implements $AlertCopyWith<$Res> {
  _$AlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = freezed,
    Object? body = freezed,
    Object? image = freezed,
    Object? topic = freezed,
    Object? createdAt = freezed,
    Object? isRead = null,
    Object? pinned = null,
    Object? pinnedDuration = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      pinnedDuration: null == pinnedDuration
          ? _value.pinnedDuration
          : pinnedDuration // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertImplCopyWith<$Res> implements $AlertCopyWith<$Res> {
  factory _$$AlertImplCopyWith(
          _$AlertImpl value, $Res Function(_$AlertImpl) then) =
      __$$AlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      String? title,
      String? body,
      String? image,
      String? topic,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'is_read') @IntToBoolConverter() bool isRead,
      @IntToBoolConverter() bool pinned,
      @JsonKey(name: 'pinned_duration') int pinnedDuration});
}

/// @nodoc
class __$$AlertImplCopyWithImpl<$Res>
    extends _$AlertCopyWithImpl<$Res, _$AlertImpl>
    implements _$$AlertImplCopyWith<$Res> {
  __$$AlertImplCopyWithImpl(
      _$AlertImpl _value, $Res Function(_$AlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = freezed,
    Object? body = freezed,
    Object? image = freezed,
    Object? topic = freezed,
    Object? createdAt = freezed,
    Object? isRead = null,
    Object? pinned = null,
    Object? pinnedDuration = null,
  }) {
    return _then(_$AlertImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      pinnedDuration: null == pinnedDuration
          ? _value.pinnedDuration
          : pinnedDuration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlertImpl implements _Alert {
  _$AlertImpl(
      {this.id = 0,
      @JsonKey(name: 'user_id') this.userId = 0,
      this.title,
      this.body,
      this.image,
      this.topic,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'is_read') @IntToBoolConverter() this.isRead = false,
      @IntToBoolConverter() this.pinned = false,
      @JsonKey(name: 'pinned_duration') this.pinnedDuration = 86400});

  factory _$AlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlertImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? image;
  @override
  final String? topic;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'is_read')
  @IntToBoolConverter()
  final bool isRead;
  @override
  @JsonKey()
  @IntToBoolConverter()
  final bool pinned;
  @override
  @JsonKey(name: 'pinned_duration')
  final int pinnedDuration;

  @override
  String toString() {
    return 'Alert(id: $id, userId: $userId, title: $title, body: $body, image: $image, topic: $topic, createdAt: $createdAt, isRead: $isRead, pinned: $pinned, pinnedDuration: $pinnedDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.pinnedDuration, pinnedDuration) ||
                other.pinnedDuration == pinnedDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, title, body, image,
      topic, createdAt, isRead, pinned, pinnedDuration);

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      __$$AlertImplCopyWithImpl<_$AlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlertImplToJson(
      this,
    );
  }
}

abstract class _Alert implements Alert {
  factory _Alert(
          {final int id,
          @JsonKey(name: 'user_id') final int userId,
          final String? title,
          final String? body,
          final String? image,
          final String? topic,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'is_read') @IntToBoolConverter() final bool isRead,
          @IntToBoolConverter() final bool pinned,
          @JsonKey(name: 'pinned_duration') final int pinnedDuration}) =
      _$AlertImpl;

  factory _Alert.fromJson(Map<String, dynamic> json) = _$AlertImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  String? get title;
  @override
  String? get body;
  @override
  String? get image;
  @override
  String? get topic;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'is_read')
  @IntToBoolConverter()
  bool get isRead;
  @override
  @IntToBoolConverter()
  bool get pinned;
  @override
  @JsonKey(name: 'pinned_duration')
  int get pinnedDuration;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
