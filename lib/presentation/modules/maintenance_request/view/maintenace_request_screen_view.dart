import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../common/services/firebase/firebase_storage_service.dart';
import '../../../../common/services/permission_service.dart';
import '../../../common_widget/dropdown/dropdown_widget.dart';
import '../../../theme/theme_color.dart';
import 'maintenance_request_screen.dart';

part 'maintenance_request_screen.action.dart';

class MaintenanceRequestView extends StatefulWidget {
  const MaintenanceRequestView({super.key});

  @override
  State<MaintenanceRequestView> createState() => _MaintenanceRequestViewState();
}

class _MaintenanceRequestViewState extends State<MaintenanceRequestView> {
  bool moldSelected = false;
  TextEditingController? descriptionTextController;
  //step 1
  File? file;
  String fileName = '';
  String selectFileName = '';
  UploadTask? uploadTask;
  List<File> imageFiles = [];
  List<CloudStorageResult> uploadResults = [];
  int imageCount = 0;

  /// audio
  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  File? audioFile;
  AudioPlayer player = AudioPlayer();
  Duration? totalDuration;
  @override
  void initState() {
    initRecorder();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Container(
                padding: const EdgeInsets.only(right: 40, top: 10),
                width: MediaQuery.of(context).size.width,
                height: 105,
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  children: List.generate(
                    imageCount + 1,
                    (index) => DottedBorder(
                      color: AppColor.blue0089D7,
                      strokeWidth: 1.5,
                      dashPattern: const [
                        2,
                        2,
                      ],
                      radius: const Radius.circular(4),
                      child: GestureDetector(
                        onTap: () {
                          index == imageCount
                              ? showPicker(context)
                              : editPicker(context, index);
                        },
                        child: index == imageCount
                            ? Container(
                                width: 84,
                                height: 84,
                                child: const Icon(
                                  Icons.add,
                                  color: AppColor.blue0089D7,
                                  size: 40,
                                ),
                              )
                            : Image.file(
                                imageFiles[index],
                                width: 84,
                                height: 84,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Ghi âm mô tả: ',
              ),
              Container(
                width: 378,
                height: 50,
                padding: const EdgeInsets.only(left: 10, right: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.blue0089D7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.play_circle_filled,
                          color: AppColor.blue0089D7,
                          size: 27,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Recording_001.mp3',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    Text(
                      '00:01:43',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
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
                  onPressed: () {
                    recordDialog();
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 30,
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
                  onPressed: _upLoadFile,
                  child: Text(
                    'Tạo yêu cầu',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              )
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
