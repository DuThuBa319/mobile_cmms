import 'package:injectable/injectable.dart';

import '../../../../models/cmms/equipment/equipment.dart';
import '../../../data_repository.dart';
import 'equipment_repository.dart';

@Injectable(
  as: EquipmentRepository,
)
class EquipmentRepositoryImpl
    with DataRepository
    implements EquipmentRepository {
  @override
  Future<List<Equipment>> getListEquipments() {
    return cmmsApi.getListEquipments();
  }
}
