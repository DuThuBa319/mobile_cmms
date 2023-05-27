import 'package:injectable/injectable.dart';

import '../../../../models/cmms/post/create_material.dart';
import '../../../data_repository.dart';
import 'material_repository.dart';

@Injectable(
  as: MaterialRepository,
)
class MaterialRepositoryImpl with DataRepository implements MaterialRepository {
  @override
  Future<bool> createMaterial({
    CreateMaterial? createMaterial,
  }) {
    return cmmsApi.createMaterial(createMaterial!);
  }
}
