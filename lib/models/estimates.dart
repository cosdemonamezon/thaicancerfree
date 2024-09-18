
import 'package:json_annotation/json_annotation.dart';

part 'estimates.g.dart';

@JsonSerializable()
class Estimates { 

  int estimate_id;
  String status;
  Estimates(this.estimate_id, this.status,);

  factory Estimates.fromJson(Map<String, dynamic> json) => _$EstimatesFromJson(json);

  Map<String, dynamic> toJson() => _$EstimatesToJson(this);
}
