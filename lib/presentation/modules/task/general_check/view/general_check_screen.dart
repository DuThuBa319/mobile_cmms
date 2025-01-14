import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../data/models/cmms/cmms_enum.dart';
import '../../../../../domain/entities/cmms/inspection_report_entity.dart';
import '../../../../custom/custom_screen_form.dart';
import '../../../schedule/bloc/schedule_bloc.dart';
import '../bloc/general_check_bloc.dart';
import 'general_check_view.dart';

class GeneralCheckScreen extends StatefulWidget {
  const GeneralCheckScreen({
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
  State<GeneralCheckScreen> createState() => _GeneralCheckScreenState();
}

class _GeneralCheckScreenState extends State<GeneralCheckScreen> {
  static GetIt getIt = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeneralCheckBloc>(
          create: (context) => getIt<GeneralCheckBloc>(),
        ),
      ],
      child: CustomScreenForm(
        title: widget.title,
        child: GeneralCheckView(
          responseId: widget.responseId,
          scheduleBloc: widget.scheduleBloc,
          selectedDate: widget.selectedDate,
        ),
      ),
    );
  }
}

List<InspectionReportEntity> listWork = [
  InspectionReportEntity(
    group: 'KIỂM TRA ĐIỆN',
    name: 'Lên nguồn',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA ĐIỆN',
    name: 'Khởi động motor',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA ĐIỆN',
    name: 'Bơm lấy keo',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA ĐIỆN',
    name: 'Lói đẩy sản phẩm',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA ĐIỆN',
    name: 'Áp tốc nhiệt',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA ĐIỆN',
    name: 'Đóng mở khuôn',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA ĐIỆN',
    name: 'Đài tới lui',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CƠ',
    name: 'Âm thanh lạ',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CƠ',
    name: 'Trụ, ắc',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CƠ',
    name: 'Ma sát không cháy',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CƠ',
    name: 'Dầu bôi trơn',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CƠ',
    name: 'Thùng dầu',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CẢO NHIỆT',
    name: 'Vùng nhiệt 1',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CẢO NHIỆT',
    name: 'Vùng nhiệt 2',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CẢO NHIỆT',
    name: 'Vùng nhiệt 3',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CẢO NHIỆT',
    name: 'Vùng nhiệt 4',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CẢO NHIỆT',
    name: 'Vùng nhiệt 5',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CẢO NHIỆT',
    name: 'Cảo bơm keo',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CẢO NHIỆT',
    name: 'Giữ keo',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
  InspectionReportEntity(
    group: 'KIỂM TRA CẢO NHIỆT',
    name: 'Lòn keo',
    isRequest: false,
    status: PreventiveInspectionStatus.uninspectable,
  ),
];

List<String> result = ['Đạt', 'Không đạt', 'Không kiểm tra'];
