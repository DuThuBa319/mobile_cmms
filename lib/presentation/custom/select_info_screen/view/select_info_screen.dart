import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../domain/entities/cmms/correction_entity.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../../../common_widget/check_box/check_box.dart';
import '../../../common_widget/export.dart';

import '../../../theme/theme_color.dart';
import '../../custom_screen_form.dart';
import '../bloc/select_info_bloc.dart';

enum InfoType { Cause, Correction }

class SelectInfoScreen extends StatefulWidget {
  SelectInfoScreen({
    super.key,
    required this.title,
    required this.bloc,
    this.selectedCause,
    this.infoType,
    this.selectedCorrection,
  });
  final String? title;
  final SelectInfoBloc? bloc;
  final List<CauseEntity>? selectedCause;
  final List<CorrectionEntity>? selectedCorrection;
  final InfoType? infoType;
  @override
  State<SelectInfoScreen> createState() => _SelectInfoScreenState();
}

class _SelectInfoScreenState extends State<SelectInfoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.bloc?.add(
      widget.infoType == InfoType.Cause
          ? GetInfosEvent(
              infoType: InfoType.Cause,
              selectedCause: widget.selectedCause,
            )
          : GetInfosEvent(
              infoType: InfoType.Correction,
              selectedCorrection: widget.selectedCorrection,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreenForm(
      title: widget.title,
      child: BlocConsumer<SelectInfoBloc, SelectInfoState>(
        bloc: widget.bloc,
        listener: (context, state) {
          if (state is ResponseInfosState &&
              state.status == BlocStatusState.success) {
            Navigator.pop(
              context,
              widget.infoType == InfoType.Cause
                  ? state.viewModel.listCauseSelected
                  : state.viewModel.listCorrectionSelected,
            );
          }
        },
        builder: (context, state) {
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
                    itemCount: state.viewModel.infoResponse?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.5)),
                        margin: const EdgeInsets.all(10),
                        child: CheckboxWithTitle(
                          title:
                              state.viewModel.infoResponse?[index].name ?? '--',
                          value: state.viewModel.isInfoSelected?[index],
                          onChanged: (p0) {
                            widget.bloc?.add(InfoSelectedEvent(index: index));
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
                      widget.bloc
                          ?.add(ResponseInfosEvent(infoType: widget.infoType));
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
