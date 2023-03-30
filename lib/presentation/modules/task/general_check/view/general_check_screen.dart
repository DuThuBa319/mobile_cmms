import 'package:flutter/material.dart';

import '../../../../common_widget/dropdown/dropdown_widget.dart';
import '../../../../custom/custom_screen_form.dart';
import 'general_check_view.dart';

class GeneralCheckScreen extends StatefulWidget {
  const GeneralCheckScreen({super.key, this.title});
  final String? title;
  @override
  State<GeneralCheckScreen> createState() => _GeneralCheckScreenState();
}

class _GeneralCheckScreenState extends State<GeneralCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreenForm(
      title: widget.title,
      child: const GeneralCheckView(),
    );
  }
}

Map<String, String> listWork = {
  'Lên nguồn': 'Không đạt',
  'Khởi động motor': 'Đạt',
  'Đóng mở khuôn': 'Đạt',
  'Bơm lấy keo': 'Đạt',
  'Lói đẩy sản phẩm': 'Đạt',
  'Áp tốc nhiệt': 'Đạt',
  'Đóng mở khuôn': 'Đạt',
  'Đài tới lui': 'Đạt',
  'Có âm thanh lạ': 'Đạt',
  'Trụ, ắc': 'Đạt',
  'Ma sát không cháy': 'Đạt',
  'Dầu bôi trơn': 'Đạt',
  'Thùng dầu': 'Đạt',
  'Vùng nhiệt 1': 'Không kiểm tra',
  'Vùng nhiệt 2': 'Đạt',
  'Vùng nhiệt 3': 'Đạt',
  'Vùng nhiệt 4': 'Đạt',
  'Vùng nhiệt 5': 'Đạt',
  'Cảo bơm keo': 'Đạt',
  'Giữ keo': 'Đạt',
  'Lòn keo': 'Đạt',
};

List<DropdownController<String, DropdownData<String>>> taskDropdownControllers =
    List.generate(
  20,
  (index) => DropdownController<String, DropdownData<String>>(
    value: DropdownData<String>(
      value: listWork.values.elementAt(index),
      validation: null,
    ),
  ),
);
List<String> result = ['Đạt', 'Không đạt', 'Không kiểm tra'];
