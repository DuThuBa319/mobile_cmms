// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class WorkOrderEntity {
  int? id;
  String? deviceName;
  String? timeUpdate;
  String? level;
  String? status;
  String? task;
  MaintenanceType? maintenanceType;
  WorkOrderEntity({
    this.id,
    this.deviceName,
    this.level,
    this.status,
    this.timeUpdate,
    this.task,
    this.maintenanceType,
  });
  Color get LevelColor {
    switch (level) {
      case 'Rất cao':
        return Colors.red;
      case 'Cao':
        return Colors.orange;
      case 'Vừa':
        return const Color.fromARGB(255, 0, 137, 215);
      case 'Thấp':
        return const Color.fromARGB(255, 36, 161, 72);
      case 'Rất thấp':
        return const Color.fromARGB(255, 56, 215, 102);
      default:
        return Colors.black;
    }
  }

  Color get StatusColor {
    switch (status) {
      case 'Chuẩn bị':
        return Colors.grey;
      case 'Đang tiến hành':
        return const Color.fromARGB(255, 0, 137, 215);
      case 'Hoàn thành':
        return const Color.fromARGB(255, 36, 161, 72);
      default:
        return Colors.black;
    }
  }
}

enum MaintenanceType { corrective, preventive, predictive }
