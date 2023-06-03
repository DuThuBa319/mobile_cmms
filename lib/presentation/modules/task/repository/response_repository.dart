import 'package:injectable/injectable.dart';
import '../../../../data/data_source/remote/rest_api_repository/maintenance_response/maintenance_response_repository.dart';
import '../../../../data/data_source/remote/rest_api_repository/material/material_repository.dart';
import '../../../../data/models/cmms/maintenance_response/maintenance_response_item.dart';
import '../../../../data/models/cmms/material/material_item.dart';
import '../../../../data/models/cmms/put/update_response.dart';

part 'response_repository.impl.dart';

abstract class ResponseRepository {
  Future<MaintenanceResponseItem> getMaintenanceResponse({
    required String responseId,
  });
  // Future<void> updateMaintenanceResponse({
  //   required String maintenanceResponseId,
  //   required MaintenanceResponseItem maintenanceResponseItem,
  // });
  Future<void> updateMaintenanceResponse({
    required String maintenanceResponseId,
    required UpdateResponse updateResponse,
  });
  Future<MaterialItems> getMaterialItem({
    required String sku,
  });
}
