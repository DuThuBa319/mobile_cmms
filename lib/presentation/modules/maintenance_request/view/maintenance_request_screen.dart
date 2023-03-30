import 'package:flutter/material.dart';

import '../../../common_widget/export.dart';
import '../../../custom/custom_screen_form.dart';
import 'maintenace_request_screen_view.dart';

class MaintenanceRequestScreen extends StatefulWidget {
  const MaintenanceRequestScreen({super.key});

  @override
  State<MaintenanceRequestScreen> createState() =>
      _MaintenanceRequestScreenState();
}

class _MaintenanceRequestScreenState extends State<MaintenanceRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreenForm(
      title: 'Gửi yêu cầu',
      isShowBottomAppBar: true,
      child: const MaintenanceRequestView(),
    );
  }
}

DropdownController<String, DropdownData<String>> equipmentController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'Máy ép nhỏ', validation: null),
);
DropdownController<String, DropdownData<String>> problemController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'Sản phẩm bị lỗi', validation: null),
);
DropdownController<String, DropdownData<String>> moldCodeController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'M037', validation: null),
);
DropdownController<String, DropdownData<String>> priorityController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'Rất cao', validation: null),
);
DropdownController<String, DropdownData<String>> equipmentCodeController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'M39', validation: null),
);
DropdownController<String, DropdownData<String>> moldNameController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'Nút 2 nhấn oval F1 mộc', validation: null),
);
DropdownController<String, DropdownData<String>> detailController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'Giáp mí', validation: null),
);
DropdownController<String, DropdownData<String>> approvedPriorityController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'Rất cao', validation: null),
);
List<String> equipment = const ['Máy ép nhỏ', 'Máy ép lớn', 'Khuôn ép'];
List<String> problem = const ['Sản phẩm bị lỗi', 'NN1', 'NN2'];
List<String> moldCode = const ['M037'];
List<String> priority = const ['Rất cao', 'Cao', 'Vừa', 'Thấp'];
List<String> equipmentCode = const ['M39', 'M37', 'M41'];
List<String> detail = const ['Giáp mí', 'NN1', 'NN2'];
List<String> moldName = const ['Nút 2 nhấn oval F1 mộc'];
List<String> approvedPriority = const ['Rất cao', 'Cao', 'Vừa', 'Thấp'];
