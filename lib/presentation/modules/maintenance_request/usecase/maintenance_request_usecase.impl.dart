part of 'maintenance_request_usecase.dart';

@Injectable(
  as: MaintenanceRequestUsecase,
)
class MaintenanceRequestUsecaseImpl extends MaintenanceRequestUsecase {
  final MaintenanceRequestRepository _repository;

  MaintenanceRequestUsecaseImpl(this._repository);

  @override
  Future<List<EquipmentEntity>?> getListEquipments() async {
    final responses = await _repository.getListEquipments();

    var responseEntities = <EquipmentEntity>[];
    for (final response in responses) {
      responseEntities =
          response.getListEquipmentsEntity(list: responseEntities);
    }

    return responseEntities;
  }

  @override
  Future<List<MoldEntity>?> getListMolds() async {
    final responses = await _repository.getListMolds();

    var responseEntities = <MoldEntity>[];
    for (final response in responses) {
      responseEntities = response.getListMoldsEntity(list: responseEntities);
    }

    return responseEntities;
  }

  @override
  Future<List<EmployeeEntity>?> getListEmployees() async {
    final responses = await _repository.getListEmployees();

    var responseEntities = <EmployeeEntity>[];
    for (final response in responses) {
      responseEntities = response.getListEmployeeEntity(list: responseEntities);
    }

    return responseEntities;
  }

  @override
  Future<List<CauseEntity>?> getListCauses() async {
    final responses = await _repository.getListCauses();

    final responseEntities = <CauseEntity>[];
    for (final response in responses) {
      responseEntities.add(response.getCauseEntity());
    }

    return responseEntities;
  }
}
