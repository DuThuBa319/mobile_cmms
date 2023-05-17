import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/cmms/maintenance_response_entity.dart';
import '../cmms_enum.dart';
import '../correction.dart';
import '../equipment/equipment.dart';
import '../material/material.dart';
import '../mold_info/mold.dart';
import 'cause.dart';
import 'employee.dart';
import 'maintenance_request.dart';

part 'maintenance_response.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaintenanceResponse {
  @JsonKey(name: 'maintenanceResponseId')
  String? id;
  DateTime? plannedStart;
  DateTime? plannedFinish;
  String? code;
  List<Cause>? cause;
  List<Correction>? correction;
  int? estProcessTime;
  DateTime? actualStartTime;
  DateTime? actualFinishTime;
  MaintenanceStatus? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Employee? responsiblePerson;
  int? priority;
  String? problem;
  List<String>? images;
  List<String>? sounds;
  List<Materials>? materials;
  String? note;
  MaintenanceRequest? request;
  MaintenanceObject? maintenanceObject;
  Equipment? equipment;
  Mold? mold;
  DateTime? dueDate;
  MaintenanceType? type;

  MaintenanceResponse({
    this.id,
    this.plannedStart,
    this.plannedFinish,
    this.code,
    this.actualFinishTime,
    this.actualStartTime,
    this.cause,
    this.correction,
    this.createdAt,
    this.equipment,
    this.estProcessTime,
    this.images,
    this.maintenanceObject,
    this.materials,
    this.mold,
    this.note,
    this.priority,
    this.problem,
    this.request,
    this.responsiblePerson,
    this.sounds,
    this.status,
    this.updatedAt,
    this.dueDate,
    this.type,
  });

  List<MaintenanceResponseEntity> getListMaintenanceResponseEntity({
    required List<MaintenanceResponseEntity> list,
  }) {
    final result = MaintenanceResponseEntity(
      actualFinishTime: actualFinishTime,
      actualStartTime: actualStartTime,
      cause: cause,
      code: code,
      correction: correction,
      createdAt: createdAt,
      dueDate: dueDate,
      equipment: equipment,
      estProcessTime: estProcessTime,
      id: id,
      maintenanceObject: maintenanceObject,
      materials: materials,
      mold: mold,
      note: note,
      plannedFinish: plannedFinish,
      plannedStart: plannedStart,
      priority: priority,
      problem: problem,
      request: request,
      responsiblePerson: responsiblePerson,
      status: status,
      updatedAt: updatedAt,
      images: images,
      sounds: sounds,
      type: type,
    );
    list.add(result);

    return list;
  }

  factory MaintenanceResponse.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceResponseToJson(this);
}
