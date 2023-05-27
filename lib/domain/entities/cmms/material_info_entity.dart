// ignore_for_file: public_member_api_docs, sort_constructors_first

class MaterialInfoEntity {
  String? code;
  String? name;
  String? unit;
  double? minimumQuantity;
//  String? note;
  String? materialInforId;
//  List<Map<String, String>>? specs;

  MaterialInfoEntity({
    this.materialInforId,
    this.code,
    this.minimumQuantity,
    this.name,
    //   this.note,
    //   this.specs,
    this.unit,
  });
}
