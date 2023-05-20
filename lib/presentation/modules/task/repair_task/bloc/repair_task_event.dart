part of 'repair_task_bloc.dart';

@immutable
abstract class RepairTaskEvent {}

class GetMaintenanceResponseEvent extends RepairTaskEvent {
  GetMaintenanceResponseEvent({required this.responseId});
  final String responseId;
}

class StartTaskEvent extends RepairTaskEvent {
  StartTaskEvent();
}

class SaveChangeEvent extends RepairTaskEvent {
  SaveChangeEvent();
}

class FinishTaskEvent extends RepairTaskEvent {
  FinishTaskEvent();
}

class ReceiveCauseEvent extends RepairTaskEvent {
  ReceiveCauseEvent({this.listCauseEntity});
  final List<CauseEntity>? listCauseEntity;
}
