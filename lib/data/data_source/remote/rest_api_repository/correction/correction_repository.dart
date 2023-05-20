import '../../../../models/cmms/correction.dart';

abstract class CorrectionRepository {
  Future<List<Correction>> getListCorrections();
}
