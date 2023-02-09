import 'package:injectable/injectable.dart';

import '../../../../domain/entities/weather_entity.dart';
import '../repository/example_repository.dart';

part 'example_usecase.impl.dart';

abstract class ExampleUsecase {
  Future<List<WeatherEntity>?> getWeather();
}
