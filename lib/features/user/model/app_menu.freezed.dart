// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppMenu {
  @JsonKey(name: 'code')
  String get code;
  @JsonKey(name: 'name')
  String get title;
  @JsonKey(name: 'desc')
  String? get tooltip;
  @JsonKey(name: 'is_default')
  bool get isDefault;
  @JsonKey(name: 'is_show')
  bool get isShow;
  @JsonKey(name: 'is_favorite')
  bool get isFavorite;

  /// Create a copy of AppMenu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppMenuCopyWith<AppMenu> get copyWith =>
      _$AppMenuCopyWithImpl<AppMenu>(this as AppMenu, _$identity);

  /// Serializes this AppMenu to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppMenu &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isShow, isShow) || other.isShow == isShow) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, title, tooltip, isDefault, isShow, isFavorite);

  @override
  String toString() {
    return 'AppMenu(code: $code, title: $title, tooltip: $tooltip, isDefault: $isDefault, isShow: $isShow, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class $AppMenuCopyWith<$Res> {
  factory $AppMenuCopyWith(AppMenu value, $Res Function(AppMenu) _then) =
      _$AppMenuCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String title,
      @JsonKey(name: 'desc') String? tooltip,
      @JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'is_show') bool isShow,
      @JsonKey(name: 'is_favorite') bool isFavorite});
}

/// @nodoc
class _$AppMenuCopyWithImpl<$Res> implements $AppMenuCopyWith<$Res> {
  _$AppMenuCopyWithImpl(this._self, this._then);

  final AppMenu _self;
  final $Res Function(AppMenu) _then;

  /// Create a copy of AppMenu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? title = null,
    Object? tooltip = freezed,
    Object? isDefault = null,
    Object? isShow = null,
    Object? isFavorite = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tooltip: freezed == tooltip
          ? _self.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isShow: null == isShow
          ? _self.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppMenu implements AppMenu {
  _AppMenu(
      {@JsonKey(name: 'code') this.code = '',
      @JsonKey(name: 'name') this.title = '',
      @JsonKey(name: 'desc') this.tooltip,
      @JsonKey(name: 'is_default') this.isDefault = false,
      @JsonKey(name: 'is_show') this.isShow = true,
      @JsonKey(name: 'is_favorite') this.isFavorite = false});
  factory _AppMenu.fromJson(Map<String, dynamic> json) =>
      _$AppMenuFromJson(json);

  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'name')
  final String title;
  @override
  @JsonKey(name: 'desc')
  final String? tooltip;
  @override
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @override
  @JsonKey(name: 'is_show')
  final bool isShow;
  @override
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;

  /// Create a copy of AppMenu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppMenuCopyWith<_AppMenu> get copyWith =>
      __$AppMenuCopyWithImpl<_AppMenu>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppMenuToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppMenu &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isShow, isShow) || other.isShow == isShow) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, title, tooltip, isDefault, isShow, isFavorite);

  @override
  String toString() {
    return 'AppMenu(code: $code, title: $title, tooltip: $tooltip, isDefault: $isDefault, isShow: $isShow, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class _$AppMenuCopyWith<$Res> implements $AppMenuCopyWith<$Res> {
  factory _$AppMenuCopyWith(_AppMenu value, $Res Function(_AppMenu) _then) =
      __$AppMenuCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String title,
      @JsonKey(name: 'desc') String? tooltip,
      @JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'is_show') bool isShow,
      @JsonKey(name: 'is_favorite') bool isFavorite});
}

/// @nodoc
class __$AppMenuCopyWithImpl<$Res> implements _$AppMenuCopyWith<$Res> {
  __$AppMenuCopyWithImpl(this._self, this._then);

  final _AppMenu _self;
  final $Res Function(_AppMenu) _then;

  /// Create a copy of AppMenu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? title = null,
    Object? tooltip = freezed,
    Object? isDefault = null,
    Object? isShow = null,
    Object? isFavorite = null,
  }) {
    return _then(_AppMenu(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tooltip: freezed == tooltip
          ? _self.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isShow: null == isShow
          ? _self.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
