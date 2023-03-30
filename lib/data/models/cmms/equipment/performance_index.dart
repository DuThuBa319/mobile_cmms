import 'package:json_annotation/json_annotation.dart';

import 'time_series_object.dart';
part 'performance_index.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class PerformanceIndex {
  bool? isTracking;
  double? recentValue;
  List<TimeSeriesObject>? history;
  int? maxLength;
  PerformanceIndex({
    this.history,
    this.isTracking,
    this.maxLength,
    this.recentValue,
  });
  factory PerformanceIndex.fromJson(Map<String, dynamic> json) =>
      _$PerformanceIndexFromJson(json);

  Map<String, dynamic> toJson() => _$PerformanceIndexToJson(this);
}
