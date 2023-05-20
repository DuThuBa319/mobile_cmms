import '../../../../models/cmms/post/create_request.dart';

abstract class RequestRepository {
  Future<bool> createMaintenanceRequest({
    CreateRequest? createRequest,
  });
}
