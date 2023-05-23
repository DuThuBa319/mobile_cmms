class CorrectionEntity {
  String? id;

  String? code;

  String? name;

  int? estProcessTime;
  String? note;

  CorrectionEntity({
    this.code,
    this.estProcessTime,
    this.id,
    this.name,
    this.note,
  });
}
