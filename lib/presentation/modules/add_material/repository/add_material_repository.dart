import 'package:injectable/injectable.dart';
import '../../../../data/data_source/remote/rest_api_repository/cause/cause_repository.dart';
import '../../../../data/data_source/remote/rest_api_repository/employee/employee_repository.dart';
import '../../../../data/data_source/remote/rest_api_repository/equipment/equipment_repository.dart';
import '../../../../data/data_source/remote/rest_api_repository/maintenance_request/maintenance_request_repository.dart';
import '../../../../data/data_source/remote/rest_api_repository/material/material_info_repository.dart';
import '../../../../data/data_source/remote/rest_api_repository/material/material_repository.dart';
import '../../../../data/models/cmms/equipment/equipment.dart';
import '../../../../data/models/cmms/maintenance_response/cause.dart';
import '../../../../data/models/cmms/maintenance_response/employee.dart';
import '../../../../data/models/cmms/material/material_info.dart';
import '../../../../data/models/cmms/post/create_material.dart';
import '../../../../data/models/cmms/post/create_request.dart';

part 'add_material_repository.impl.dart';

abstract class AddMaterialRepository {
  Future<List<MaterialInfo>> getListMaterialInfo();
  Future<bool> createMaterial({
    CreateMaterial? createMaterial,
  });
}
