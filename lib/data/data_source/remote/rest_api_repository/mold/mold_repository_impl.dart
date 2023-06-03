import 'package:injectable/injectable.dart';

import '../../../../models/cmms/mold_info/mold.dart';
import '../../../data_repository.dart';
import 'mold_repository.dart';

@Injectable(
  as: MoldRepository,
)
class MoldRepositoryImpl with DataRepository implements MoldRepository {
  @override
  Future<List<Mold>> getListMolds() {
    return cmmsApi.getListMolds();
  }
}
