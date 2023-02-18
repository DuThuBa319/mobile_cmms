import 'package:injectable/injectable.dart';

import '../../../../models/example_temp_humid/temperature_model.dart';
import '../../../data_repository.dart';
import 'temperature_api_repository.dart';

@Injectable(
  as: TemperatureApiRespository,
)
class TemperatureApiRespositoryImpl
    with DataRepository
    implements TemperatureApiRespository {
  @override
  Future<TemperatureModel> getTemperature({
    String latitude = '10.82',
    String longtitude = '106.83',
    List<String> hourly = const [
      'temperature_2m',
      'relativehumidity_2m',
      'weathercode'
    ],
    String timezone = 'Asia/Bangkok',
    String startDate = '2023-01-01',
    String endDate = '2023-02-08',
  }) {
    return restApi.getTemperature(
      latitude,
      longtitude,
      hourly,
      timezone,
      startDate,
      endDate,
    );
  }
}
