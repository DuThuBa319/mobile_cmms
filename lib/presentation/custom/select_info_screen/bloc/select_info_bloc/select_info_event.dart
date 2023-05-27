part of 'select_info_bloc.dart';

@immutable
abstract class SelectInfoEvent {}

class GetInfosEvent extends SelectInfoEvent {
  GetInfosEvent({
    this.selectedCause,
    this.infoType = InfoType.Cause,
    this.selectedCorrection,
  });
  final List<CauseEntity>? selectedCause;
  final InfoType? infoType;
  final List<CorrectionEntity>? selectedCorrection;
}

class InfoSelectedEvent extends SelectInfoEvent {
  InfoSelectedEvent({this.index});
  final int? index;
}

class ResponseInfosEvent extends SelectInfoEvent {
  ResponseInfosEvent({
    this.infoType = InfoType.Cause,
  });

  final InfoType? infoType;
}
