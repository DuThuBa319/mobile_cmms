import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/base.dart';
import '../../../../common_widget/export.dart';
import '../../../../custom/audio_picker/audio_picker_widget.dart';
import '../../../../custom/general_report_container.dart';
import '../../../../custom/image_picker/image_picker_widget.dart';
import '../../../../theme/theme_color.dart';
import '../../../maintenance_request/bloc/audio_picker_bloc/audio_picker_bloc.dart';
import '../../../maintenance_request/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'repair_task_screen.dart';

part 'repair_task.action.dart';

class RepairTaskView extends StatefulWidget {
  const RepairTaskView({super.key});

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
  ImagePickerBloc get bloc => BlocProvider.of(context);

  AudioPickerBloc get audioBloc => BlocProvider.of(context);
  @override
  Widget buildBase(BuildContext context) {
    final quantity = TextEditingController();
    final bodyTextStyle = Theme.of(context).textTheme.bodyText2;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GeneralReportContainer(task: 'Sửa chữa'),
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
              Container(
                width: 378,
                height: 36,
                child: DropdownWidget<String>(
                  controller: causeController,
                  itemBuilder: itemBuilder,
                  borderColor: AppColor.gray767676,
                  items: cause,
                ),
              ),
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
                style: bodyTextStyle,
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
                              border: Border.all(color: AppColor.gray767676),
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
          ImagePickerGridView(
            bloc: bloc,
          ),
          Text(
            'Ghi âm báo cáo: ',
            style: bodyTextStyle,
          ),
          AudioListView(
            bloc: audioBloc,
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: AppColor.greyD9,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 360,
            height: 70,
            child: TextButton(
              onPressed: () {},
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
                Navigator.pop(context);
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
      ),
    );
  }

  Widget itemBuilder(String item, {Color textColor = Colors.black}) {
    return Text(
      item,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: textColor),
    );
  }
}
