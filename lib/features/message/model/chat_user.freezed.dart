// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatUser _$ChatUserFromJson(Map<String, dynamic> json) {
  return _ChatUser.fromJson(json);
}

/// @nodoc
mixin _$ChatUser {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  int get unRead => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;

  /// Serializes this ChatUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatUserCopyWith<ChatUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatUserCopyWith<$Res> {
  factory $ChatUserCopyWith(ChatUser value, $Res Function(ChatUser) then) =
      _$ChatUserCopyWithImpl<$Res, ChatUser>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? imageUrl,
      String? lastMessage,
      String? time,
      int unRead,
      bool isOnline});
}

/// @nodoc
class _$ChatUserCopyWithImpl<$Res, $Val extends ChatUser>
    implements $ChatUserCopyWith<$Res> {
  _$ChatUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? lastMessage = freezed,
    Object? time = freezed,
    Object? unRead = null,
    Object? isOnline = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      unRead: null == unRead
          ? _value.unRead
          : unRead // ignore: cast_nullable_to_non_nullable
              as int,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatUserImplCopyWith<$Res>
    implements $ChatUserCopyWith<$Res> {
  factory _$$ChatUserImplCopyWith(
          _$ChatUserImpl value, $Res Function(_$ChatUserImpl) then) =
      __$$ChatUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? imageUrl,
      String? lastMessage,
      String? time,
      int unRead,
      bool isOnline});
}

/// @nodoc
class __$$ChatUserImplCopyWithImpl<$Res>
    extends _$ChatUserCopyWithImpl<$Res, _$ChatUserImpl>
    implements _$$ChatUserImplCopyWith<$Res> {
  __$$ChatUserImplCopyWithImpl(
      _$ChatUserImpl _value, $Res Function(_$ChatUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? lastMessage = freezed,
    Object? time = freezed,
    Object? unRead = null,
    Object? isOnline = null,
  }) {
    return _then(_$ChatUserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      unRead: null == unRead
          ? _value.unRead
          : unRead // ignore: cast_nullable_to_non_nullable
              as int,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatUserImpl implements _ChatUser {
  _$ChatUserImpl(
      {this.id,
      this.name,
      this.imageUrl,
      this.lastMessage,
      this.time,
      this.unRead = 0,
      this.isOnline = false});

  factory _$ChatUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatUserImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? imageUrl;
  @override
  final String? lastMessage;
  @override
  final String? time;
  @override
  @JsonKey()
  final int unRead;
  @override
  @JsonKey()
  final bool isOnline;

  @override
  String toString() {
    return 'ChatUser(id: $id, name: $name, imageUrl: $imageUrl, lastMessage: $lastMessage, time: $time, unRead: $unRead, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.unRead, unRead) || other.unRead == unRead) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, imageUrl, lastMessage, time, unRead, isOnline);

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatUserImplCopyWith<_$ChatUserImpl> get copyWith =>
      __$$ChatUserImplCopyWithImpl<_$ChatUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatUserImplToJson(
      this,
    );
  }
}

abstract class _ChatUser implements ChatUser {
  factory _ChatUser(
      {final String? id,
      final String? name,
      final String? imageUrl,
      final String? lastMessage,
      final String? time,
      final int unRead,
      final bool isOnline}) = _$ChatUserImpl;

  factory _ChatUser.fromJson(Map<String, dynamic> json) =
      _$ChatUserImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get imageUrl;
  @override
  String? get lastMessage;
  @override
  String? get time;
  @override
  int get unRead;
  @override
  bool get isOnline;

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatUserImplCopyWith<_$ChatUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
