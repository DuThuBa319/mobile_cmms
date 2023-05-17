import 'package:injectable/injectable.dart';

import '../../../../models/cmms/maintenance_response/maintenance_response.dart';
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
  Future<MaintenanceResponse> getMaintenanceResponse({
    required String maintenanceResponseId,
  }) {
    return cmmsApi.getMaintenanceResponse(
      maintenanceResponseId,
    );
  }
}
