import '../../../../models/cmms/maintenance_response/employee.dart';

abstract class EmployeeRepository {
  Future<List<Employee>> getListEmployees();
}
