import 'package:json_annotation/json_annotation.dart';

import '../cmms_enum.dart';
import '../equipment/equipment.dart';
import 'employee.dart';

part 'maintenance_request.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaintenanceRequest {
  // int? id;
  // DateTime? requestedCompletionDate;
  // DateTime? submissionDate;
  // String? code;
  MaintenanceType? type;
  int? requestedPriority;
  Equipment? equipment;
  String? problem;
  RequestStatus? status;
  Employee? requester;
//  Employee? reviewer;
//  List<String>? images;
  // List<String>? sounds;
  // Employee? responsiblePerson;
  // int? estProcessTime;
  // DateTime? plannedStart;
  MaintenanceObject? maintenanceObject;
//  Mold? mold;
  MaintenanceRequest({
    //this.id,
    //this.requestedCompletionDate,
    // this.submissionDate,
    // this.status,
    // this.code,
    this.equipment,
    this.problem,
    this.requestedPriority,
    this.type,
    this.requester,
    // this.reviewer,
    // this.images,
    // this.responsiblePerson,
    // this.sounds,
    // this.estProcessTime,
    this.maintenanceObject,
    // this.mold,
    // this.plannedStart,
    this.status,
  });
  factory MaintenanceRequest.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceRequestToJson(this);
}
