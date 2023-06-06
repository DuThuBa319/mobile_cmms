import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/cmms/cmms_enum.dart';
import '../../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../../domain/entities/cmms/correction_entity.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../../../../common_widget/export.dart';
import '../../../../custom/audio_picker/audio_picker_bloc/audio_picker_bloc.dart';
import '../../../../custom/audio_picker/audio_picker_widget.dart';
import '../../../../custom/general_report_container.dart';
import '../../../../custom/image_picker/image_picker_bloc/image_picker_bloc.dart';
import '../../../../custom/image_picker/image_picker_widget.dart';
import '../../../../custom/select_info_screen/bloc/receive_info_selection_bloc/receive_info_selection_bloc.dart';
import '../../../../custom/select_info_screen/bloc/select_info_bloc/select_info_bloc.dart';
import '../../../../custom/select_info_screen/view/select_info_dropdown.dart';
import '../../../../custom/select_info_screen/view/select_info_screen.dart';
import '../../../../theme/theme_color.dart';
import '../../../schedule/bloc/schedule_bloc.dart';
import '../bloc/repair_task_bloc.dart';
part 'repair_task.action.dart';

class RepairTaskView extends StatefulWidget {
  const RepairTaskView({
    super.key,
    required this.responseId,
    this.scheduleBloc,
    this.selectedDate,
  });
  final String responseId;
  final ScheduleBloc? scheduleBloc;
  final String? selectedDate;

  @override
  State<RepairTaskView> createState() => _RepairTaskViewState();
}

class _RepairTaskViewState extends StateBase<RepairTaskView> {
  late String textController;

  bool isInProgress = false;
  List<CauseEntity> listCauseSelected = [];
  List<CorrectionEntity> listCorrectionSelected = [];
  List<MaterialMenuItem> materialItems = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  RepairTaskBloc get bloc => BlocProvider.of(context);
  ImagePickerBloc get imageBloc => BlocProvider.of(context);
  SelectInfoBloc get selectInfoBloc => BlocProvider.of(context);
  AudioPickerBloc get audioBloc => BlocProvider.of(context);
  ReceiveInfoSelectionBloc get receiveBloc => BlocProvider.of(context);
  @override
  Widget buildBase(BuildContext context) {
    final quantity = TextEditingController();
    final bodyTextStyle = Theme.of(context).textTheme.bodyMedium;
    return BlocConsumer<RepairTaskBloc, RepairTaskState>(
      listener: _blocListener,
      builder: (context, state) {
        if (state is RepairTaskInitialState) {
          bloc.add(GetMaintenanceResponseEvent(responseId: widget.responseId));
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralReportContainer(
                task: 'Sửa chữa',
                actualFinishTime:
                    state.viewModel.responseEntity?.actualFinishDate,
                estProcessTime: state.viewModel.responseEntity?.estProcessTime,
                actualStartTime:
                    state.viewModel.responseEntity?.actualStartDate,
                equipmentCode:
                    state.viewModel.responseEntity?.equipmentEntity?.code,
              ),
              Wrap(
                spacing: 5,
                direction: Axis.vertical,
                children: [
                  Text(
                    'CHẨN ĐOÁN, PHƯƠNG ÁN',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColor.gray767676),
                  ),
                  Text(
                    'Hiện tượng: ',
                    style: bodyTextStyle,
                  ),
                  Container(
                    width: 378,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    padding: const EdgeInsets.fromLTRB(12, 9, 16, 10),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColor.gray767676, width: 0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemBuilder('--', textColor: AppColor.gray767676),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColor.gray767676,
                        )
                      ],
                    ),
                  ),

                  BlocConsumer<ReceiveInfoSelectionBloc,
                      ReceiveInfoSelectionState>(
                    bloc: receiveBloc,
                    listener: _receiveBlocListener,
                    builder: (context, receiveState) {
                      if (receiveState is LoadFileState &&
                          receiveState.status == BlocStatusState.success) {
                        imageBloc.add(
                          LoadImageEvent(
                            imageFiles: receiveState.viewModel.imageFiles,
                          ),
                        );
                        audioBloc.add(
                          LoadAudioEvent(
                            audioFiles: receiveState.viewModel.audioFiles,
                          ),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nguyên nhân: ',
                            style: bodyTextStyle,
                          ),
                          InfoSelectionDropdown(
                            bloc: receiveBloc,
                            state: receiveState,
                            selectInfoBloc: selectInfoBloc,
                            enable: isInProgress,
                            infoType: InfoType.Cause,
                          ),
                          Text(
                            'Phương án sữa chữa: ',
                            style: bodyTextStyle,
                          ),
                          InfoSelectionDropdown(
                            bloc: receiveBloc,
                            state: receiveState,
                            selectInfoBloc: selectInfoBloc,
                            enable: isInProgress,
                            infoType: InfoType.Correction,
                          ),
                        ],
                      );
                    },
                  ),

                  //-------------------------------------------------//

                  const SizedBox(height: 10),
                ],
              ),
              //-------------------------------------------------//
              Container(
                width: 378,
                height: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LINH KIỆN: ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColor.gray767676),
                    ),
                    TextButton(
                      onPressed: scanQR,
                      child: Text(
                        'Quét SKU',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: state.viewModel.responseEntity?.status ==
                                      MaintenanceStatus.inProgress
                                  ? AppColor.blue0089D7
                                  : AppColor.gray767676,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
//state.viewModel.materialMenuItems?
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: materialItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: AppColor.greyF3,
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    width: 380,
                    constraints: const BoxConstraints(
                      maxHeight: double.infinity,
                      minHeight: 83,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 17, top: 8),
                          width: 380,
                          height: 37,
                          color: AppColor.greyD9,
                          child: Text(
                            materialItems[index].name,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.only(left: 17, top: 5),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: materialItems[index].listSku.length,
                          itemBuilder: (context, i) => Text(
                            '${i + 1}. ${materialItems[index].listSku[i]}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(height: 1.5),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 15,
              ),
              Text(
                'BÁO CÁO KỸ THUẬT: ',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColor.gray767676),
              ),
              Text(
                'Hình ảnh báo cáo: ',
                style: bodyTextStyle,
              ),
              ImagePickerGridView(
                bloc: imageBloc,
                receiveBloc: receiveBloc,
                isEnable: isInProgress,
                availableImgae: state.viewModel.imageCount,
              ),

              Text(
                'Ghi âm báo cáo: ',
                style: bodyTextStyle,
              ),
              AudioListView(
                bloc: audioBloc,
                receiveBloc: receiveBloc,
                isEnable: isInProgress,
              ),

              const SizedBox(height: 30),
              buildButton(
                context,
                state,
                status: state.viewModel.responseEntity?.status,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget disableImagePicker() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: DottedBorder(
        color: AppColor.gray767676,
        strokeWidth: 1.5,
        dashPattern: const [
          2,
          2,
        ],
        radius: const Radius.circular(4),
        child: Container(
          width: 67,
          height: 67,
          child: const Icon(
            Icons.add,
            color: AppColor.gray767676,
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget disableAudioPicker() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.gray767676),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.add,
        color: AppColor.gray767676,
        size: 25,
      ),
    );
  }

  Widget itemBuilder(String item, {Color textColor = Colors.black}) {
    return Text(
      item,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor),
    );
  }

  Widget buildButton(
    BuildContext context,
    RepairTaskState state, {
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
            color: state.viewModel.isChanged
                ? AppColor.blue0089D7
                : AppColor.greyD9,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 360,
          height: 70,
          child: TextButton(
            onPressed: () {
              state.viewModel.isChanged ? bloc.add(SaveChangeEvent()) : null;
            },
            child: Text(
              'Lưu',
              style: state.viewModel.isChanged
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
            color: state.viewModel.isChanged
                ? AppColor.greyD9
                : AppColor.blue0089D7,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 360,
          height: 70,
          child: TextButton(
            onPressed: () {
              state.viewModel.isChanged ? null : bloc.add(FinishTaskEvent());
            },
            child: Text(
              'Kết thúc công việc',
              style: state.viewModel.isChanged
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
