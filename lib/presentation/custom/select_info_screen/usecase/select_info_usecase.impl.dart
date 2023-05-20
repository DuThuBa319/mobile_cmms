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

    var responseEntities = <CauseEntity>[];
    for (final response in responses) {
      responseEntities.add(response.getCauseEntity());
    }

    return responseEntities;
  }
}
