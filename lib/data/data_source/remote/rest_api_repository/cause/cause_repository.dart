import '../../../../models/cmms/maintenance_response/cause.dart';

abstract class CauseRepository {
  Future<List<Cause>> getListCauses();
}
