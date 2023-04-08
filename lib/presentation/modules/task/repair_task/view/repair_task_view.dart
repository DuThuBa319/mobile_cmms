import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../common_widget/export.dart';
import '../../../../custom/general_report_container.dart';
import '../../../../theme/theme_color.dart';
import 'repair_task_screen.dart';

part 'repair_task.action.dart';

class RepairTaskView extends StatefulWidget {
  const RepairTaskView({super.key});

  @override
  State<RepairTaskView> createState() => _RepairTaskViewState();
}

class _RepairTaskViewState extends State<RepairTaskView> {
  File? _image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

              Container(
                padding: const EdgeInsets.only(right: 40, top: 10),
                width: MediaQuery.of(context).size.width,
                height: 210,
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  children: List.generate(
                    6,
                    (index) => DottedBorder(
                      color: AppColor.blue0089D7,
                      strokeWidth: 1.5,
                      dashPattern: const [
                        2,
                        2,
                      ],
                      radius: const Radius.circular(4),
                      child: Container(
                        width: 84,
                        height: 84,
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: AppColor.blue0089D7,
                            size: 40,
                          ),
                          onPressed: getImage,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Text(
                'Ghi âm báo cáo: ',
                style: bodyTextStyle,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.blue0089D7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: AppColor.blue0089D7,
                    size: 25,
                  ),
                  onPressed: getImage,
                ),
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
                  onPressed: () {},
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
