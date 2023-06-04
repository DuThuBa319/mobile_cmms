import 'package:json_annotation/json_annotation.dart';

import '../cmms_enum.dart';
import '../maintenance_response/inspection_report.dart';

part 'update_response.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class UpdateResponse {
  List<String>? cause;
  List<String>? correction;
  DateTime? actualStartTime;
  DateTime? actualFinishTime;
  MaintenanceStatus? status;
  DateTime? updatedAt;
  List<String>? images;
  List<String>? sounds;
  List<String>? materials;
  List<InspectionReport>? inspectionReports;
  MaintenanceType? type;

  UpdateResponse({
    this.actualFinishTime,
    this.actualStartTime,
    this.cause,
    this.correction,
    this.images,
    this.materials,
    this.sounds,
    this.status,
    this.updatedAt,
    this.inspectionReports,
    this.type,
  });

  UpdateResponse copyWith({
    List<String>? cause,
    List<String>? correction,
    DateTime? actualStartTime,
    DateTime? actualFinishTime,
    MaintenanceStatus? status,
    DateTime? updatedAt,
    List<String>? images,
    List<String>? sounds,
    List<String>? materials,
    List<InspectionReport>? inspectionReports,
    MaintenanceType? type,
  }) {
    return UpdateResponse(
      cause: cause ?? this.cause,
      correction: correction ?? this.correction,
      actualStartTime: actualStartTime ?? this.actualStartTime,
      actualFinishTime: actualFinishTime ?? this.actualFinishTime,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      images: images ?? this.images,
      sounds: sounds ?? this.sounds,
      materials: materials ?? this.materials,
      inspectionReports: inspectionReports ?? this.inspectionReports,
      type: type ?? this.type,
    );
  }

  factory UpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateResponseToJson(this);
}
