part of 'example_temp_humid_bloc.dart';

@immutable
abstract class ExampleTempHumidEvent {}

class GetTemperatureEvent extends ExampleTempHumidEvent {
  GetTemperatureEvent({
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
