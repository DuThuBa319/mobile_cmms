part of 'request_bloc.dart';

@immutable
abstract class RequestEvent {}

class MakeRequestEvent extends RequestEvent {
  MakeRequestEvent({
    this.priority,
    this.problem,
    //this.requestedCompletionDate,
    this.type,
    this.equipmentCode,
    this.maintenanceObject = MaintenanceObject.equipment,
    this.requestStatus = RequestStatus.submitted,
    this.requestorCode,
  });
  // List<File>? imageFiles;
  // List<File>? audioFiles;
  //DateTime? requestedCompletionDate;
  String? problem;
  MaintenanceType? type;
  int? priority;
  String? requestorCode;
  String? equipmentCode;
  MaintenanceObject? maintenanceObject;
  RequestStatus? requestStatus;
}
