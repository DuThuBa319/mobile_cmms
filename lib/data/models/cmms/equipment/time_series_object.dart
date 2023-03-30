import 'package:json_annotation/json_annotation.dart';
part 'time_series_object.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class TimeSeriesObject {
  DateTime? time;
  double? value;
  TimeSeriesObject({
    this.time,
    this.value,
  });
  factory TimeSeriesObject.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesObjectFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSeriesObjectToJson(this);
}
