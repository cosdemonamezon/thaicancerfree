import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

@JsonSerializable()
class Member {
  int id;
  String fname;
  String lname;
  String idcard;
  String email;
  String phone;
  String address;
  Member(
    this.id,
    this.fname,
    this.address,
    this.email,
    this.idcard,
    this.lname,
    this.phone
  );

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
