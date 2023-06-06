part of 'response_usecase.dart';

@Injectable(
  as: ResponseUsecase,
)
class ResponseUsecaseImpl extends ResponseUsecase {
  final ResponseRepository _repository;

  ResponseUsecaseImpl(this._repository);

  @override
  Future<MaintenanceResponseEntity?> getMaintenanceResponse({
    required String responseId,
  }) async {
    final response =
        await _repository.getMaintenanceResponse(responseId: responseId);

    final responseEntity = response.getMaintenanceResponseItemEntity();

    return responseEntity;
  }

  @override
  Future<MaterialEntity?> getMaterialItem({
    required String sku,
  }) async {
    final response = await _repository.getMaterialItem(sku: sku);

    final responseEntity = response.getMaterialItemEntity();

    return responseEntity;
  }

  @override
  Future<void> updateMaintenanceResponse({
    required String maintenanceResponseId,
    required UpdateResponse updateResponse,
  }) async {
    await _repository.updateMaintenanceResponse(
      maintenanceResponseId: maintenanceResponseId,
      updateResponse: updateResponse,
    );
  }
}
