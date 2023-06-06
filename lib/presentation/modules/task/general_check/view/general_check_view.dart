import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/cmms/cmms_enum.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../../../../common_widget/export.dart';
import '../../../../common_widget/loading.dart';
import '../../../../custom/general_report_container.dart';
import '../../../../theme/theme_color.dart';
import '../../../schedule/bloc/schedule_bloc.dart';
import '../bloc/general_check_bloc.dart';
import 'general_check_screen.dart';
import 'general_check_widget.dart';
part 'general_check_view.action.dart';

class GeneralCheckView extends StatefulWidget {
  const GeneralCheckView({
    super.key,
    required this.responseId,
    this.scheduleBloc,
    this.selectedDate,
  });
  final String responseId;
  final ScheduleBloc? scheduleBloc;
  final String? selectedDate;
  @override
  State<GeneralCheckView> createState() => _GeneralCheckViewState();
}

class _GeneralCheckViewState extends StateBase<GeneralCheckView> {
  List<DropdownController<String, DropdownData<String>>>
      taskDropdownControllers = List.generate(
    20,
    (index) => DropdownController<String, DropdownData<String>>(
      value: DropdownData<String>(
        value: listWork[index].inspectionStatus,
        validation: null,
      ),
    ),
  );
  bool isInProgress = false;
  @override
  GeneralCheckBloc get bloc => BlocProvider.of(context);
  @override
  Widget buildBase(BuildContext context) {
    return BlocConsumer<GeneralCheckBloc, GeneralCheckState>(
      listener: _blocListener,
      builder: (context, state) {
        if (state is GeneralCheckInitialState) {
          bloc.add(
            GetMaintenanceResponseEvent(
              responseId: widget.responseId,
              inspectionReports: listWork,
            ),
          );
        }
        if (state is GetMaintenanceResponseState &&
            state.status == BlocStatusState.loading) {
          return const Center(
            child: Loading(
              brightness: Brightness.light,
            ),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GeneralReportContainer(
                  task: 'Kiểm tra tổng quát',
                  actualFinishTime:
                      state.viewModel.responseEntity?.actualFinishDate,
                  estProcessTime:
                      state.viewModel.responseEntity?.estProcessTime,
                  actualStartTime:
                      state.viewModel.responseEntity?.actualStartDate,
                  equipmentCode:
                      state.viewModel.responseEntity?.equipmentEntity?.code,
                ),
                RowTile(title: 'KIỂM TRA ĐIỆN:'),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: (state.viewModel.inspectionReports ?? []).length,
                  itemBuilder: (context, index) => CheckDropDown(
                    index: index,
                    checkState: state,
                    bloc: bloc,
                    taskDropdownControllers: taskDropdownControllers,
                  ),
                  separatorBuilder: (context, index) {
                    if (index == 6) {
                      return RowTile(isSeparate: true, title: 'KIỂM TRA CƠ');
                    }
                    if (index == 11) {
                      return RowTile(
                        isSeparate: true,
                        title: 'KIỂM TRA CẢO NHIỆT',
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 60),
                buildButton(
                  context,
                  state,
                  status: state.viewModel.responseEntity?.status,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildButton(
    BuildContext context,
    GeneralCheckState checkState, {
    required MaintenanceStatus? status,
  }) {
    if (status == MaintenanceStatus.assigned) {
      return Container(
        decoration: BoxDecoration(
          color: AppColor.blue0089D7,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 360,
        height: 70,
        child: TextButton(
          onPressed: () {
            bloc.add(StartTaskEvent());
          },
          child: Text(
            'Bắt đầu công việc',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      );
    }
    if (status == MaintenanceStatus.completed) {
      return Container(
        decoration: BoxDecoration(
          color: AppColor.blue0089D7,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 360,
        height: 70,
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Quay lại',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      );
    }
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: checkState.viewModel.isChanged
                ? AppColor.blue0089D7
                : AppColor.greyD9,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 360,
          height: 70,
          child: TextButton(
            onPressed: () {
              checkState.viewModel.isChanged
                  ? bloc.add(SaveChangeEvent())
                  : null;
            },
            child: Text(
              'Lưu',
              style: checkState.viewModel.isChanged
                  ? Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )
                  : Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 40),
          decoration: BoxDecoration(
            color: checkState.viewModel.isChanged
                ? AppColor.greyD9
                : AppColor.blue0089D7,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 360,
          height: 70,
          child: TextButton(
            onPressed: () {
              checkState.viewModel.isChanged
                  ? null
                  : bloc.add(FinishTaskEvent());
            },
            child: Text(
              'Kết thúc công việc',
              style: checkState.viewModel.isChanged
                  ? Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )
                  : Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
            ),
          ),
        )
      ],
    );
  }
}
