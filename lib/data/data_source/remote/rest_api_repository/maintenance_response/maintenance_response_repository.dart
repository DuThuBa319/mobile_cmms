import '../../../../models/cmms/maintenance_response/maintenance_response.dart';

abstract class MaintenanceResponseRepository {
  Future<List<MaintenanceResponse>> getListMaintenanceResponses();
  Future<MaintenanceResponse> getMaintenanceResponse({
    required String maintenanceResponseId,
  });
}
