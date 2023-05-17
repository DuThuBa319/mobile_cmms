import 'package:injectable/injectable.dart';

import '../../../../data/models/mock_work_order/work_order_model.dart';
import '../../../../domain/entities/cmms/maintenance_response_entity.dart';
import '../../../../domain/entities/work_order_entity.dart';
import '../bloc/schedule_bloc.dart';
import '../repository/schedule_repository.dart';

part 'schedule_usecase.impl.dart';

abstract class ScheduleUsecase {
  Future<List<WorkOrderEntity>?> getWorkOrder({
    String dateRequest,
    String maintenanceTypeRequest,
  });
  Future<List<MaintenanceResponseEntity>?> getListMaintenanceResponse();
}
