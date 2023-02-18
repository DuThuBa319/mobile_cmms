import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/example/weather_model.dart';
import '../../../models/example_temp_humid/temperature_model.dart';

part 'rest_api_repository.g.dart';

@RestApi()
abstract class RestApiRepository {
  factory RestApiRepository(Dio dio, {String baseUrl}) = _RestApiRepository;

  @GET('forecast')
  Future<WeatherModel> getWeather(
    @Query('latitude') String latitude,
    @Query('longitude') String longtitude,
    @Query('daily') String daily,
    @Query('timezone') String timezone,
    @Query('start_date') String startDate,
    @Query('end_date') String endDate,
  );
  @GET('forecast')
  Future<TemperatureModel> getTemperature(
    @Query('latitude') String latitude,
    @Query('longitude') String longtitude,
    @Query('hourly') List<String> hourly,
    @Query('timezone') String timezone,
    @Query('start_date') String startDate,
    @Query('end_date') String endDate,
  );
}
