part of 'general_check_bloc.dart';

@immutable
abstract class GeneralCheckEvent {}

class GetMaintenanceResponseEvent extends GeneralCheckEvent {
  GetMaintenanceResponseEvent({
    required this.responseId,
    required this.inspectionReports,
  });
  final String responseId;
  final List<InspectionReportEntity> inspectionReports;
}

class DropdownChangedEvent extends GeneralCheckEvent {
  DropdownChangedEvent({required this.index, required this.status});
  final int? index;
  final PreventiveInspectionStatus? status;
}

class MakeRequestEvent extends GeneralCheckEvent {
  MakeRequestEvent({required this.index, this.isRequest});
  final bool? isRequest;
  final int? index;
}

class StartTaskEvent extends GeneralCheckEvent {
  StartTaskEvent();
}

class SaveChangeEvent extends GeneralCheckEvent {
  SaveChangeEvent();
}

class FinishTaskEvent extends GeneralCheckEvent {
  FinishTaskEvent();
}
