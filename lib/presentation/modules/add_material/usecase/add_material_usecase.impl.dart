part of 'add_material_usecase.dart';

@Injectable(
  as: AddMaterialUsecase,
)
class AddMaterialUsecaseImpl extends AddMaterialUsecase {
  final AddMaterialRepository _repository;

  AddMaterialUsecaseImpl(this._repository);

  @override
  Future<List<MaterialInfoEntity>?> getListMaterialInfo() async {
    final responses = await _repository.getListMaterialInfo();

    final responseEntities = <MaterialInfoEntity>[];
    for (final response in responses) {
      responseEntities.add(response.getMaterialInfoEntity());
    }

    return responseEntities;
  }
}
