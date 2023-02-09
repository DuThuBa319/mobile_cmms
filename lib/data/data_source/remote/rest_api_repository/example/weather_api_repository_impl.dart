import 'package:injectable/injectable.dart';

import '../../../../models/example/weather_model.dart';
import '../../../data_repository.dart';
import 'weather_api_repository.dart';

@Injectable(
  as: WeatherApiRespository,
)
class WeatherApiRespositoryImpl
    with DataRepository
    implements WeatherApiRespository {
  @override
  Future<WeatherModel> getWeather({
    String latitude = '10.82',
    String longtitude = '106.83',
    String daily = 'weathercode',
    String timezone = 'Asia/Bangkok',
    String startDate = '2023-01-01',
    String endDate = '2023-02-08',
  }) {
    return restApi.getWeather(
      latitude,
      longtitude,
      daily,
      timezone,
      startDate,
      endDate,
    );
  }
}
