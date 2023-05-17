part of 'main_screen_usecase.dart';

@Injectable(
  as: MainScreenUsecase,
)
class MainScreenUsecaseImpl extends MainScreenUsecase {
  final MainScreenRepository _repository;

  MainScreenUsecaseImpl(this._repository);

  @override
  Future<List<MaintenanceResponseEntity>?> getListMaintenanceResponse() async {
    final responses = await _repository.getListMaintenanceResponses();

    var responseEntities = <MaintenanceResponseEntity>[];
    for (final response in responses) {
      responseEntities =
          response.getListMaintenanceResponseEntity(list: responseEntities);
    }

    return responseEntities;
  }
}
