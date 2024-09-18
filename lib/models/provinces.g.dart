// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provinces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Provinces _$ProvincesFromJson(Map<String, dynamic> json) => Provinces(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['code'] as String,
      json['khet_id'] as String,
      (json['hospitals'] as List<dynamic>?)
          ?.map((e) => Hospital.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProvincesToJson(Provinces instance) => <String, dynamic>{
      'id': instance.id,
      'khet_id': instance.khet_id,
      'name': instance.name,
      'code': instance.code,
      'hospitals': instance.hospitals,
    };
