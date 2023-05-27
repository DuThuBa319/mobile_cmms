// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_material_repository.dart';

@Injectable(
  as: AddMaterialRepository,
)
class AddMaterialRepositoryImpl extends AddMaterialRepository {
  final MaterialRepository _materialApi;
  final MaterialInfoRepository _materialInfoApi;
  AddMaterialRepositoryImpl(
    this._materialApi,
    this._materialInfoApi,
  );

  @override
  Future<List<MaterialInfo>> getListMaterialInfo() {
    return _materialInfoApi.getListMaterialInfo();
  }

  @override
  Future<bool> createMaterial({
    CreateMaterial? createMaterial,
  }) {
    return _materialApi.createMaterial(
      createMaterial: createMaterial,
    );
  }
}
