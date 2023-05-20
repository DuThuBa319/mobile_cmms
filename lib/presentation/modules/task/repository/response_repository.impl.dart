// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'response_repository.dart';

@Injectable(
  as: ResponseRepository,
)
class ResponseRepositoryImpl extends ResponseRepository {
  final MaintenanceResponseRepository _restApi;
  ResponseRepositoryImpl(this._restApi);

  @override
  Future<MaintenanceResponseItem> getMaintenanceResponse({
    required String responseId,
  }) {
    return _restApi.getMaintenanceResponse(
      maintenanceResponseId: responseId,
    );
  }

  // @override
  // Future<void> updateMaintenanceResponse({
  //   required String maintenanceResponseId,
  //   required MaintenanceResponseItem maintenanceResponseItem,
  // }) async {
  //   await _restApi.updateMaintenanceResponse(
  //     maintenanceResponseId: maintenanceResponseId,
  //     maintenanceResponseItem: maintenanceResponseItem,
  //   );
  // }
  // @override
  // Future<void> updateMaintenanceResponse({
  //   required String maintenanceResponseId,
  //   required MaintenanceResponseItem maintenanceResponseItem,
  // }) async {
  //   await _restApi.updateMaintenanceResponse(
  //     maintenanceResponseId: maintenanceResponseId,
  //     maintenanceResponseItem: maintenanceResponseItem,
  //   );
  // }
  @override
  Future<void> updateMaintenanceResponse({
    required String maintenanceResponseId,
    required UpdateResponse updateResponse,
  }) async {
    await _restApi.updateMaintenanceResponse(
      maintenanceResponseId: maintenanceResponseId,
      updateResponse: updateResponse,
    );
  }
}
