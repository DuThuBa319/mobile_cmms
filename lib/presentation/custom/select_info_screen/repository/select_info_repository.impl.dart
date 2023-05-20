// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'select_info_repository.dart';

@Injectable(
  as: SelectInfoRepository,
)
class SelectInfoRepositoryImpl extends SelectInfoRepository {
  final CauseRepository _causeApi;

  SelectInfoRepositoryImpl(
    this._causeApi,
  );

  @override
  Future<List<Cause>> getListCauses() {
    return _causeApi.getListCauses();
  }
}
