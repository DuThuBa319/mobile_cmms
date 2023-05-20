import 'package:injectable/injectable.dart';

import '../../../../models/cmms/post/create_request.dart';
import '../../../data_repository.dart';
import 'maintenance_request_repository.dart';

@Injectable(
  as: RequestRepository,
)
class RequestRepositoryImpl with DataRepository implements RequestRepository {
  @override
  Future<bool> createMaintenanceRequest({
    CreateRequest? createRequest,
  }) {
    return cmmsApi.createMaintenanceRequest(createRequest!);
  }
}
