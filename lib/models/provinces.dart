import 'package:json_annotation/json_annotation.dart';
import 'package:thaicancerfree/models/hospital.dart';

part 'provinces.g.dart';

@JsonSerializable()
class Provinces { 

  int id;
  String khet_id;
  String name;
  String code;
  List<Hospital>? hospitals;

  Provinces(this.id, this.name, this.code, this.khet_id, this.hospitals);

  factory Provinces.fromJson(Map<String, dynamic> json) => _$ProvincesFromJson(json);

  Map<String, dynamic> toJson() => _$ProvincesToJson(this);
}
