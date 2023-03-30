import 'package:injectable/injectable.dart';
import '../../../../data/data_source/remote/rest_api_repository/mock_work_order/work_order_api_repository.dart';
import '../../../../data/models/mock_work_order/work_order_model.dart';

part 'schedule_repository.impl.dart';

abstract class ScheduleRepository {
  Future<WorkOrderModel> getWorkOrder();
}
