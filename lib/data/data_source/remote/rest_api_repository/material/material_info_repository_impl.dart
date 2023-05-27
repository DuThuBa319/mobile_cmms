import 'package:injectable/injectable.dart';

import '../../../../models/cmms/material/material_info.dart';
import '../../../data_repository.dart';
import 'material_info_repository.dart';

@Injectable(
  as: MaterialInfoRepository,
)
class MaterialInfoRepositoryImpl
    with DataRepository
    implements MaterialInfoRepository {
  @override
  Future<List<MaterialInfo>> getListMaterialInfo() {
    return cmmsApi.getListMaterialInfo();
  }
}
