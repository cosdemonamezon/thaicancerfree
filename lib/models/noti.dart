import 'package:json_annotation/json_annotation.dart';

part 'noti.g.dart';

@JsonSerializable()
class Noti { 

  int id;
  String title;
  String date;
  String hospital;

  Noti(this.id, this.title, this.date, this.hospital);

  factory Noti.fromJson(Map<String, dynamic> json) => _$NotiFromJson(json);

  Map<String, dynamic> toJson() => _$NotiToJson(this);
}
