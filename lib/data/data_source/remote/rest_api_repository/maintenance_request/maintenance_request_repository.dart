import '../../../../models/cmms/maintenance_response/maintenance_request.dart';

abstract class RequestRepository {
  Future<bool> createMaintenanceRequest({
    MaintenanceRequest? maintenanceRequest,
  });
}
