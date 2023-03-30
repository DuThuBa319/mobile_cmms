import '../../../../models/mock_work_order/work_order_model.dart';

abstract class WorkOrderApiRespository {
  Future<WorkOrderModel> getWorkOrder({
    String key,
  });
}
