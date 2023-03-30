import 'package:flutter/material.dart';

import '../../../../common_widget/export.dart';
import '../../../../custom/custom_screen_form.dart';
import 'repair_task_view.dart';

class RepairTaskScreen extends StatefulWidget {
  const RepairTaskScreen({super.key, this.title});
  final String? title;
  @override
  State<RepairTaskScreen> createState() => _RepairTaskScreenState();
}

class _RepairTaskScreenState extends State<RepairTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreenForm(
      title: widget.title,
      child: const RepairTaskView(),
    );
  }
}

DropdownController<String, DropdownData<String>> problemController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'Máy không hoạt động', validation: null),
);
DropdownController<String, DropdownData<String>> causeController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'Gãy ty lói', validation: null),
);
DropdownController<String, DropdownData<String>> correctionController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'Thay thế phụ kiện', validation: null),
);
DropdownController<String, DropdownData<String>> sparePartController =
    DropdownController<String, DropdownData<String>>(
  value: DropdownData(value: 'Ty lói tròn phi 8 dài 20cm', validation: null),
);
List<String> problem = const ['Máy không hoạt động', 'HT1', 'HT2'];
List<String> cause = const ['Gãy ty lói', 'NN1', 'NN2'];
List<String> correction = const ['Thay thế phụ kiện', 'PA1', 'PA2'];
List<String> sparePart = const ['Ty lói tròn phi 8 dài 20cm', 'LK1', 'LK2'];
