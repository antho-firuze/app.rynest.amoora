// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'streamer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Streamer {
  @JsonKey(name: 'id')
  @JsonIntConverter()
  int get id;
  @JsonKey(name: 'signaling_channel')
  String get signalingChannel;
  @JsonKey(name: 'streaming_channel')
  String get streamingChannel;
  @JsonKey(name: 'views')
  int get views;
  @JsonKey(name: 'live_views')
  int get liveViews;
  String get title;
  String get desc;
  String get device;
  String get location;
  @JsonKey(name: 'ip_address')
  String get ipAddress;
  @JsonKey(name: 'started_at')
  @JsonDateTimeConverter()
  DateTime? get startedAt;
  @JsonKey(name: 'finished_at')
  @JsonDateTimeConverter()
  DateTime? get finishedAt;
  @JsonKey(name: 'heartbeat')
  @JsonDateTimeConverter()
  DateTime? get heartbeat;
  @JsonKey(name: 'user_id')
  @JsonIntConverter()
  int? get userId;

  /// Create a copy of Streamer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StreamerCopyWith<Streamer> get copyWith =>
      _$StreamerCopyWithImpl<Streamer>(this as Streamer, _$identity);

  /// Serializes this Streamer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Streamer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.signalingChannel, signalingChannel) ||
                other.signalingChannel == signalingChannel) &&
            (identical(other.streamingChannel, streamingChannel) ||
                other.streamingChannel == streamingChannel) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.liveViews, liveViews) ||
                other.liveViews == liveViews) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.heartbeat, heartbeat) ||
                other.heartbeat == heartbeat) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      signalingChannel,
      streamingChannel,
      views,
      liveViews,
      title,
      desc,
      device,
      location,
      ipAddress,
      startedAt,
      finishedAt,
      heartbeat,
      userId);

  @override
  String toString() {
    return 'Streamer(id: $id, signalingChannel: $signalingChannel, streamingChannel: $streamingChannel, views: $views, liveViews: $liveViews, title: $title, desc: $desc, device: $device, location: $location, ipAddress: $ipAddress, startedAt: $startedAt, finishedAt: $finishedAt, heartbeat: $heartbeat, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $StreamerCopyWith<$Res> {
  factory $StreamerCopyWith(Streamer value, $Res Function(Streamer) _then) =
      _$StreamerCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @JsonIntConverter() int id,
      @JsonKey(name: 'signaling_channel') String signalingChannel,
      @JsonKey(name: 'streaming_channel') String streamingChannel,
      @JsonKey(name: 'views') int views,
      @JsonKey(name: 'live_views') int liveViews,
      String title,
      String desc,
      String device,
      String location,
      @JsonKey(name: 'ip_address') String ipAddress,
      @JsonKey(name: 'started_at') @JsonDateTimeConverter() DateTime? startedAt,
      @JsonKey(name: 'finished_at')
      @JsonDateTimeConverter()
      DateTime? finishedAt,
      @JsonKey(name: 'heartbeat') @JsonDateTimeConverter() DateTime? heartbeat,
      @JsonKey(name: 'user_id') @JsonIntConverter() int? userId});
}

/// @nodoc
class _$StreamerCopyWithImpl<$Res> implements $StreamerCopyWith<$Res> {
  _$StreamerCopyWithImpl(this._self, this._then);

  final Streamer _self;
  final $Res Function(Streamer) _then;

  /// Create a copy of Streamer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? signalingChannel = null,
    Object? streamingChannel = null,
    Object? views = null,
    Object? liveViews = null,
    Object? title = null,
    Object? desc = null,
    Object? device = null,
    Object? location = null,
    Object? ipAddress = null,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? heartbeat = freezed,
    Object? userId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      signalingChannel: null == signalingChannel
          ? _self.signalingChannel
          : signalingChannel // ignore: cast_nullable_to_non_nullable
              as String,
      streamingChannel: null == streamingChannel
          ? _self.streamingChannel
          : streamingChannel // ignore: cast_nullable_to_non_nullable
              as String,
      views: null == views
          ? _self.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      liveViews: null == liveViews
          ? _self.liveViews
          : liveViews // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _self.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _self.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _self.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      heartbeat: freezed == heartbeat
          ? _self.heartbeat
          : heartbeat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Streamer implements Streamer {
  _Streamer(
      {@JsonKey(name: 'id') @JsonIntConverter() this.id = 0,
      @JsonKey(name: 'signaling_channel') this.signalingChannel = '',
      @JsonKey(name: 'streaming_channel') this.streamingChannel = '',
      @JsonKey(name: 'views') this.views = 0,
      @JsonKey(name: 'live_views') this.liveViews = 0,
      this.title = '',
      this.desc = '',
      this.device = '',
      this.location = '',
      @JsonKey(name: 'ip_address') this.ipAddress = '',
      @JsonKey(name: 'started_at') @JsonDateTimeConverter() this.startedAt,
      @JsonKey(name: 'finished_at') @JsonDateTimeConverter() this.finishedAt,
      @JsonKey(name: 'heartbeat') @JsonDateTimeConverter() this.heartbeat,
      @JsonKey(name: 'user_id') @JsonIntConverter() this.userId});
  factory _Streamer.fromJson(Map<String, dynamic> json) =>
      _$StreamerFromJson(json);

  @override
  @JsonKey(name: 'id')
  @JsonIntConverter()
  final int id;
  @override
  @JsonKey(name: 'signaling_channel')
  final String signalingChannel;
  @override
  @JsonKey(name: 'streaming_channel')
  final String streamingChannel;
  @override
  @JsonKey(name: 'views')
  final int views;
  @override
  @JsonKey(name: 'live_views')
  final int liveViews;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String desc;
  @override
  @JsonKey()
  final String device;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey(name: 'ip_address')
  final String ipAddress;
  @override
  @JsonKey(name: 'started_at')
  @JsonDateTimeConverter()
  final DateTime? startedAt;
  @override
  @JsonKey(name: 'finished_at')
  @JsonDateTimeConverter()
  final DateTime? finishedAt;
  @override
  @JsonKey(name: 'heartbeat')
  @JsonDateTimeConverter()
  final DateTime? heartbeat;
  @override
  @JsonKey(name: 'user_id')
  @JsonIntConverter()
  final int? userId;

  /// Create a copy of Streamer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StreamerCopyWith<_Streamer> get copyWith =>
      __$StreamerCopyWithImpl<_Streamer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StreamerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Streamer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.signalingChannel, signalingChannel) ||
                other.signalingChannel == signalingChannel) &&
            (identical(other.streamingChannel, streamingChannel) ||
                other.streamingChannel == streamingChannel) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.liveViews, liveViews) ||
                other.liveViews == liveViews) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.heartbeat, heartbeat) ||
                other.heartbeat == heartbeat) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      signalingChannel,
      streamingChannel,
      views,
      liveViews,
      title,
      desc,
      device,
      location,
      ipAddress,
      startedAt,
      finishedAt,
      heartbeat,
      userId);

  @override
  String toString() {
    return 'Streamer(id: $id, signalingChannel: $signalingChannel, streamingChannel: $streamingChannel, views: $views, liveViews: $liveViews, title: $title, desc: $desc, device: $device, location: $location, ipAddress: $ipAddress, startedAt: $startedAt, finishedAt: $finishedAt, heartbeat: $heartbeat, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class _$StreamerCopyWith<$Res>
    implements $StreamerCopyWith<$Res> {
  factory _$StreamerCopyWith(_Streamer value, $Res Function(_Streamer) _then) =
      __$StreamerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @JsonIntConverter() int id,
      @JsonKey(name: 'signaling_channel') String signalingChannel,
      @JsonKey(name: 'streaming_channel') String streamingChannel,
      @JsonKey(name: 'views') int views,
      @JsonKey(name: 'live_views') int liveViews,
      String title,
      String desc,
      String device,
      String location,
      @JsonKey(name: 'ip_address') String ipAddress,
      @JsonKey(name: 'started_at') @JsonDateTimeConverter() DateTime? startedAt,
      @JsonKey(name: 'finished_at')
      @JsonDateTimeConverter()
      DateTime? finishedAt,
      @JsonKey(name: 'heartbeat') @JsonDateTimeConverter() DateTime? heartbeat,
      @JsonKey(name: 'user_id') @JsonIntConverter() int? userId});
}

/// @nodoc
class __$StreamerCopyWithImpl<$Res> implements _$StreamerCopyWith<$Res> {
  __$StreamerCopyWithImpl(this._self, this._then);

  final _Streamer _self;
  final $Res Function(_Streamer) _then;

  /// Create a copy of Streamer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? signalingChannel = null,
    Object? streamingChannel = null,
    Object? views = null,
    Object? liveViews = null,
    Object? title = null,
    Object? desc = null,
    Object? device = null,
    Object? location = null,
    Object? ipAddress = null,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? heartbeat = freezed,
    Object? userId = freezed,
  }) {
    return _then(_Streamer(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      signalingChannel: null == signalingChannel
          ? _self.signalingChannel
          : signalingChannel // ignore: cast_nullable_to_non_nullable
              as String,
      streamingChannel: null == streamingChannel
          ? _self.streamingChannel
          : streamingChannel // ignore: cast_nullable_to_non_nullable
              as String,
      views: null == views
          ? _self.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      liveViews: null == liveViews
          ? _self.liveViews
          : liveViews // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _self.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _self.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _self.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _self.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      heartbeat: freezed == heartbeat
          ? _self.heartbeat
          : heartbeat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
