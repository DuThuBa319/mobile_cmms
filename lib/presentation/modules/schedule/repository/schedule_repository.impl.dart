// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'schedule_repository.dart';

@Injectable(
  as: ScheduleRepository,
)
class ScheduleRepositoryImpl extends ScheduleRepository {
  final WorkOrderApiRepository _mockApi;
  final MaintenanceResponseRepository _restApi;
  ScheduleRepositoryImpl(this._mockApi, this._restApi);
  @override
  Future<WorkOrderModel> getWorkOrder() {
    return _mockApi.getWorkOrder();
  }

  @override
  Future<WorkOrderModel> createWorkOrder({WorkOrderModel? newWorkOrder}) {
    return _mockApi.createWorkOrder(newWorkOrder: newWorkOrder!);
  }

  @override
  Future<List<MaintenanceResponse>> getListMaintenanceResponses() {
    return _restApi.getListMaintenanceResponses();
  }
}
