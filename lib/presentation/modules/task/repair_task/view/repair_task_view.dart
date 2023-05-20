import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/cmms/cmms_enum.dart';
import '../../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../../../../common_widget/export.dart';
import '../../../../custom/audio_picker/audio_picker_bloc/audio_picker_bloc.dart';
import '../../../../custom/audio_picker/audio_picker_widget.dart';
import '../../../../custom/general_report_container.dart';
import '../../../../custom/image_picker/image_picker_bloc/image_picker_bloc.dart';
import '../../../../custom/image_picker/image_picker_widget.dart';
import '../../../../custom/select_info_screen/bloc/select_info_bloc.dart';
import '../../../../custom/select_info_screen/view/select_info_screen.dart';
import '../../../../theme/theme_color.dart';
import '../bloc/repair_task_bloc.dart';
import 'repair_task_screen.dart';

part 'repair_task.action.dart';

class RepairTaskView extends StatefulWidget {
  const RepairTaskView({super.key, required this.responseId});
  final String responseId;

  @override
  State<RepairTaskView> createState() => _RepairTaskViewState();
}

class _RepairTaskViewState extends StateBase<RepairTaskView> {
  File? _image;
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
  @override
  Widget buildBase(BuildContext context) {
    final quantity = TextEditingController();
    final bodyTextStyle = Theme.of(context).textTheme.bodyText2;
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
                equipmentCode: state.viewModel.responseEntity?.equipment?.code,
              ),
              Wrap(
                spacing: 8,
                direction: Axis.vertical,
                children: [
                  Text(
                    'CHẨN ĐOÁN, PHƯƠNG ÁN',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: AppColor.gray767676),
                  ),
                  Text(
                    'Hiện tượng: ',
                    style: bodyTextStyle,
                  ),
                  Container(
                    width: 378,
                    height: 36,
                    child: DropdownWidget<String>(
                      controller: problemController,
                      itemBuilder: itemBuilder,
                      borderColor: AppColor.gray767676,
                      items: problem,
                    ),
                  ),
                  Text(
                    'Nguyên nhân: ',
                    style: bodyTextStyle,
                  ),
                  state.viewModel.responseEntity?.status ==
                          MaintenanceStatus.inProgress
                      ? selectionDropdown(context, state)
                      : disableSelectionDropdown(context, state),
                  Text(
                    'Phương án sữa chữa: ',
                    style: bodyTextStyle,
                  ),
                  Container(
                    width: 378,
                    height: 36,
                    child: DropdownWidget<String>(
                      controller: correctionController,
                      itemBuilder: itemBuilder,
                      borderColor: AppColor.gray767676,
                      items: correction,
                    ),
                  ),
                  //-------------------------------------------------//
                  const SizedBox(height: 18),
                  Text(
                    'LINH KIỆN: ',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: AppColor.gray767676),
                  ),
                  Text(
                    'Tên linh kiện',
                    style: bodyTextStyle,
                  ),
                  Container(
                    width: 378,
                    height: 36,
                    child: DropdownWidget<String>(
                      controller: sparePartController,
                      itemBuilder: itemBuilder,
                      borderColor: AppColor.gray767676,
                      items: sparePart,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 378,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Số lượng sử dụng',
                          style: bodyTextStyle,
                        ),
                        SizedBox(
                          width: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 80,
                                height: 32,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColor.gray767676),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: TextField(
                                  controller: quantity,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 18),
                                  ),
                                  textAlign: TextAlign.center,
                                  style: bodyTextStyle,
                                ),
                              ),
                              Text('cái', style: bodyTextStyle),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),
                ],
              ),
              //-------------------------------------------------//
              Text(
                'BÁO CÁO KỸ THUẬT: ',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: AppColor.gray767676),
              ),
              Text(
                'Hình ảnh báo cáo: ',
                style: bodyTextStyle,
              ),
              state.viewModel.responseEntity?.status ==
                      MaintenanceStatus.inProgress
                  ? ImagePickerGridView(
                      bloc: imageBloc,
                    )
                  : disableImagePicker(),
              Text(
                'Ghi âm báo cáo: ',
                style: bodyTextStyle,
              ),
              state.viewModel.responseEntity?.status ==
                      MaintenanceStatus.inProgress
                  ? AudioListView(
                      bloc: audioBloc,
                    )
                  : disableAudioPicker(),
              const SizedBox(height: 30),
              buildButton(status: state.viewModel.responseEntity?.status),
            ],
          ),
        );
      },
    );
  }

  Widget selectionDropdown(BuildContext context, RepairTaskState state) {
    return GestureDetector(
      onTap: () async {
        if (state.viewModel.responseEntity?.status ==
            MaintenanceStatus.inProgress) {
          bloc.add(
            ReceiveCauseEvent(
              listCauseEntity: await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectInfoScreen(
                    title: 'Chọn nguyên nhân',
                    bloc: selectInfoBloc,
                    selectedInfos: state.viewModel.listCausesSelected,
                  ),
                ),
              ),
            ),
          );
        }
      },
      child: Container(
        width: 378,
        height: 50,
        margin: const EdgeInsets.only(bottom: 17, top: 10),
        padding: const EdgeInsets.fromLTRB(12, 9, 16, 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.gray767676, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Text(
                textCause(list: state.viewModel.listCausesSelected)!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.black),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  Widget disableSelectionDropdown(BuildContext context, RepairTaskState state) {
    return Container(
      width: 378,
      height: 50,
      margin: const EdgeInsets.only(bottom: 17, top: 10),
      padding: const EdgeInsets.fromLTRB(12, 9, 16, 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.gray767676, width: 0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Text(
              textCause(list: state.viewModel.listCausesSelected)!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: AppColor.gray767676),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: AppColor.gray767676,
          )
        ],
      ),
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
      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: textColor),
    );
  }

  Widget buildButton({required MaintenanceStatus? status}) {
    if (status == MaintenanceStatus.assigned) {
      return Container(
        decoration: BoxDecoration(
          color: AppColor.greyD9,
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
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      );
    }
    if (status == MaintenanceStatus.completed) {
      return Container(
        decoration: BoxDecoration(
          color: AppColor.greyD9,
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
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: Colors.black,
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
            color: AppColor.greyD9,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 360,
          height: 70,
          child: TextButton(
            onPressed: () {
              bloc.add(SaveChangeEvent());
            },
            child: Text(
              'Lưu',
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 40),
          decoration: BoxDecoration(
            color: AppColor.blue0089D7,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 360,
          height: 70,
          child: TextButton(
            onPressed: () {
              bloc.add(FinishTaskEvent());
            },
            child: Text(
              'Kết thúc công việc',
              style: Theme.of(context).textTheme.headline3?.copyWith(
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
