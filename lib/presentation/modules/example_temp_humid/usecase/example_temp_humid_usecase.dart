import 'package:injectable/injectable.dart';

import '../../../../domain/entities/temperature_entity.dart';

import '../repository/example_temp_humid_repository.dart';

part 'example_temp_humid_usecase.impl.dart';

abstract class ExampleTempHumidUsecase {
  Future<List<TemperatureEntity>?> getTemperatureHourly({
    String latitude,
    String longtitude,
    String startDate,
    String endDate,
  });
}
