part of 'get_request_info_bloc.dart';

@immutable
abstract class GetRequestInfoEvent {}

class GetEquipmentCodeEvent extends GetRequestInfoEvent {
  GetEquipmentCodeEvent({this.type});

  final String? type;
}

class GetEquipmentNameEvent extends GetRequestInfoEvent {
  GetEquipmentNameEvent({this.code});

  final String? code;
}

class GetEmployeesEvent extends GetRequestInfoEvent {}

class ChangeDateEvent extends GetRequestInfoEvent {
  ChangeDateEvent({this.selectedDate});
  final DateTime? selectedDate;
}

class ReceiveListCauseEvent extends GetRequestInfoEvent {
  ReceiveListCauseEvent({this.listCauseEntity});
  final List<CauseEntity>? listCauseEntity;
}
