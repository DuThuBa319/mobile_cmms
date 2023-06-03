import 'package:flutter/material.dart';

import '../../../common_widget/export.dart';
import '../../../custom/custom_screen_form.dart';
import 'maintenance_request_screen_view.dart';

class MaintenanceRequestScreen extends StatefulWidget {
  const MaintenanceRequestScreen({super.key});

  @override
  State<MaintenanceRequestScreen> createState() =>
      _MaintenanceRequestScreenState();
}

class _MaintenanceRequestScreenState extends State<MaintenanceRequestScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreenForm(
      title: 'Gửi yêu cầu',
      isShowBottomAppBar: true,
      child: const MaintenanceRequestView(),
    );
  }
}

DropdownController<String, DropdownData<String>> nullController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: '--', validation: null),
);
List<String> objectCodeSelection = const ['<Chọn mã thiết bị>'];
List<String> nullItems = const ['--'];
List<String> object = const ['Máy ép nhỏ', 'Máy ép lớn', 'Khuôn ép'];
List<int> prioritySelection = const [1, 2, 3, 4];
List<String> maintenanceTypeSelection = const [
  'Khắc phục',
  'Phòng ngừa',
  'Dự đoán'
];
List<String> employee = const [
  '<Chọn KTV>',
];
