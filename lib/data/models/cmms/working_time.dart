import 'package:json_annotation/json_annotation.dart';

part 'working_time.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class WorkingTime {
  DateTime? from;
  DateTime? to;
  WorkingTime({
    this.from,
    this.to,
  });
  factory WorkingTime.fromJson(Map<String, dynamic> json) =>
      _$WorkingTimeFromJson(json);

  Map<String, dynamic> toJson() => _$WorkingTimeToJson(this);
}
