part of 'response_usecase.dart';

@Injectable(
  as: ResponseUsecase,
)
class ResponseUsecaseImpl extends ResponseUsecase {
  final ResponseRepository _repository;

  ResponseUsecaseImpl(this._repository);

  @override
  Future<MaintenanceResponseEntity?> getMaintenanceResponse(
      {required String responseId}) async {
    final response =
        await _repository.getMaintenanceResponse(responseId: responseId);

    final responseEntity = response.getMaintenanceResponseItemEntity();

    return responseEntity;
  }
}
