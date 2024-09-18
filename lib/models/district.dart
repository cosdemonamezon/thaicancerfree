import 'package:json_annotation/json_annotation.dart';
import 'package:thaicancerfree/models/provinces.dart';

part 'district.g.dart';

@JsonSerializable()
class District { 

  int id;
  String code;
  String name;
  List<Provinces>? provinces;

  District(this.id, this.name, this.code, this.provinces);

  factory District.fromJson(Map<String, dynamic> json) => _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
