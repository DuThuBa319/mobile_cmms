import 'package:flutter/material.dart';

import '../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../domain/entities/cmms/correction_entity.dart';
import '../../../theme/theme_color.dart';

import '../bloc/receive_info_selection_bloc/receive_info_selection_bloc.dart';
import '../bloc/select_info_bloc/select_info_bloc.dart';
import 'select_info_screen.dart';

class InfoSelectionDropdown extends StatefulWidget {
  InfoSelectionDropdown({
    super.key,
    required this.bloc,
    required this.state,
    required this.selectInfoBloc,
    required this.enable,
    required this.infoType,
    this.selectedCauses,
    this.selectedCorrections,
  });
  final ReceiveInfoSelectionBloc bloc;
  final SelectInfoBloc selectInfoBloc;
  final ReceiveInfoSelectionState state;
  final bool enable;
  final InfoType infoType;
  final List<CauseEntity>? selectedCauses;
  final List<CorrectionEntity>? selectedCorrections;

  @override
  State<InfoSelectionDropdown> createState() => _InfoSelectionDropdownState();
}

class _InfoSelectionDropdownState extends State<InfoSelectionDropdown> {
  @override
  Widget build(BuildContext context) {
    if (widget.infoType == InfoType.Cause) {
      return widget.enable
          ? GestureDetector(
              onTap: () async {
                widget.bloc.add(
                  ReceiveCauseEvent(
                    listCauseEntity: await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectInfoScreen(
                          title: 'Chọn nguyên nhân',
                          bloc: widget.selectInfoBloc,
                          selectedCause:
                              widget.state.viewModel.listCauseSelected,
                          infoType: InfoType.Cause,
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                width: 378,
                height: 50,
                margin: const EdgeInsets.only(bottom: 17, top: 10),
                padding: const EdgeInsets.fromLTRB(12, 9, 16, 10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.black, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        textCause(
                              list: widget.state.viewModel.listCauseSelected,
                            ) ??
                            '--',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColor.black,
                    )
                  ],
                ),
              ),
            )
          : Container(
              width: 378,
              height: 50,
              margin: const EdgeInsets.only(bottom: 17, top: 10),
              padding: const EdgeInsets.fromLTRB(12, 9, 16, 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.gray767676, width: 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text(
                      textCause(
                        list: widget.state.viewModel.listCauseSelected,
                      )!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: AppColor.gray767676, fontSize: 14),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColor.gray767676,
                  )
                ],
              ),
            );
    }
    if (widget.infoType == InfoType.Correction) {
      return widget.enable
          ? GestureDetector(
              onTap: () async {
                widget.bloc.add(
                  ReceiveCorrectionEvent(
                    listCorrectionEntity: await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectInfoScreen(
                          title: 'Chọn phương án',
                          bloc: widget.selectInfoBloc,
                          selectedCorrection:
                              widget.state.viewModel.listCorrectionSelected,
                          infoType: InfoType.Correction,
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                width: 378,
                height: 50,
                margin: const EdgeInsets.only(bottom: 17, top: 10),
                padding: const EdgeInsets.fromLTRB(12, 9, 16, 10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.black, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        textCorrection(
                              list:
                                  widget.state.viewModel.listCorrectionSelected,
                            ) ??
                            '--',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColor.black,
                    )
                  ],
                ),
              ),
            )
          : Container(
              width: 378,
              height: 50,
              margin: const EdgeInsets.only(bottom: 17, top: 10),
              padding: const EdgeInsets.fromLTRB(12, 9, 16, 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.gray767676, width: 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text(
                      textCorrection(
                        list: widget.state.viewModel.listCorrectionSelected,
                      )!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: AppColor.gray767676, fontSize: 14),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColor.gray767676,
                  )
                ],
              ),
            );
    }
    return Container();
  }

  String? textCause({List<CauseEntity>? list}) {
    if (list == null) {
      return '<Chọn nguyên nhân>';
    }
    if (list.isEmpty) {
      return '<Chọn nguyên nhân>';
    }
    if (list.length > 1) {
      return 'Nhiều nguyên nhân';
    }
    return list[0].name;
  }

  String? textCorrection({List<CorrectionEntity>? list}) {
    if (list == null) {
      return '<Chọn phương án>';
    }
    if (list.isEmpty) {
      return '<Chọn phương án>';
    }
    if (list.length > 1) {
      return 'Nhiều phương án';
    }
    return list[0].name;
  }
}
