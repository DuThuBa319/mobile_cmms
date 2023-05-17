import '../../../../models/cmms/equipment/equipment.dart';

abstract class EquipmentRepository {
  Future<List<Equipment>> getListEquipments();
}
