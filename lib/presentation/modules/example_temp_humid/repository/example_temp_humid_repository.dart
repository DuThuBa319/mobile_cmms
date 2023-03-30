import 'package:injectable/injectable.dart';

import '../../../../data/data_source/remote/rest_api_repository/example_temp_humid/temperature_api_repository.dart';

import '../../../../data/models/example_temp_humid/temperature_model.dart';

part 'example_temp_humid_repository.impl.dart';

abstract class ExampleTempHumidRepository {
  Future<TemperatureModel> getTemperatureHourly({
    String latitude,
    String longtitude,
    String startDate,
    String endDate,
  });
}
