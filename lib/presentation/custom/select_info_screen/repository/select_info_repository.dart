import 'package:injectable/injectable.dart';
import '../../../../data/data_source/remote/rest_api_repository/cause/cause_repository.dart';
import '../../../../data/models/cmms/maintenance_response/cause.dart';

part 'select_info_repository.impl.dart';

abstract class SelectInfoRepository {
  Future<List<Cause>> getListCauses();
}
