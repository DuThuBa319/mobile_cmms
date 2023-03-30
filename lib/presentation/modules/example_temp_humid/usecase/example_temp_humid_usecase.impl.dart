part of 'example_temp_humid_usecase.dart';

@Injectable(
  as: ExampleTempHumidUsecase,
)
class ExampleTempHumidUsecaseImpl extends ExampleTempHumidUsecase {
  final ExampleTempHumidRepository _repository;

  ExampleTempHumidUsecaseImpl(this._repository);

  @override
  Future<List<TemperatureEntity>?> getTemperatureHourly({
    String latitude = '10.82',
    String longtitude = '106.83',
    String startDate = '2023-01-01',
    String endDate = '2023-02-08',
  }) async {
    final response = await _repository.getTemperatureHourly(
      latitude: latitude,
      longtitude: longtitude,
      startDate: startDate,
      endDate: endDate,
    );
    final temperatureEntity = response.hourly?.getTemperatureEntites();
    return temperatureEntity;
  }
}
