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

class ReceiveCauseIdEvent extends RepairTaskEvent {
  ReceiveCauseIdEvent({this.listCauseId});
  final List<String>? listCauseId;
}

class ReceiveCorrectionIdEvent extends RepairTaskEvent {
  ReceiveCorrectionIdEvent({this.listCorrectionId});
  final List<String>? listCorrectionId;
}

class ReceiveListImageFileEvent extends RepairTaskEvent {
  ReceiveListImageFileEvent({this.imageFiles});
  final List<File>? imageFiles;
}

class ReceiveListAudioFileEvent extends RepairTaskEvent {
  ReceiveListAudioFileEvent({this.audioFiles});
  final List<File>? audioFiles;
}
