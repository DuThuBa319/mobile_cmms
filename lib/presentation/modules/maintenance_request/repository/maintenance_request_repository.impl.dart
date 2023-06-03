// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'maintenance_request_repository.dart';

@Injectable(
  as: MaintenanceRequestRepository,
)
class MaintenanceRequestRepositoryImpl extends MaintenanceRequestRepository {
  final EquipmentRepository _equipmentApi;
  final EmployeeRepository _employeeApi;
  final CauseRepository _causeApi;
  final RequestRepository _requestApi;
  final MoldRepository _moldApi;
  MaintenanceRequestRepositoryImpl(
    this._equipmentApi,
    this._employeeApi,
    this._causeApi,
    this._requestApi,
    this._moldApi,
  );

  @override
  Future<List<Equipment>> getListEquipments() {
    return _equipmentApi.getListEquipments();
  }

  @override
  Future<List<Mold>> getListMolds() {
    return _moldApi.getListMolds();
  }

  @override
  Future<List<Employee>> getListEmployees() {
    return _employeeApi.getListEmployees();
  }

  @override
  Future<List<Cause>> getListCauses() {
    return _causeApi.getListCauses();
  }

  @override
  Future<bool> createMaintenanceRequest({
    CreateRequest? createRequest,
  }) {
    return _requestApi.createMaintenanceRequest(
      createRequest: createRequest,
    );
  }
}
