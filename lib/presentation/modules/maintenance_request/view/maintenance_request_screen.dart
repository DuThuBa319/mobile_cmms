import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../common_widget/export.dart';
import '../../../custom/audio_picker/audio_picker_bloc/audio_picker_bloc.dart';
import '../../../custom/custom_screen_form.dart';
import '../../../custom/image_picker/image_picker_bloc/image_picker_bloc.dart';
import '../../../custom/select_info_screen/bloc/receive_info_selection_bloc/receive_info_selection_bloc.dart';
import '../../../custom/select_info_screen/bloc/select_info_bloc/select_info_bloc.dart';
import '../bloc/get_detail_bloc/get_request_info_bloc.dart';
import '../bloc/request_bloc/request_bloc.dart';
import 'maintenance_request_screen_view.dart';

class MaintenanceRequestScreen extends StatefulWidget {
  const MaintenanceRequestScreen({super.key});

  @override
  State<MaintenanceRequestScreen> createState() =>
      _MaintenanceRequestScreenState();
}

class _MaintenanceRequestScreenState extends State<MaintenanceRequestScreen> {
  static GetIt getIt = GetIt.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImagePickerBloc>(
          create: (context) => ImagePickerBloc(),
        ),
        BlocProvider<RequestBloc>(
          create: (context) => getIt<RequestBloc>(),
        ),
        BlocProvider<AudioPickerBloc>(
          create: (context) => AudioPickerBloc(),
        ),
        BlocProvider<GetRequestInfoBloc>(
          create: (context) => getIt<GetRequestInfoBloc>(),
        ),
        BlocProvider<SelectInfoBloc>(
          create: (context) => getIt<SelectInfoBloc>(),
        ),
        BlocProvider<ReceiveInfoSelectionBloc>(
          create: (context) => ReceiveInfoSelectionBloc(),
        ),
      ],
      child: CustomScreenForm(
        title: 'Gửi yêu cầu',
        isShowBottomAppBar: true,
        child: const MaintenanceRequestView(),
      ),
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
  'Kiểm tra tổng quát',
  'Dự đoán'
];
List<String> employee = const [
  '<Chọn KTV>',
];
