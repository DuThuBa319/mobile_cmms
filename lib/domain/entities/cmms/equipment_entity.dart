// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../data/models/cmms/cmms_enum.dart';

class EquipmentEntity {
  String? name;
  String? code;
  EquipmentType? type;

  EquipmentEntity({
    this.name,
    this.code,
    this.type,
  });

  String get equipmentType {
    switch (type) {
      case EquipmentType.bigInjection:
        return 'Máy ép lớn';
      case EquipmentType.smallInjection:
        return 'Máy ép nhỏ';
      default:
        return '--';
    }
  }
}
