// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reqs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReqsImpl _$$ReqsImplFromJson(Map<String, dynamic> json) => _$ReqsImpl(
      url: json['url'] as String?,
      path: json['path'] as String?,
      queryParameters: json['queryParameters'] as Map<String, dynamic>?,
      data: json['data'] as Map<String, dynamic>?,
      filePath: json['filePath'] as String?,
      fileKey: json['fileKey'] as String? ?? 'userfile',
    );

Map<String, dynamic> _$$ReqsImplToJson(_$ReqsImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'path': instance.path,
      'queryParameters': instance.queryParameters,
      'data': instance.data,
      'filePath': instance.filePath,
      'fileKey': instance.fileKey,
    };
