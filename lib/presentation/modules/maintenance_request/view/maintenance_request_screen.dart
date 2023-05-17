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
