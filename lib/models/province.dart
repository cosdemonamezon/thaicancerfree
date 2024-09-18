import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

@JsonSerializable()
class Province { 

  int id;
  String name;

  Province(this.id, this.name);

  factory Province.fromJson(Map<String, dynamic> json) => _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
