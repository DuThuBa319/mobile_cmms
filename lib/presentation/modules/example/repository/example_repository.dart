import 'package:injectable/injectable.dart';

import '../../../../data/data_source/remote/rest_api_repository/example/weather_api_repository.dart';
import '../../../../data/models/example/weather_model.dart';

part 'example_repository.impl.dart';

abstract class ExampleRepository {
  Future<WeatherModel> getWeather();
}
