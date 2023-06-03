// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'response_repository.dart';

@Injectable(
  as: ResponseRepository,
)
class ResponseRepositoryImpl extends ResponseRepository {
  final MaintenanceResponseRepository _restApi;
  final MaterialRepository _materialApi;
  ResponseRepositoryImpl(this._restApi, this._materialApi);

  @override
  Future<MaintenanceResponseItem> getMaintenanceResponse({
    required String responseId,
  }) {
    return _restApi.getMaintenanceResponse(
      maintenanceResponseId: responseId,
    );
  }

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

  @override
  Future<MaterialItems> getMaterialItem({
    required String sku,
  }) {
    return _materialApi.getMaterialItem(
      sku: sku,
    );
  }
}
