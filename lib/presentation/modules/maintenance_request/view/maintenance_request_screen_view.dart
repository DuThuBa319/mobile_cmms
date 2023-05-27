import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/cmms/cmms_enum.dart';
import '../../../../domain/entities/cmms/cause_entity.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../../../common_widget/date_picker/cupertino_date_picker_custom.dart';
import '../../../common_widget/dropdown/dropdown_widget.dart';
import '../../../custom/audio_picker/audio_picker_bloc/audio_picker_bloc.dart';
import '../../../custom/audio_picker/audio_picker_widget.dart';
import '../../../custom/image_picker/image_picker_bloc/image_picker_bloc.dart';
import '../../../custom/image_picker/image_picker_widget.dart';

import '../../../custom/select_info_screen/bloc/receive_info_selection_bloc/receive_info_selection_bloc.dart';
import '../../../custom/select_info_screen/bloc/select_info_bloc/select_info_bloc.dart';
import '../../../custom/select_info_screen/view/select_info_screen.dart';
import '../../../theme/theme_color.dart';
import '../bloc/get_detail_bloc/get_request_info_bloc.dart';
import '../bloc/request_bloc/request_bloc.dart';
import 'maintenance_request_screen.dart';

part 'maintenance_request_screen.action.dart';

class MaintenanceRequestView extends StatefulWidget {
  const MaintenanceRequestView({super.key});

  @override
  State<MaintenanceRequestView> createState() => _MaintenanceRequestViewState();
}

class _MaintenanceRequestViewState extends StateBase<MaintenanceRequestView> {
  List<File>? imageFiles = [];
  List<File>? audioFiles = [];
  bool check = false;
  List<CauseEntity> tempListCauses = [];
  DateTime currentDate = DateTime.now();
  TextEditingController descriptionTextController = TextEditingController();
  int priority = 1;
  MaintenanceType maintenanceType = MaintenanceType.reactive;
  String? requestorId;
  String? equipmentCode;
  DropdownController<String, DropdownData<String>> equipmentCodeController =
      DropdownController<String, DropdownData<String>>(
    value: DropdownData(value: equipmentCodeSelection[0], validation: null),
  );
  DropdownController<int, DropdownData<int>> priorityController =
      DropdownController<int, DropdownData<int>>(
    value: DropdownData(value: prioritySelection[0], validation: null),
  );
  DropdownController<String, DropdownData<String>> equipmentController =
      DropdownController<String, DropdownData<String>>(
    value: DropdownData(value: equipment[0], validation: null),
  );
  DropdownController<String, DropdownData<String>> maintenanceTypeController =
      DropdownController<String, DropdownData<String>>(
    value: DropdownData(
      value: maintenanceTypeSelection[0],
      validation: null,
    ),
  );
  DropdownController<String, DropdownData<String>> employeeController =
      DropdownController<String, DropdownData<String>>(
    value: DropdownData(value: employee[0], validation: null),
  );
  @override
  RequestBloc get bloc => BlocProvider.of(context);
  ImagePickerBloc get imageBloc => BlocProvider.of(context);
  AudioPickerBloc get audioBloc => BlocProvider.of(context);
  GetRequestInfoBloc get requestInfoBloc => BlocProvider.of(context);
  SelectInfoBloc get selectInfoBloc => BlocProvider.of(context);
  ReceiveInfoSelectionBloc get receiveBloc => BlocProvider.of(context);
  @override
  Widget buildBase(BuildContext context) {
    final bodyTextStyle =
        Theme.of(context).textTheme.headline4?.copyWith(fontSize: 12);
    return BlocConsumer<GetRequestInfoBloc, GetRequestInfoState>(
      listener: _requestInfoBlocListener,
      builder: (context, state) {
        if (state is GetRequestInfoInitialState) {
          requestInfoBloc.add(GetEquipmentCodeEvent(type: 'Máy ép nhỏ'));
        }
        if (state is GetEquipmentNameState &&
            state.status == BlocStatusState.success) {
          requestInfoBloc.add(GetEmployeesEvent());
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 25),
            child: DefaultTextStyle(
              style: bodyTextStyle!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Thiết bị'),
                          Dropdown1(
                            controller: equipmentController,
                            item: equipment,
                            onChanged: equipmentTypeChanged,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Mã thiết bị'),
                          Dropdown1(
                            controller: equipmentCodeController,
                            item: equipmentCodeSelection,
                            onChanged: equipmentCodeChanged,
                          )
                        ],
                      ),
                    ],
                  ),
                  const Text('Tên thiết bị'),
                  Container(
                    width: 387,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColor.greyF3,
                      border:
                          Border.all(width: 0.5, color: AppColor.gray767676),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      state.viewModel.equipmentName ?? '--',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Mức độ'),
                          check
                              ? Dropdown1(
                                  controller: priorityController,
                                  item: prioritySelection,
                                  onChanged: priorityChanged,
                                )
                              : Dropdown2(),
                          const Text('Chọn thời gian'),
                          Container(
                            height: 50,
                            width: 168,
                            margin: const EdgeInsets.only(top: 10, bottom: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppColor.gray767676,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    DateFormat('dd-MM-yyyy').format(
                                      state.viewModel.selectedDate ??
                                          currentDate,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: check
                                          ? Colors.black
                                          : AppColor.gray767676,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  onPressed: () {
                                    if (check) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content:
                                                const Text('Chọn thời gian'),
                                            actions: [
                                              CupertinoDatePickerCustom(
                                                initialDateTime: currentDate,
                                                onCancelled: null,
                                                onComfirmed: setDate,
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    Icons.calendar_month,
                                    size: 30,
                                    color: check
                                        ? Colors.black
                                        : AppColor.gray767676,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Text('Loại bảo trì'),
                          check
                              ? Dropdown1(
                                  controller: maintenanceTypeController,
                                  item: maintenanceTypeSelection,
                                  onChanged: maintenanceTypeChanged,
                                )
                              : Dropdown2(),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Chỉ định KTV'),
                          check
                              ? Dropdown1(
                                  controller: employeeController,
                                  item: employee,
                                  onChanged: employeeChanged,
                                )
                              : Dropdown2(),
                        ],
                      )
                    ],
                  ),
                  const Text(
                    'Hiện tượng',
                  ),
                  Container(
                    width: 387,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 17, top: 10),
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
                        itemBuilder1('item'),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColor.gray767676,
                        )
                      ],
                    ),
                  ),
                  const Text(
                    'Nguyên nhân',
                  ),
                  check
                      ? selectionDropdown(context, state)
                      : disableSelectionDropdown(context, state),
                  const Text(
                    'Ghi chú mô tả',
                  ),
                  Container(
                    width: 388,
                    height: 66,
                    margin: const EdgeInsets.only(bottom: 17, top: 10),
                    padding: const EdgeInsets.fromLTRB(12, 9, 16, 10),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColor.gray767676, width: 0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      enabled: check,
                      controller: descriptionTextController,
                      // Text('Sản phẩm ép ra bị giáp mí nặng, có dấu hiệu sản phẩm dơ do mỡ bò bị tràn ra ngoài')
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.black, height: 1.4),
                    ),
                  ),
                  BlocListener<ReceiveInfoSelectionBloc,
                      ReceiveInfoSelectionState>(
                    bloc: receiveBloc,
                    listener: (context, receiveState) {
                      if (receiveState is ReceiveImageFileState &&
                          receiveState.status == BlocStatusState.success) {
                        imageFiles = receiveState.viewModel.imageFiles;
                      }
                      if (receiveState is ReceiveAudioFileState &&
                          receiveState.status == BlocStatusState.success) {
                        audioFiles = receiveState.viewModel.audioFiles;
                      }
                    },
                    child: Column(
                      children: [
                        const Text(
                          'Hình ảnh mô tả: ',
                        ),
                        check
                            ? ImagePickerGridView(
                                bloc: imageBloc,
                                receiveBloc: receiveBloc,
                              )
                            : disableImagePicker(),
                        const Text(
                          'Ghi âm mô tả: ',
                        ),
                        check
                            ? AudioListView(
                                bloc: audioBloc,
                                receiveBloc: receiveBloc,
                              )
                            : disableAudioPicker(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(height: 30),
                  BlocListener<RequestBloc, RequestState>(
                    listener: _requestBlocListener,
                    child: Container(
                      decoration: BoxDecoration(
                        color: check ? AppColor.blue0089D7 : AppColor.greyD9,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: 360,
                      height: 70,
                      child: TextButton(
                        onPressed: () {
                          if (check) {
                            bloc.add(
                              MakeRequestEvent(
                                imageFiles: imageFiles,
                                audioFiles: audioFiles,
                                priority: priority,
                                problem: descriptionTextController.text,
                                requestedCompletionDate: currentDate,
                                type: maintenanceType,
                                equipmentCode: equipmentCode,
                                requestorCode: requestorId,
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Tạo yêu cầu',
                          style:
                              Theme.of(context).textTheme.headline3?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget selectionDropdown(BuildContext context, GetRequestInfoState state) {
    return GestureDetector(
      onTap: () async {
        requestInfoBloc.add(
          ReceiveListCauseEvent(
            listCauseEntity: await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SelectInfoScreen(
                  title: 'Chọn nguyên nhân',
                  bloc: selectInfoBloc,
                  selectedCause: state.viewModel.listCausesSelected,
                  infoType: InfoType.Cause,
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 387,
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
            itemBuilder1(
              textCause(list: state.viewModel.listCausesSelected),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: AppColor.gray767676,
            )
          ],
        ),
      ),
    );
  }

  Widget Dropdown1({
    DropdownController<dynamic, DropdownData<dynamic>>? controller,
    List<dynamic>? item,
    Function(dynamic)? onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 18),
      width: 168,
      height: 50,
      child: DropdownWidget<dynamic>(
        enable: true,
        controller: controller!,
        itemBuilder: itemBuilder1,
        borderColor: AppColor.gray767676,
        items: item!,
        onChanged: onChanged,
        iconColor: Colors.black,
        iconData: Icons.keyboard_arrow_down,
      ),
    );
  }

  Widget Dropdown2() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 18),
      width: 168,
      height: 50,
      child: DropdownWidget<dynamic>(
        enable: false,
        controller: nullController,
        itemBuilder: itemBuilder2,
        borderColor: AppColor.gray767676,
        items: nullItems,
        onChanged: null,
        iconColor: AppColor.graybebebe,
        iconData: Icons.keyboard_arrow_down,
      ),
    );
  }

  Widget itemBuilder1(dynamic item) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        item.toString(),
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(color: Colors.black, fontSize: 12),
      ),
    );
  }

  Widget itemBuilder2(dynamic item) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        '--',
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(color: AppColor.graybebebe, fontSize: 12),
      ),
    );
  }

  Widget disableSelectionDropdown(
    BuildContext context,
    GetRequestInfoState state,
  ) {
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
}
