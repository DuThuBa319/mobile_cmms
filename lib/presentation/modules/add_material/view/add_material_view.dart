import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/cmms/cmms_enum.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../../../common_widget/export.dart';
import '../../../theme/theme_color.dart';
import '../bloc/add_material_bloc.dart';
import 'add_material_screen.dart';

part 'add_material_view.action.dart';

class AddMaterialView extends StatefulWidget {
  const AddMaterialView({super.key, required this.sku});
  final String? sku;
  @override
  State<AddMaterialView> createState() => _AddMaterialViewState();
}

class _AddMaterialViewState extends StateBase<AddMaterialView> {
  DropdownController<String, DropdownData<String>> materialInfoCodeController =
      DropdownController<String, DropdownData<String>>(
    value: DropdownData(value: materialInfoCodeSelection[0], validation: null),
  );
  DropdownController<String, DropdownData<String>> materialStatusController =
      DropdownController<String, DropdownData<String>>(
    value: DropdownData(value: materialStatusSelection[0], validation: null),
  );
  @override
  AddMaterialBloc get bloc => BlocProvider.of(context);
  @override
  Widget buildBase(BuildContext context) {
    return BlocConsumer<AddMaterialBloc, AddMaterialState>(
      listener: _blocListener,
      builder: (context, state) {
        if (state is AddMaterialInitialState) {
          bloc.add(GetMaterialInfoCodeEvent(sku: widget.sku));
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(23, 57, 23, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                runSpacing: 23,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text('SKU đã quét:'), Text(widget.sku!)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Loại vật tư:'),
                      Dropdown1(
                        controller: materialInfoCodeController,
                        item: materialInfoCodeSelection,
                        onChanged: materialInfoCodeChanged,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tên vật tư:'),
                      Text(state.viewModel.name ?? '--')
                    ],
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Số lượng hiện có trong kho'),
                      Text((state.viewModel.quantity ?? '--').toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Trạng thái'),
                      Dropdown1(
                        controller: materialStatusController,
                        item: materialStatusSelection,
                        onChanged: statusChanged,
                      )
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 40),
                decoration: BoxDecoration(
                  color: state.viewModel.isFinished == true
                      ? AppColor.blue0089D7
                      : AppColor.gray767676,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 360,
                height: 70,
                child: TextButton(
                  onPressed: () {
                    if (state.viewModel.isFinished == true) {
                      bloc.add(CreateMaterialEvent());
                    }
                  },
                  child: Text(
                    'Thêm vật tư',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: state.viewModel.isFinished == true
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              )
            ],
          ),
        );
      },
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
}
