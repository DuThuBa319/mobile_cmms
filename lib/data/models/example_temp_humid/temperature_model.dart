// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'hourly_model.dart';
part 'temperature_model.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class TemperatureModel {
  HourlyObjectModel? hourly;
  TemperatureModel({
    this.hourly,
  });

  factory TemperatureModel.fromJson(Map<String, dynamic> json) =>
      _$TemperatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureModelToJson(this);
}
