// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../data/models/cmms/cmms_enum.dart';
import '../../../data/models/cmms/maintenance_response/inspection_report.dart';

class InspectionReportEntity {
  String? name;
  String? group;
  bool? isRequest;
  PreventiveInspectionStatus? status;

  InspectionReportEntity({
    this.name,
    this.group,
    this.status,
    this.isRequest,
  });
  InspectionReport getInspectionReport() {
    return InspectionReport(
      name: name,
      group: group,
      isRequest: isRequest,
      status: status,
    );
  }

  String get inspectionStatus {
    switch (status) {
      case PreventiveInspectionStatus.failed:
        return 'Không đạt';
      case PreventiveInspectionStatus.uninspectable:
        return 'Không kiểm tra';
      case PreventiveInspectionStatus.passed:
        return 'Đạt';
      default:
        return '--';
    }
  }
  // String get inspectionStatus {
  //   switch (status) {
  //     case 0:
  //       return 'Không đạt';
  //     case 2:
  //       return 'Không kiểm tra';
  //     case 1:
  //       return 'Đạt';
  //     default:
  //       return '--';
  //   }
  // }
}
