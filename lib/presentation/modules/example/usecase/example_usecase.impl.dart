part of 'example_usecase.dart';

@Injectable(
  as: ExampleUsecase,
)
class ExampleUsecaseImpl extends ExampleUsecase {
  final ExampleRepository _repository;

  ExampleUsecaseImpl(this._repository);

  @override
  Future<List<WeatherEntity>?> getWeather() async {
    final response = await _repository.getWeather();
    final weatherEntity = response.daily?.getWeatherEntites();
    return weatherEntity;
  }
}
