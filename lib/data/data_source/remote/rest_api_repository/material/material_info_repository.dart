import '../../../../models/cmms/material/material_info.dart';

abstract class MaterialInfoRepository {
  Future<List<MaterialInfo>> getListMaterialInfo();
}
