// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Estimates _$EstimatesFromJson(Map<String, dynamic> json) => Estimates(
      (json['estimate_id'] as num).toInt(),
      json['status'] as String,
    );

Map<String, dynamic> _$EstimatesToJson(Estimates instance) => <String, dynamic>{
      'estimate_id': instance.estimate_id,
      'status': instance.status,
    };
