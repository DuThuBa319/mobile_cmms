import 'package:injectable/injectable.dart';

import '../../../../domain/entities/cmms/cause_entity.dart';
import '../repository/select_info_repository.dart';

part 'select_info_usecase.impl.dart';

abstract class SelectInfoUsecase {
  Future<List<CauseEntity>?> getListCauses();
}
