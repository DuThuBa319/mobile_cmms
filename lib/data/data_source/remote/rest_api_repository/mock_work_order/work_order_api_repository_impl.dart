import 'package:injectable/injectable.dart';

import '../../../../models/mock_work_order/work_order_model.dart';
import '../../../data_repository.dart';
import 'work_order_api_repository.dart';

@Injectable(
  as: WorkOrderApiRepository,
)
class WorkOrderApiRepositoryImpl
    with DataRepository
    implements WorkOrderApiRepository {
  @override
  Future<WorkOrderModel> getWorkOrder({
    String key = 'd1b5eef0',
  }) {
    return mockApi.getWorkOrder(
      key,
    );
  }

  @override
  Future<WorkOrderModel> createWorkOrder({
    String key = 'd1b5eef0',
    String method = 'POST',
    WorkOrderModel? newWorkOrder,
  }) {
    return mockApi.createWorkOrder(
      key,
      method,
      newWorkOrder!,
    );
  }
}
