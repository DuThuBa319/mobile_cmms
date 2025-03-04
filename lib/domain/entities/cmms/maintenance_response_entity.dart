// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/cmms/cmms_enum.dart';
import '../../../data/models/cmms/maintenance_response/maintenance_request.dart';
import 'cause_entity.dart';
import 'correction_entity.dart';
import 'employee_entity.dart';
import 'equipment_entity.dart';
import 'inspection_report_entity.dart';
import 'material_entity.dart';
import 'mold_entity.dart';

class MaintenanceResponseEntity {
  String? id;
  DateTime? plannedStart;
  DateTime? plannedFinish;
  String? code;
  List<CauseEntity>? causeEntities;
  List<CorrectionEntity>? correctionEntities;
  int? estProcessTime;
  DateTime? actualStartTime;
  DateTime? actualFinishTime;
  MaintenanceStatus? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  EmployeeEntity? responsiblePerson;
  int? priority;
  String? problem;
  List<String>? images;
  List<String>? sounds;
  List<MaterialEntity>? materials;
  String? note;
  MaintenanceRequest? request;
  MaintenanceObject? maintenanceObject;
  EquipmentEntity? equipmentEntity;
  MoldEntity? moldEntity;
  DateTime? dueDate;
  MaintenanceType? type;
  List<InspectionReportEntity>? inspectionReportEntity;
  MaintenanceResponseEntity({
    this.id,
    this.plannedStart,
    this.plannedFinish,
    this.code,
    this.actualFinishTime,
    this.actualStartTime,
    this.causeEntities,
    this.correctionEntities,
    this.createdAt,
    this.equipmentEntity,
    this.estProcessTime,
    this.images,
    this.maintenanceObject,
    this.materials,
    this.moldEntity,
    this.note,
    this.priority,
    this.problem,
    this.request,
    this.responsiblePerson,
    this.sounds,
    this.status,
    this.updatedAt,
    this.dueDate,
    this.type,
    this.inspectionReportEntity,
  });

  Color get priorityColor {
    switch (priority) {
      case 4:
        return Colors.red;
      case 3:
        return Colors.orange;
      case 2:
        return const Color.fromARGB(255, 0, 137, 215);
      case 1:
        return const Color.fromARGB(255, 36, 161, 72);
      case 0:
        return const Color.fromARGB(255, 56, 215, 102);
      default:
        return Colors.black;
    }
  }

  String get priorityTxt {
    switch (priority) {
      case 4:
        return 'Rất cao';
      case 3:
        return 'Cao';
      case 2:
        return 'Vừa';
      case 1:
        return 'Thấp';
      case 0:
        return 'Rất thấp';
      default:
        return '--';
    }
  }

  Color get statusColor {
    switch (status) {
      case MaintenanceStatus.assigned:
        return Colors.grey;
      case MaintenanceStatus.inProgress:
        return const Color.fromARGB(255, 0, 137, 215);
      case MaintenanceStatus.completed:
        return const Color.fromARGB(255, 36, 161, 72);

      default:
        return Colors.black;
    }
  }

  String get statusTxt {
    switch (status) {
      case MaintenanceStatus.assigned:
        return 'Chuẩn bị';
      case MaintenanceStatus.inProgress:
        return 'Đang tiến hành';
      case MaintenanceStatus.completed:
        return 'Hoàn thành';

      default:
        return '--';
    }
  }

  String get maintenanceTask {
    if (type == MaintenanceType.preventiveInspection) {
      return 'Kiểm tra tổng quát';
    }
    if (maintenanceObject == MaintenanceObject.equipment) {
      return 'Sửa chữa';
    } else {
      return 'Thay khuôn';
    }
  }

  Widget get taskIcon {
    if (type == MaintenanceType.preventiveInspection) {
      return const Icon(
        Icons.description,
        size: 18,
        color: Colors.black,
      );
    }
    if (maintenanceObject == MaintenanceObject.equipment) {
      return const Icon(
        Icons.build,
        size: 18,
        color: Colors.black,
      );
    } else {
      return const Icon(
        Icons.invert_colors,
        size: 18,
        color: Colors.black,
      );
    }
  }

  String get updatedDate {
    updatedAt = DateTime.utc(
      updatedAt!.year,
      updatedAt!.month,
      updatedAt!.day,
      updatedAt!.hour,
      updatedAt!.minute,
      updatedAt!.second,
    );

    return DateFormat('HH:mm dd/MM/yyyy').format(updatedAt!.toLocal());
  }

  String get actualStartDate {
    if (actualStartTime != null) {
      actualStartTime = DateTime.utc(
        actualStartTime!.year,
        actualStartTime!.month,
        actualStartTime!.day,
        actualStartTime!.hour,
        actualStartTime!.minute,
        actualStartTime!.second,
      );
      return DateFormat('HH:mm dd/MM/yyyy').format(actualStartTime!.toLocal());
    } else {
      return '--';
    }
  }

  String get actualFinishDate {
    if (actualFinishTime != null) {
      actualFinishTime = DateTime.utc(
        actualFinishTime!.year,
        actualFinishTime!.month,
        actualFinishTime!.day,
        actualFinishTime!.hour,
        actualFinishTime!.minute,
        actualFinishTime!.second,
      );
      return DateFormat('HH:mm dd/MM/yyyy').format(actualFinishTime!.toLocal());
    } else {
      return '--';
    }
  }

  String get searchDate {
    if (updatedAt != null) {
      updatedAt = DateTime.utc(
        updatedAt!.year,
        updatedAt!.month,
        updatedAt!.day,
        updatedAt!.hour,
        updatedAt!.minute,
        updatedAt!.second,
      );
      return DateFormat('dd/MM/yyyy').format(updatedAt!.toLocal());
    } else {
      return '--';
    }
  }

  String get maintenanceType {
    switch (type) {
      case MaintenanceType.preventive:
      case MaintenanceType.preventiveInspection:
        return 'Đã lên lịch';
      case MaintenanceType.reactive:
        return 'Khắc phục';
      default:
        return '--';
    }
  }

  String get objectCode {
    if (equipmentEntity == null) {
      return moldEntity!.code!;
    }
    if (equipmentEntity != null) {
      return equipmentEntity!.code!;
    }
    return '--';
  }
}
