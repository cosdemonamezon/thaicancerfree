// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evaluation _$EvaluationFromJson(Map<String, dynamic> json) => Evaluation(
      (json['id'] as num).toInt(),
      json['detail'] as String,
      (json['No'] as num).toInt(),
      json['status'] as String,
      selected: (json['selected'] as num?)?.toInt() ?? 2,
      groupValue: (json['groupValue'] as num?)?.toInt() ?? 2,
    );

Map<String, dynamic> _$EvaluationToJson(Evaluation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'detail': instance.detail,
      'status': instance.status,
      'No': instance.No,
      'selected': instance.selected,
      'groupValue': instance.groupValue,
    };
