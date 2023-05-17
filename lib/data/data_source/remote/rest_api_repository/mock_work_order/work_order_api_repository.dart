import '../../../../models/mock_work_order/work_order_model.dart';

abstract class WorkOrderApiRepository {
  Future<WorkOrderModel> getWorkOrder({
    String key,
  });
  Future<WorkOrderModel> createWorkOrder({
    String method,
    String key,
    WorkOrderModel newWorkOrder,
  });
}
