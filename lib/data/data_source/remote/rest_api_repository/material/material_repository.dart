import '../../../../models/cmms/material/material_item.dart';
import '../../../../models/cmms/post/create_material.dart';

abstract class MaterialRepository {
  Future<bool> createMaterial({
    CreateMaterial? createMaterial,
  });
  Future<MaterialItems> getMaterialItem({
    required String sku,
  });
}
