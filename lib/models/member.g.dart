// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      (json['id'] as num).toInt(),
      json['fname'] as String,
      json['address'] as String,
      json['email'] as String,
      json['idcard'] as String,
      json['lname'] as String,
      json['phone'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'fname': instance.fname,
      'lname': instance.lname,
      'idcard': instance.idcard,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };
