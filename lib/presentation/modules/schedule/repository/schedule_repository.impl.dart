// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'schedule_repository.dart';

@Injectable(
  as: ScheduleRepository,
)
class ScheduleRepositoryImpl extends ScheduleRepository {
  final WorkOrderApiRespository _mockApi;
  ScheduleRepositoryImpl(
    this._mockApi,
  );
  @override
  Future<WorkOrderModel> getWorkOrder() {
    return _mockApi.getWorkOrder();
  }
}
