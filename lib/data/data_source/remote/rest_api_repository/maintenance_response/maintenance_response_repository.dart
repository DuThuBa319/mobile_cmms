import '../../../../models/cmms/maintenance_response/maintenance_response.dart';
import '../../../../models/cmms/maintenance_response/maintenance_response_item.dart';
import '../../../../models/cmms/put/update_response.dart';

abstract class MaintenanceResponseRepository {
  Future<List<MaintenanceResponse>> getListMaintenanceResponses();
  Future<MaintenanceResponseItem> getMaintenanceResponse({
    required String maintenanceResponseId,
  });
  Future<void> updateMaintenanceResponse({
    required String maintenanceResponseId,
    required UpdateResponse updateResponse,
  });
}
