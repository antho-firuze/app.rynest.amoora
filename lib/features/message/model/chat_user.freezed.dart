// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatUser {
  String? get id;
  String? get name;
  String? get imageUrl;
  String? get lastMessage;
  String? get time;
  int get unRead;
  bool get isOnline;

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatUserCopyWith<ChatUser> get copyWith =>
      _$ChatUserCopyWithImpl<ChatUser>(this as ChatUser, _$identity);

  /// Serializes this ChatUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatUser &&
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

  @override
  String toString() {
    return 'ChatUser(id: $id, name: $name, imageUrl: $imageUrl, lastMessage: $lastMessage, time: $time, unRead: $unRead, isOnline: $isOnline)';
  }
}

/// @nodoc
abstract mixin class $ChatUserCopyWith<$Res> {
  factory $ChatUserCopyWith(ChatUser value, $Res Function(ChatUser) _then) =
      _$ChatUserCopyWithImpl;
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
class _$ChatUserCopyWithImpl<$Res> implements $ChatUserCopyWith<$Res> {
  _$ChatUserCopyWithImpl(this._self, this._then);

  final ChatUser _self;
  final $Res Function(ChatUser) _then;

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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      unRead: null == unRead
          ? _self.unRead
          : unRead // ignore: cast_nullable_to_non_nullable
              as int,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatUser implements ChatUser {
  _ChatUser(
      {this.id,
      this.name,
      this.imageUrl,
      this.lastMessage,
      this.time,
      this.unRead = 0,
      this.isOnline = false});
  factory _ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);

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

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatUserCopyWith<_ChatUser> get copyWith =>
      __$ChatUserCopyWithImpl<_ChatUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatUser &&
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

  @override
  String toString() {
    return 'ChatUser(id: $id, name: $name, imageUrl: $imageUrl, lastMessage: $lastMessage, time: $time, unRead: $unRead, isOnline: $isOnline)';
  }
}

/// @nodoc
abstract mixin class _$ChatUserCopyWith<$Res>
    implements $ChatUserCopyWith<$Res> {
  factory _$ChatUserCopyWith(_ChatUser value, $Res Function(_ChatUser) _then) =
      __$ChatUserCopyWithImpl;
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
class __$ChatUserCopyWithImpl<$Res> implements _$ChatUserCopyWith<$Res> {
  __$ChatUserCopyWithImpl(this._self, this._then);

  final _ChatUser _self;
  final $Res Function(_ChatUser) _then;

  /// Create a copy of ChatUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? lastMessage = freezed,
    Object? time = freezed,
    Object? unRead = null,
    Object? isOnline = null,
  }) {
    return _then(_ChatUser(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      unRead: null == unRead
          ? _self.unRead
          : unRead // ignore: cast_nullable_to_non_nullable
              as int,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
