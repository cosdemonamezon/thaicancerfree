// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['code'] as String,
      (json['provinces'] as List<dynamic>?)
          ?.map((e) => Provinces.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'provinces': instance.provinces,
    };
