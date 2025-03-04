part of 'schedule_usecase.dart';

@Injectable(
  as: ScheduleUsecase,
)
class ScheduleUsecaseImpl extends ScheduleUsecase {
  final ScheduleRepository _repository;

  ScheduleUsecaseImpl(this._repository);

  @override
  Future<List<WorkOrderEntity>?> getWorkOrder({
    String dateRequest = 'Get all',
    String maintenanceTypeRequest = 'Get all',
  }) async {
    final response = await _repository.getWorkOrder();
    final scheduleEntity = response.getWorkOrderEntities(
      dataRequest: dateRequest,
      maintenanceTypeRequest: maintenanceTypeRequest,
    );
    return scheduleEntity;
  }

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
