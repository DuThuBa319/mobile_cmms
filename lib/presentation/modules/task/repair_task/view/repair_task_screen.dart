import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../common_widget/export.dart';
import '../../../../custom/audio_picker/audio_picker_bloc/audio_picker_bloc.dart';
import '../../../../custom/custom_screen_form.dart';
import '../../../../custom/image_picker/image_picker_bloc/image_picker_bloc.dart';

import '../../../../custom/select_info_screen/bloc/receive_info_selection_bloc/receive_info_selection_bloc.dart';
import '../../../../custom/select_info_screen/bloc/select_info_bloc/select_info_bloc.dart';
import '../../../schedule/bloc/schedule_bloc.dart';
import '../bloc/repair_task_bloc.dart';
import 'repair_task_view.dart';

class RepairTaskScreen extends StatefulWidget {
  const RepairTaskScreen({
    super.key,
    this.title,
    required this.responseId,
    this.scheduleBloc,
    this.selectedDate,
  });
  final String? title;
  final String responseId;
  final ScheduleBloc? scheduleBloc;
  final String? selectedDate;
  @override
  State<RepairTaskScreen> createState() => _RepairTaskScreenState();
}

class _RepairTaskScreenState extends State<RepairTaskScreen> {
  static GetIt getIt = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    return CustomScreenForm(
      title: widget.title,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RepairTaskBloc>(
            create: (context) => getIt<RepairTaskBloc>(),
          ),
          BlocProvider<ImagePickerBloc>(
            create: (context) => ImagePickerBloc(),
          ),
          BlocProvider<AudioPickerBloc>(
            create: (context) => AudioPickerBloc(),
          ),
          BlocProvider<SelectInfoBloc>(
            create: (context) => getIt<SelectInfoBloc>(),
          ),
          BlocProvider<ReceiveInfoSelectionBloc>(
            create: (context) => ReceiveInfoSelectionBloc(),
          ),
        ],
        child: RepairTaskView(
          responseId: widget.responseId,
          scheduleBloc: widget.scheduleBloc,
          selectedDate: widget.selectedDate,
        ),
      ),
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
