import 'package:injectable/injectable.dart';

import '../../../../data/models/cmms/post/create_request.dart';
import '../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../domain/entities/cmms/employee_entity.dart';
import '../../../../domain/entities/cmms/equipment_entity.dart';
import '../../../../domain/entities/cmms/mold_entity.dart';
import '../repository/maintenance_request_repository.dart';

part 'maintenance_request_usecase.impl.dart';

abstract class MaintenanceRequestUsecase {
  Future<List<EquipmentEntity>?> getListEquipments();
  Future<List<MoldEntity>?> getListMolds();
  Future<List<EmployeeEntity>?> getListEmployees();
  Future<List<CauseEntity>?> getListCauses();
  Future<bool> createMaintenanceRequest({
    CreateRequest? createRequest,
  });
}
