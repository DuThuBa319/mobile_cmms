part of 'request_bloc.dart';

@immutable
abstract class RequestEvent {}

class MakeRequestEvent extends RequestEvent {
  MakeRequestEvent({
    this.priority,
    this.problem,
    this.requestedCompletionDate,
    this.type,
    this.objectCode,
    this.maintenanceObject = MaintenanceObject.equipment,
    this.requestStatus = RequestStatus.submitted,
    this.responsiblePersonCode,
    this.audioFiles,
    this.imageFiles,
  });
  List<File>? imageFiles;
  List<File>? audioFiles;
  DateTime? requestedCompletionDate;
  String? problem;
  MaintenanceType? type;
  int? priority;
  String? responsiblePersonCode;
  String? objectCode;
  MaintenanceObject? maintenanceObject;
  RequestStatus? requestStatus;
}
