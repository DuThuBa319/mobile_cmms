// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_screen_repository.dart';

@Injectable(
  as: MainScreenRepository,
)
class MainScreenRepositoryImpl extends MainScreenRepository {
  final MaintenanceResponseRepository _restApi;
  MainScreenRepositoryImpl(this._restApi);

  @override
  Future<List<MaintenanceResponse>> getListMaintenanceResponses() {
    return _restApi.getListMaintenanceResponses();
  }
}
