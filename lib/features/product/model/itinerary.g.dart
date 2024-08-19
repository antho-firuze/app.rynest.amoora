// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItineraryImpl _$$ItineraryImplFromJson(Map<String, dynamic> json) =>
    _$ItineraryImpl(
      id: json['id'] as int?,
      title: json['title'] as String? ?? '',
      subTitle: json['sub_title'] as String? ?? '',
      desc: json['detail_itinerary'] as String? ?? '',
      activityDate: json['activity_date'] == null
          ? null
          : DateTime.parse(json['activity_date'] as String),
    );

Map<String, dynamic> _$$ItineraryImplToJson(_$ItineraryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sub_title': instance.subTitle,
      'detail_itinerary': instance.desc,
      'activity_date': instance.activityDate?.toIso8601String(),
    };
