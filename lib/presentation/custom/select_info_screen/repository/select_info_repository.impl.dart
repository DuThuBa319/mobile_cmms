// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'select_info_repository.dart';

@Injectable(
  as: SelectInfoRepository,
)
class SelectInfoRepositoryImpl extends SelectInfoRepository {
  final CauseRepository _causeApi;
  final CorrectionRepository _correctionApi;
  SelectInfoRepositoryImpl(this._causeApi, this._correctionApi);

  @override
  Future<List<Cause>> getListCauses() {
    return _causeApi.getListCauses();
  }

  @override
  Future<List<Correction>> getListCorrections() {
    return _correctionApi.getListCorrections();
  }
}
