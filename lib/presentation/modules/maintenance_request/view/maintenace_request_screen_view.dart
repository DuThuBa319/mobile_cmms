import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../../../common_widget/dropdown/dropdown_widget.dart';
import '../../../custom/audio_picker/audio_picker_widget.dart';
import '../../../custom/image_picker/image_picker_widget.dart';
import '../../../theme/theme_color.dart';
import '../bloc/audio_picker_bloc/audio_picker_bloc.dart';
import '../bloc/image_picker_bloc/image_picker_bloc.dart';
import '../bloc/request_bloc/request_bloc.dart';
import 'maintenance_request_screen.dart';

part 'maintenance_request_screen.action.dart';

class MaintenanceRequestView extends StatefulWidget {
  const MaintenanceRequestView({super.key});

  @override
  State<MaintenanceRequestView> createState() => _MaintenanceRequestViewState();
}

class _MaintenanceRequestViewState extends StateBase<MaintenanceRequestView> {
  bool moldSelected = false;
  TextEditingController? descriptionTextController;

  @override
  ImagePickerBloc get bloc => BlocProvider.of(context);

  RequestBloc get requestBloc => BlocProvider.of(context);

  AudioPickerBloc get audioBloc => BlocProvider.of(context);
  @override
  Widget buildBase(BuildContext context) {
    final bodyTextStyle =
        Theme.of(context).textTheme.headline4?.copyWith(fontSize: 12);
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
                        onChanged: equipmentChanged,
                      ),
                      const Text('Khuôn ép'),
                      moldSelected
                          ? Dropdown1(
                              controller: moldCodeController,
                              item: moldCode,
                            )
                          : Dropdown2(
                              controller: moldCodeController,
                              item: moldCode,
                            ),
                      const Text('Vấn đề'),
                      Dropdown1(
                        controller: problemController,
                        item: problem,
                      ),
                      const Text(
                        'Kỳ vọng ưu tiên',
                      ),
                      Dropdown1(
                        controller: priorityController,
                        item: priority,
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
                        item: equipmentCode,
                      ),
                      const Text('Tên khuôn'),
                      moldSelected
                          ? Dropdown1(
                              controller: moldNameController,
                              item: moldName,
                            )
                          : Dropdown2(
                              controller: moldNameController,
                              item: moldName,
                            ),
                      const Text('Chi tiết'),
                      Dropdown1(
                        controller: detailController,
                        item: detail,
                      ),
                      const Text(
                        'Kỳ vọng được duyệt',
                      ),
                      Dropdown2(
                        controller: approvedPriorityController,
                        item: approvedPriority,
                      ),
                    ],
                  )
                ],
              ),
              const Text(
                'Ghi chú mô tả',
              ),
              Container(
                width: 388,
                height: 66,
                margin: const EdgeInsets.only(bottom: 17, top: 10),
                padding: const EdgeInsets.fromLTRB(12, 9, 16, 10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.gray767676, width: 0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextField(
                  controller: descriptionTextController,
                  // Text('Sản phẩm ép ra bị giáp mí nặng, có dấu hiệu sản phẩm dơ do mỡ bò bị tràn ra ngoài')
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.black, height: 1.4),
                ),
              ),
              const Text(
                'Hình ảnh mô tả: ',
              ),
              ImagePickerGridView(
                bloc: bloc,
              ),
              const Text(
                'Ghi âm mô tả: ',
              ),
              AudioListView(bloc: audioBloc),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(height: 30),
              BlocListener<RequestBloc, RequestState>(
                listener: _requestBlocListener,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.greyD9,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 360,
                  height: 70,
                  child: TextButton(
                    onPressed: () {
                      final temp = <File>[];
                      if (audioBloc.state.viewModel.audioFiles != null) {
                        for (final fileInfo
                            in audioBloc.state.viewModel.audioFiles!) {
                          temp.add(fileInfo.file!);
                        }
                      }
                      requestBloc.add(
                        MakeRequestEvent(
                          imageFiles: bloc.state.viewModel.imageFiles,
                          audioFiles: temp,
                        ),
                      );
                    },
                    child: Text(
                      'Tạo yêu cầu',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
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
      ),
    );
  }

  Widget Dropdown2({
    DropdownController<dynamic, DropdownData<dynamic>>? controller,
    List<dynamic>? item,
    Function(dynamic)? onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 18),
      width: 168,
      height: 50,
      child: DropdownWidget<dynamic>(
        enable: false,
        controller: controller!,
        itemBuilder: itemBuilder2,
        borderColor: AppColor.gray767676,
        items: item!,
        onChanged: null,
        iconColor: AppColor.graybebebe,
      ),
    );
  }

  Widget itemBuilder1(dynamic item) {
    return Text(
      item,
      style: Theme.of(context)
          .textTheme
          .headline4
          ?.copyWith(color: Colors.black, fontSize: 12),
    );
  }

  Widget itemBuilder2(dynamic item) {
    return Text(
      item,
      style: Theme.of(context)
          .textTheme
          .headline4
          ?.copyWith(color: AppColor.graybebebe, fontSize: 12),
    );
  }
}
