import 'package:injectable/injectable.dart';

import '../../../../models/cmms/maintenance_response/cause.dart';
import '../../../data_repository.dart';
import 'cause_repository.dart';

@Injectable(
  as: CauseRepository,
)
class CauseRepositoryImpl with DataRepository implements CauseRepository {
  @override
  Future<List<Cause>> getListCauses() {
    return cmmsApi.getListCauses();
  }
}
