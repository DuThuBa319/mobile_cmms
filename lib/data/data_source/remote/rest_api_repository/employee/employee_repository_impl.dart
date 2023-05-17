import 'package:injectable/injectable.dart';

import '../../../../models/cmms/maintenance_response/employee.dart';
import '../../../data_repository.dart';
import 'employee_repository.dart';

@Injectable(
  as: EmployeeRepository,
)
class EmployeeRepositoryImpl with DataRepository implements EmployeeRepository {
  @override
  Future<List<Employee>> getListEmployees() {
    return cmmsApi.getListEmployees();
  }
}
