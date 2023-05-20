import 'package:injectable/injectable.dart';

import '../../../../models/cmms/correction.dart';
import '../../../data_repository.dart';
import 'correction_repository.dart';

@Injectable(
  as: CorrectionRepository,
)
class CorrectionRepositoryImpl
    with DataRepository
    implements CorrectionRepository {
  @override
  Future<List<Correction>> getListCorrections() {
    return cmmsApi.getListCorrections();
  }
}
