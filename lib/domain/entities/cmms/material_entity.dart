// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../data/models/cmms/cmms_enum.dart';
import 'material_info_entity.dart';

class MaterialEntity {
  String? materialId;
  MaterialInfoEntity? materialInfoEntity;
  MaterialStatus? status;
  String? sku;

  MaterialEntity({
    this.materialId,
    this.materialInfoEntity,
    this.sku,
    this.status,
  });

  String get materialStatus {
    switch (status) {
      case MaterialStatus.available:
        return 'Có sẵn';
      case MaterialStatus.error:
        return 'Bị lỗi';
      case MaterialStatus.expired:
        return 'Hết hạn sử dụng';
      case MaterialStatus.inUsed:
        return 'Đang sử dụng';
      case MaterialStatus.missing:
        return 'Bị thất lạc';

      default:
        return '--';
    }
  }
}
