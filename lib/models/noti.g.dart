// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noti.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Noti _$NotiFromJson(Map<String, dynamic> json) => Noti(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['date'] as String,
      json['hospital'] as String,
    );

Map<String, dynamic> _$NotiToJson(Noti instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'hospital': instance.hospital,
    };
