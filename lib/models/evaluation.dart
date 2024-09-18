
import 'package:json_annotation/json_annotation.dart';

part 'evaluation.g.dart';

@JsonSerializable()
class Evaluation { 

  int id;
  String detail;
  String status;
  int No;
  int selected;
  int groupValue;

  Evaluation(this.id, this.detail, this.No, this.status, {this.selected = 2, this.groupValue = 2});

  factory Evaluation.fromJson(Map<String, dynamic> json) => _$EvaluationFromJson(json);

  Map<String, dynamic> toJson() => _$EvaluationToJson(this);
}
