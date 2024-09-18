// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hospital _$HospitalFromJson(Map<String, dynamic> json) => Hospital(
      (json['id'] as num).toInt(),
      json['code'] as String,
      json['name'] as String,
      json['khet_id'] as String,
      json['province_id'] as String,
    );

Map<String, dynamic> _$HospitalToJson(Hospital instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'khet_id': instance.khet_id,
      'province_id': instance.province_id,
      'name': instance.name,
    };
