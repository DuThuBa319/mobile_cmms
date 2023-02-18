part of 'example_usecase.dart';

@Injectable(
  as: ExampleUsecase,
)
class ExampleUsecaseImpl extends ExampleUsecase {
  final ExampleRepository _repository;

  ExampleUsecaseImpl(this._repository);

  @override
  Future<List<WeatherEntity>?> getWeather({
    String latitude = '10.82',
    String longtitude = '106.83',
    String startDate = '2023-01-01',
    String endDate = '2023-02-08',
  }) async {
    final response = await _repository.getWeather(
      latitude: latitude,
      longtitude: longtitude,
      startDate: startDate,
      endDate: endDate,
    );
    final weatherEntity = response.daily?.getWeatherEntites();
    return weatherEntity;
  }
}
