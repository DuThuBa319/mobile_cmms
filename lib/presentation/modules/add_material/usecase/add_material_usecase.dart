import 'package:injectable/injectable.dart';

import '../../../../data/models/cmms/post/create_material.dart';
import '../../../../domain/entities/cmms/material_info_entity.dart';
import '../repository/add_material_repository.dart';

part 'add_material_usecase.impl.dart';

abstract class AddMaterialUsecase {
  Future<List<MaterialInfoEntity>?> getListMaterialInfo();
  Future<bool> createMaterial({
    CreateMaterial? createMaterial,
  });
}
