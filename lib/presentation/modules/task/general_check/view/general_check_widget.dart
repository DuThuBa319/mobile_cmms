import 'package:flutter/material.dart';
import '../../../../../data/models/cmms/cmms_enum.dart';
import '../../../../common_widget/dropdown/dropdown_widget.dart';
import '../../../../route/route_list.dart';
import '../../../../theme/theme_color.dart';
import '../../../maintenance_request/view/maintenance_request_screen.dart';
import '../bloc/general_check_bloc.dart';
import 'general_check_screen.dart';

class RowTile extends StatefulWidget {
  RowTile({super.key, this.isSeparate, this.title});
  bool? isSeparate = false;
  String? title = 'KIỂM TRA ĐIỆN';
  @override
  State<RowTile> createState() => _RowTileState();
}

class _RowTileState extends State<RowTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isSeparate == true
            ? const SizedBox(height: 20)
            : const SizedBox(),
        widget.isSeparate == true
            ? const Divider(
                thickness: 1,
                color: Colors.black,
                indent: 20,
                endIndent: 35,
              )
            : const SizedBox(),
        widget.isSeparate == true
            ? const SizedBox(height: 15)
            : const SizedBox(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          padding: const EdgeInsets.only(
            left: 6,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 12,
                child: Text(
                  widget.title!,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: AppColor.gray767676),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CheckDropDown extends StatefulWidget {
  CheckDropDown({
    super.key,
    required this.index,
    required this.checkState,
    required this.bloc,
  });
  int index;
  GeneralCheckState checkState;
  GeneralCheckBloc bloc;
  @override
  State<CheckDropDown> createState() => _CheckDropDownState();
}

class _CheckDropDownState extends State<CheckDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: const EdgeInsets.only(
        left: 6,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 17,
            child: Text(
              (widget.checkState.viewModel.inspectionReports ??
                          [])[widget.index]
                      .name ??
                  '--',
            ),
          ),
          Positioned(
            right: 50,
            top: 0,
            child: Container(
              width: 163,
              height: 60,
              child: DropdownWidget<String>(
                enable: widget.checkState.viewModel.responseEntity?.status ==
                    MaintenanceStatus.inProgress,
                controller: taskDropdownControllers[widget.index],
                itemBuilder:
                    widget.checkState.viewModel.responseEntity?.status ==
                            MaintenanceStatus.inProgress
                        ? isInProgressBuilder
                        : IsNotInProgressBuilder,
                borderColor: AppColor.gray767676,
                items: result,
                iconData: Icons.keyboard_arrow_down,
                onChanged: (e) {
                  if (e == 'Đạt') {
                    widget.bloc.add(
                      DropdownChangedEvent(
                        index: widget.index,
                        status: PreventiveInspectionStatus.passed,
                      ),
                    );
                  }
                  if (e == 'Không đạt') {
                    widget.bloc.add(
                      DropdownChangedEvent(
                        index: widget.index,
                        status: PreventiveInspectionStatus.failed,
                      ),
                    );
                  }
                  if (e == 'Không kiểm tra') {
                    widget.bloc.add(
                      DropdownChangedEvent(
                        index: widget.index,
                        status: PreventiveInspectionStatus.uninspectable,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 5,
            child: (widget.checkState.viewModel.inspectionReports ??
                            [])[widget.index]
                        .inspectionStatus ==
                    'Không đạt'
                ? IconButton(
                    onPressed: () async {
                      if ((widget.checkState.viewModel.inspectionReports ??
                                      [])[widget.index]
                                  .isRequest ==
                              false ||
                          widget.checkState.viewModel.responseEntity?.status ==
                              MaintenanceStatus.inProgress) {
                        widget.bloc.add(
                          MakeRequestEvent(
                            index: widget.index,
                            isRequest: await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MaintenanceRequestScreen(),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.description,
                      color: (widget.checkState.viewModel.inspectionReports ??
                                          [])[widget.index]
                                      .isRequest ==
                                  false ||
                              widget.checkState.viewModel.responseEntity
                                      ?.status ==
                                  MaintenanceStatus.inProgress
                          ? AppColor.blue0089D7
                          : AppColor.gray767676,
                    ),
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }

  Widget isInProgressBuilder(String item) {
    return Container(
      width: 120,
      height: 25,
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        item,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget IsNotInProgressBuilder(String item) {
    return Container(
      width: 120,
      height: 25,
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        item,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 14,
              color: AppColor.gray767676,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
