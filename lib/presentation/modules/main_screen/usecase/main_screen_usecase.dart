import 'package:injectable/injectable.dart';

import '../../../../domain/entities/cmms/maintenance_response_entity.dart';
import '../../../../domain/entities/work_order_entity.dart';
import '../repository/main_screen_repository.dart';

part 'main_screen_usecase.impl.dart';

abstract class MainScreenUsecase {
  Future<List<MaintenanceResponseEntity>?> getListMaintenanceResponse();
}
