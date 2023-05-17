import 'package:json_annotation/json_annotation.dart';

part 'chart_obj.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class ChartObj {
  String? name;
  double? value;
  ChartObj({
    this.name,
    this.value,
  });
  factory ChartObj.fromJson(Map<String, dynamic> json) =>
      _$ChartObjFromJson(json);

  Map<String, dynamic> toJson() => _$ChartObjToJson(this);
}
