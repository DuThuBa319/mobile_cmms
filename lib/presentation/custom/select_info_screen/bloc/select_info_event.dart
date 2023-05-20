part of 'select_info_bloc.dart';

@immutable
abstract class SelectInfoEvent {}

class GetCausesEvent extends SelectInfoEvent {
  GetCausesEvent({this.selectedCause});
  final List<CauseEntity>? selectedCause;
}

class SelectCauseEvent extends SelectInfoEvent {
  SelectCauseEvent({this.index});
  final int? index;
}

class ResponseCausesEvent extends SelectInfoEvent {}
