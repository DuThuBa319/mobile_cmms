import 'package:json_annotation/json_annotation.dart';
import 'employee.dart';
import 'maintenance_spare_part/maintenance_part.dart';
import 'maintenance_work_order.dart';
part 'maintenance_response.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaintenanceResponse {
  List<String>? cause;
  List<String>? correction;
  DateTime? actualStartTime;
  DateTime? actualFinishTime;
  MaintenanceStatus? status;
  DateTime? statusTime;
  Employee? responsiblePerson;
  List<String>? images;
  List<String>? sounds;
  List<MaintenancePart>? parts;
  String? note;
  MaintenanceResponse({
    this.actualFinishTime,
    this.actualStartTime,
    this.cause,
    this.correction,
    this.images,
    this.note,
    this.parts,
    this.responsiblePerson,
    this.sounds,
    this.status,
    this.statusTime,
  });
  factory MaintenanceResponse.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceResponseToJson(this);
}
