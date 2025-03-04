import 'package:injectable/injectable.dart';

import '../../../../data/models/cmms/put/update_response.dart';
import '../../../../domain/entities/cmms/maintenance_response_entity.dart';
import '../../../../domain/entities/cmms/material_entity.dart';
import '../repository/response_repository.dart';

part 'response_usecase.impl.dart';

abstract class ResponseUsecase {
  Future<MaintenanceResponseEntity?> getMaintenanceResponse({
    required String responseId,
  });
  Future<MaterialEntity?> getMaterialItem({
    required String sku,
  });
  Future<void> updateMaintenanceResponse({
    required String maintenanceResponseId,
    required UpdateResponse updateResponse,
  });
}
