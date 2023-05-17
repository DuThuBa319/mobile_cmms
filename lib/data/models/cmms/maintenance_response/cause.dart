import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/cmms/cause_entity.dart';

part 'cause.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Cause {
  @JsonKey(name: 'causeId')
  String? id;
  @JsonKey(name: 'causeCode')
  String? code;
  @JsonKey(name: 'causeName')
  String? name;
  String? note;
  String? severity;
//MaintenanceObject? maintenanceObject;
  Cause({
    this.code,
    this.id,
    this.name,
    this.note,
    this.severity,
    //   this.maintenanceObject,
  });

  List<CauseEntity> getListCauseEntity({
    required List<CauseEntity> list,
  }) {
    final result = CauseEntity(
      causeName: name,
    );
    list.add(result);

    return list;
  }

  factory Cause.fromJson(Map<String, dynamic> json) => _$CauseFromJson(json);

  Map<String, dynamic> toJson() => _$CauseToJson(this);
}
