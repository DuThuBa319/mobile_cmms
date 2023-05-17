import 'package:injectable/injectable.dart';
import '../../../../data/data_source/remote/rest_api_repository/cause/employee_repository.dart';
import '../../../../data/data_source/remote/rest_api_repository/employee/employee_repository.dart';
import '../../../../data/data_source/remote/rest_api_repository/equipment/equipment_repository.dart';
import '../../../../data/data_source/remote/rest_api_repository/maintenance_request/maintenance_request_repository.dart';
import '../../../../data/models/cmms/equipment/equipment.dart';
import '../../../../data/models/cmms/maintenance_response/cause.dart';
import '../../../../data/models/cmms/maintenance_response/employee.dart';
import '../../../../data/models/cmms/maintenance_response/maintenance_request.dart';

part 'maintenance_request_repository.impl.dart';

abstract class MaintenanceRequestRepository {
  Future<List<Equipment>> getListEquipments();
  Future<List<Employee>> getListEmployees();
  Future<List<Cause>> getListCauses();
  Future<bool> createMaintenanceRequest({
    MaintenanceRequest? maintenanceRequest,
  });
}
