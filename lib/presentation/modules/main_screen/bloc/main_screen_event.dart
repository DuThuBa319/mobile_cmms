part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class GetListMaintenanceResponsesEvent extends MainScreenEvent {
  GetListMaintenanceResponsesEvent();
}
