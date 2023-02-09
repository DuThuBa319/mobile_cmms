// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'example_repository.dart';

@Injectable(
  as: ExampleRepository,
)
class ExampleRepositoryImpl extends ExampleRepository {
  final WeatherApiRespository _resApi;
  ExampleRepositoryImpl(
    this._resApi,
  );
  @override
  Future<WeatherModel> getWeather() {
    return _resApi.getWeather();
  }
}
