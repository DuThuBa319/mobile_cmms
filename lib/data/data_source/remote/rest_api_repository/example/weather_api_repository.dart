import '../../../../models/example/weather_model.dart';

abstract class WeatherApiRespository {
  Future<WeatherModel> getWeather({
    String latitude,
    String longtitude,
    String daily,
    String timezone,
    String startDate,
    String endDate,
  });
}
