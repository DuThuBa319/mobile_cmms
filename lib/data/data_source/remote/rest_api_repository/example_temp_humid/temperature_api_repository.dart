import '../../../../models/example_temp_humid/temperature_model.dart';

abstract class TemperatureApiRespository {
  Future<TemperatureModel> getTemperature({
    String latitude,
    String longtitude,
    List<String> hourly,
    String timezone,
    String startDate,
    String endDate,
  });
}
