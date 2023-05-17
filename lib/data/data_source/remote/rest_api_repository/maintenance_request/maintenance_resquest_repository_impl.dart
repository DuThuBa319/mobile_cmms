import 'package:injectable/injectable.dart';

import '../../../../models/cmms/maintenance_response/maintenance_request.dart';
import '../../../data_repository.dart';
import 'maintenance_request_repository.dart';

@Injectable(
  as: RequestRepository,
)
class RequestRepositoryImpl with DataRepository implements RequestRepository {
  @override
  Future<bool> createMaintenanceRequest({
    MaintenanceRequest? maintenanceRequest,
  }) {
    return cmmsApi.createMaintenanceRequest(maintenanceRequest!);
  }
}
