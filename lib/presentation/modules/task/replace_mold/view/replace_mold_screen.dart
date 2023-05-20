import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../custom/audio_picker/audio_picker_bloc/audio_picker_bloc.dart';
import '../../../../custom/custom_screen_form.dart';
import '../../../../custom/image_picker/image_picker_bloc/image_picker_bloc.dart';

import 'replace_mold_view.dart';

class ReplaceMoldTaskScreen extends StatefulWidget {
  ReplaceMoldTaskScreen({super.key, this.title});
  String? title = 'A12345';
  @override
  State<ReplaceMoldTaskScreen> createState() => _ReplaceMoldTaskScreenState();
}

class _ReplaceMoldTaskScreenState extends State<ReplaceMoldTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreenForm(
      title: widget.title,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ImagePickerBloc>(
            create: (context) => ImagePickerBloc(),
          ),
          BlocProvider<AudioPickerBloc>(
            create: (context) => AudioPickerBloc(),
          )
        ],
        child: const ReplaceMoldView(),
      ),
    );
  }
}

class ExpansionItem {
  bool isExpand;
  String header;
  String itemID;
  String tenKhuon;
  String tinhTrang;
  String veSinh;
  String danhBong;
  String baoTri;
  ExpansionItem({
    this.isExpand = false,
    required this.header,
    required this.itemID,
    required this.tenKhuon,
    required this.tinhTrang,
    required this.veSinh,
    required this.danhBong,
    required this.baoTri,
  });
}

List<ExpansionItem> moldInfo = <ExpansionItem>[
  ExpansionItem(
    isExpand: false,
    header: 'Khuôn cũ',
    itemID: 'B052',
    tenKhuon: 'Con cóc',
    tinhTrang: 'Trầy nhẹ',
    veSinh: '20/09/2022',
    danhBong: '21/09/2022',
    baoTri: 'Cần đánh bóng lại',
  ),
  ExpansionItem(
    isExpand: false,
    header: 'Khuôn mới',
    itemID: 'M037',
    tenKhuon: 'Nút 2 nhấn oval F1 mộc',
    tinhTrang: 'Bình thường',
    veSinh: '04/11/2022',
    danhBong: '04/11/2022',
    baoTri: '--',
  )
];
