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

    final responseEntities = <MaintenanceResponseEntity>[];
    for (var response in responses) {
      responseEntities.add(response.getMaintenanceResponseEntity());
    }

    return responseEntities;
  }
}
