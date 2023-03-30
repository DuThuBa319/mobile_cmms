// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'example_temp_humid_repository.dart';

@Injectable(
  as: ExampleTempHumidRepository,
)
class ExampleTempHumidRepositoryImpl extends ExampleTempHumidRepository {
  final TemperatureApiRespository _resApi;
  ExampleTempHumidRepositoryImpl(
    this._resApi,
  );
  @override
  Future<TemperatureModel> getTemperatureHourly({
    String latitude = '10.83',
    String longtitude = '106.83',
    String startDate = '2023-01-01',
    String endDate = '2023-02-08',
  }) {
    return _resApi.getTemperatureHourly(
      latitude: latitude,
      longtitude: longtitude,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
