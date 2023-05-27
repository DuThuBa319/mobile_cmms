part of 'receive_info_selection_bloc.dart';

@immutable
abstract class ReceiveInfoSelectionEvent {}

class ReceiveInfoInitialEvent extends ReceiveInfoSelectionEvent {
  ReceiveInfoInitialEvent({
    this.listCauseSelected,
    this.listCorrectionSelected,
    this.audioFiles,
    this.imageFiles,
  });
  final List<CauseEntity>? listCauseSelected;
  final List<CorrectionEntity>? listCorrectionSelected;
  final List<File>? imageFiles;
  final List<File>? audioFiles;
}

class ReceiveCauseEvent extends ReceiveInfoSelectionEvent {
  ReceiveCauseEvent({this.listCauseEntity});
  final List<CauseEntity>? listCauseEntity;
}

class ReceiveCorrectionEvent extends ReceiveInfoSelectionEvent {
  ReceiveCorrectionEvent({this.listCorrectionEntity});
  final List<CorrectionEntity>? listCorrectionEntity;
}

class ReceiveImageFileEvent extends ReceiveInfoSelectionEvent {
  ReceiveImageFileEvent({this.imageFiles});
  final List<File>? imageFiles;
}

class ReceiveAudioFileEvent extends ReceiveInfoSelectionEvent {
  ReceiveAudioFileEvent({this.audioFiles});
  final List<File>? audioFiles;
}

class UploadFileEvent extends ReceiveInfoSelectionEvent {
  UploadFileEvent({this.path});
  final String? path;
}
