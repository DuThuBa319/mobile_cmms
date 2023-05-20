import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/cmms/cause_entity.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../../../common_widget/check_box/check_box.dart';
import '../../../common_widget/export.dart';

import '../../../theme/theme_color.dart';
import '../../custom_screen_form.dart';
import '../bloc/select_info_bloc.dart';

class SelectInfoScreen extends StatefulWidget {
  SelectInfoScreen({
    super.key,
    required this.title,
    required this.bloc,
    this.selectedInfos,
  });
  final String? title;
  final SelectInfoBloc? bloc;
  final List<CauseEntity>? selectedInfos;
  @override
  State<SelectInfoScreen> createState() => _SelectInfoScreenState();
}

class _SelectInfoScreenState extends State<SelectInfoScreen> {
  List<String> tempCauses = [];

  @override
  Widget build(BuildContext context) {
    return CustomScreenForm(
      title: widget.title,
      child: BlocConsumer<SelectInfoBloc, SelectInfoState>(
        bloc: widget.bloc,
        listener: (context, state) {
          if (state is ResponseCausesState &&
              state.status == BlocStatusState.success) {
            Navigator.pop(context, state.viewModel.listInfoSelected);
          }
        },
        builder: (context, state) {
          if (state is SelectInfoInitialState) {
            widget.bloc
                ?.add(GetCausesEvent(selectedCause: widget.selectedInfos));
          }
          if (state is GetInfoState &&
              state.status == BlocStatusState.loading) {
            return const Center(
              child: Loading(
                brightness: Brightness.light,
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: state.viewModel.response?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.5)),
                        margin: const EdgeInsets.all(10),
                        child: CheckboxWithTitle(
                          title: state.viewModel.response?[index].causeName ??
                              '--',
                          value: state.viewModel.isCauseSelected?[index],
                          onChanged: (p0) {
                            widget.bloc?.add(SelectCauseEvent(index: index));
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.blue0089D7,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 360,
                  height: 70,
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: TextButton(
                    onPressed: () {
                      widget.bloc?.add(ResponseCausesEvent());
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
              ],
            ),
          );
        },
      ),
    );
  }
}
