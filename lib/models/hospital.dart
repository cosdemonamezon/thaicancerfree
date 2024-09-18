import 'package:json_annotation/json_annotation.dart';

part 'hospital.g.dart';

@JsonSerializable()
class Hospital {
  int id;
  String code;
  String khet_id;
  String province_id;
  String name;

  Hospital(this.id, this.code, this.name, this.khet_id, this.province_id);

  factory Hospital.fromJson(Map<String, dynamic> json) => _$HospitalFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalToJson(this);
}
