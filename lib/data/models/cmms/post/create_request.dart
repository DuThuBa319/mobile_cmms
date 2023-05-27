import 'package:json_annotation/json_annotation.dart';

import '../cmms_enum.dart';

part 'create_request.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class CreateRequest {
  // int? id;
  DateTime? requestedCompletionDate;
  DateTime? submissionDate;
  // String? code;
  MaintenanceType? type;
  int? requestedPriority;
  @JsonKey(name: 'equipment')
  String? equipmentCode;
  String? problem;
  RequestStatus? status;
  String? requester;
  String? responsiblePerson;
  MaintenanceObject? maintenanceObject;
  List<String>? images;
  List<String>? sounds;

  CreateRequest({
    this.equipmentCode,
    this.problem,
    this.requestedPriority,
    this.type,
    this.requester,
    this.maintenanceObject,
    this.status,
    this.requestedCompletionDate,
    this.responsiblePerson,
    this.submissionDate,
    this.images,
    this.sounds,
  });
  factory CreateRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRequestToJson(this);
}
