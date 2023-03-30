import 'package:injectable/injectable.dart';

import '../../../../models/mock_work_order/work_order_model.dart';
import '../../../data_repository.dart';
import 'work_order_api_repository.dart';

@Injectable(
  as: WorkOrderApiRespository,
)
class WorkOrderApiRespositoryImpl
    with DataRepository
    implements WorkOrderApiRespository {
  @override
  Future<WorkOrderModel> getWorkOrder({
    String key = 'd1b5eef0',
  }) {
    return mockApi.getWorkOrder(
      key,
    );
  }
}
