import 'package:injectable/injectable.dart';

import '../../../../models/cmms/maintenance_response/maintenance_response.dart';
import '../../../../models/cmms/maintenance_response/maintenance_response_item.dart';
import '../../../../models/cmms/put/update_response.dart';
import '../../../data_repository.dart';
import 'maintenance_response_repository.dart';

@Injectable(
  as: MaintenanceResponseRepository,
)
class MaintenanceResponseRepositoryImpl
    with DataRepository
    implements MaintenanceResponseRepository {
  @override
  Future<List<MaintenanceResponse>> getListMaintenanceResponses() {
    return cmmsApi.getListMaintenanceResponses();
  }

  @override
  Future<MaintenanceResponseItem> getMaintenanceResponse({
    required String maintenanceResponseId,
  }) {
    return cmmsApi.getMaintenanceResponse(
      maintenanceResponseId,
    );
  }

  @override
  Future<void> updateMaintenanceResponse({
    required String maintenanceResponseId,
    required UpdateResponse updateResponse,
  }) async {
    await cmmsApi.updateMaintenanceResponse(
      maintenanceResponseId,
      updateResponse,
    );
  }
}
