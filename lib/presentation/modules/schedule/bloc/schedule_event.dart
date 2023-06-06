part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleEvent {}

class GetWorkOrderEvent extends ScheduleEvent {
  GetWorkOrderEvent({this.dateRequest, this.maintenanceTypeRequest});
  String? dateRequest;
  String? maintenanceTypeRequest;
}

class GetListMaintenanceResponsesEvent extends ScheduleEvent {
  GetListMaintenanceResponsesEvent({
    this.dateRequest,
    this.maintenanceTypeRequest,
  });
  String? dateRequest;
  String? maintenanceTypeRequest;
}
