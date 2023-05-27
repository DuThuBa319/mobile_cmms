import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../custom/custom_screen_form.dart';
import '../bloc/add_material_bloc.dart';
import 'add_material_view.dart';

class AddMaterialScreen extends StatefulWidget {
  const AddMaterialScreen({super.key, this.sku});
  final String? sku;
  @override
  State<AddMaterialScreen> createState() => _AddMaterialScreenState();
}

class _AddMaterialScreenState extends State<AddMaterialScreen> {
  static GetIt getIt = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddMaterialBloc>(
      create: (context) => getIt<AddMaterialBloc>(),
      child: CustomScreenForm(
        title: 'Thêm vật tư',
        child: AddMaterialView(sku: widget.sku),
      ),
    );
  }
}

List<String> materialInfoCodeSelection = ['<Chọn loại vật tư>'];
List<String> materialStatusSelection = const [
  '<Chọn trạng thái>',
  'Có sẵn',
  'Đang được sử dụng',
  'Hết hạn sử dụng',
  'Bị lỗi',
  'Bị thất lạc'
];
