import '../../../../models/cmms/mold_info/mold.dart';

abstract class MoldRepository {
  Future<List<Mold>> getListMolds();
}
