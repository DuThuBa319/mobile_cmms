import 'package:injectable/injectable.dart';

import '../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../domain/entities/cmms/employee_entity.dart';
import '../../../../domain/entities/cmms/equipment_entity.dart';
import '../../../../domain/entities/cmms/material_info_entity.dart';
import '../repository/add_material_repository.dart';

part 'add_material_usecase.impl.dart';

abstract class AddMaterialUsecase {
  Future<List<MaterialInfoEntity>?> getListMaterialInfo();
}
