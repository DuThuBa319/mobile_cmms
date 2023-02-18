part of 'example_bloc.dart';

@immutable
abstract class ExampleEvent {}

class GetWeatherEvent extends ExampleEvent {
  GetWeatherEvent({
    required this.startDate,
    required this.endDate,
    required this.latitude,
    required this.longtitude,
  });
  String startDate;
  String endDate;
  String latitude;
  String longtitude;
}
