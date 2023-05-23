part of 'select_info_usecase.dart';

@Injectable(
  as: SelectInfoUsecase,
)
class SelectInfoUsecaseImpl extends SelectInfoUsecase {
  final SelectInfoRepository _repository;

  SelectInfoUsecaseImpl(this._repository);

  @override
  Future<List<CauseEntity>?> getListCauses() async {
    final responses = await _repository.getListCauses();

    final responseEntities = <CauseEntity>[];
    for (final response in responses) {
      responseEntities.add(response.getCauseEntity());
    }

    return responseEntities;
  }

  @override
  Future<List<CorrectionEntity>?> getListCorrections() async {
    final responses = await _repository.getListCorrections();

    final responseEntities = <CorrectionEntity>[];
    for (final response in responses) {
      responseEntities.add(response.getCorrectionEntity());
    }

    return responseEntities;
  }
}
