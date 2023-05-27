import '../../../../models/cmms/post/create_material.dart';

abstract class MaterialRepository {
  Future<bool> createMaterial({
    CreateMaterial? createMaterial,
  });
}
