// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JuzImpl _$$JuzImplFromJson(Map<String, dynamic> json) => _$JuzImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      firstVerseId: (json['first_verse_id'] as num?)?.toInt() ?? 0,
      lastVerseId: (json['last_verse_id'] as num?)?.toInt() ?? 0,
      versesCount: (json['verses_count'] as num?)?.toInt() ?? 0,
      versesMapping: (json['verse_mapping'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$$JuzImplToJson(_$JuzImpl instance) => <String, dynamic>{
      'id': instance.id,
      'first_verse_id': instance.firstVerseId,
      'last_verse_id': instance.lastVerseId,
      'verses_count': instance.versesCount,
      'verse_mapping': instance.versesMapping,
    };