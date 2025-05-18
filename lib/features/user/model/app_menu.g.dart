// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppMenu _$AppMenuFromJson(Map<String, dynamic> json) => _AppMenu(
      code: json['code'] as String? ?? '',
      title: json['name'] as String? ?? '',
      tooltip: json['desc'] as String?,
      isDefault: json['is_default'] as bool? ?? false,
      isShow: json['is_show'] as bool? ?? true,
      isFavorite: json['is_favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$AppMenuToJson(_AppMenu instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.title,
      'desc': instance.tooltip,
      'is_default': instance.isDefault,
      'is_show': instance.isShow,
      'is_favorite': instance.isFavorite,
    };
