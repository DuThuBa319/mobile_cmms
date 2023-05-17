import 'package:injectable/injectable.dart';
import '../../../../data/data_source/remote/rest_api_repository/maintenance_response/maintenance_response_repository.dart';
import '../../../../data/data_source/remote/rest_api_repository/mock_work_order/work_order_api_repository.dart';
import '../../../../data/models/cmms/maintenance_response/maintenance_response.dart';
import '../../../../data/models/mock_work_order/work_order_model.dart';

part 'main_screen_repository.impl.dart';

abstract class MainScreenRepository {
  Future<List<MaintenanceResponse>> getListMaintenanceResponses();
}
