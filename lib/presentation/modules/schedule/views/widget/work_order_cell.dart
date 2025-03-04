// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../domain/entities/cmms/maintenance_response_entity.dart';
import '../../../../common_widget/item_devider.dart';
import '../../../../common_widget/menu_item_view.dart';
import '../../../../theme/theme_color.dart';

import '../../../task/general_check/view/general_check_screen.dart';
import '../../../task/repair_task/view/repair_task_screen.dart';
import '../../../task/replace_mold/view/replace_mold_screen.dart';
import '../../bloc/schedule_bloc.dart';

class WorkOrderCell extends StatefulWidget {
  final MaintenanceResponseEntity? maintenanceResponseEntity;
  final Widget? taskIcon;
  final ScheduleBloc? bloc;
  final String? selectedDate;
  const WorkOrderCell({
    Key? key,
    this.maintenanceResponseEntity,
    this.taskIcon,
    this.bloc,
    this.selectedDate,
  }) : super(key: key);

  @override
  State<WorkOrderCell> createState() => _WorkOrderCellState();
}

class _WorkOrderCellState extends State<WorkOrderCell> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final responseCode = widget.maintenanceResponseEntity?.code;
    final updateTime = widget.maintenanceResponseEntity?.updatedDate;
    final id = widget.maintenanceResponseEntity?.id;
    return GestureDetector(
      onTap: () {
        if (widget.maintenanceResponseEntity?.maintenanceTask == 'Sửa chữa') {
          goToScreen(
            RepairTaskScreen(
              title: responseCode,
              responseId: id!,
              scheduleBloc: widget.bloc,
              selectedDate: widget.selectedDate,
            ),
          );
        } else if (widget.maintenanceResponseEntity?.maintenanceTask ==
            'Thay khuôn') {
          goToScreen(
            ReplaceMoldTaskScreen(
              title: responseCode,
            ),
          );
        } else {
          goToScreen(
            GeneralCheckScreen(
              title: responseCode,
              responseId: id!,
              scheduleBloc: widget.bloc,
              selectedDate: widget.selectedDate,
            ),
          );
        }
      },
      child: Card(
        shadowColor: Colors.transparent,
        color: AppColor.greyF3,
        margin: const EdgeInsets.fromLTRB(20, 14, 20, 14),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 12, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: MenuItemView(
                      title: responseCode ?? '--',
                      titleSize: 15,
                      icon: widget.taskIcon ?? const Icon(Icons.abc),
                      divider: ItemDivider.line,
                      padding: const EdgeInsets.only(bottom: 9),
                      tailIcon: null,
                      onTap: null,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        statusContainer(
                          width: 61,
                          height: 22,
                          statusText:
                              widget.maintenanceResponseEntity?.priorityTxt ??
                                  '--',
                          color:
                              widget.maintenanceResponseEntity?.priorityColor ??
                                  Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    updateTime ?? '--',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  statusContainer(
                    width: 94,
                    height: 22,
                    margin: const EdgeInsets.only(bottom: 7, top: 8),
                    statusText:
                        widget.maintenanceResponseEntity?.statusTxt ?? '--',
                    color: widget.maintenanceResponseEntity?.statusColor ??
                        Colors.grey,
                  ),
                ],
              ),
              DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(height: 1.7),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 180,
                        height: 118,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Thiết bị: Máy ép'),
                            Text(
                              'Thời gian: ${widget.maintenanceResponseEntity?.estProcessTime ?? '--'} phút',
                            ),
                            Expanded(
                              child: Text(
                                'Vấn đề: ${widget.maintenanceResponseEntity?.problem}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 0,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Mã số: ${widget.maintenanceResponseEntity?.objectCode}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//-------------------------------//

  void goToScreen(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  Widget statusContainer({
    double width = 0,
    double height = 0,
    String statusText = 'Hoàn thành',
    EdgeInsetsGeometry margin = const EdgeInsets.all(0),
    Color color = Colors.grey,
  }) =>
      Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Text(
          statusText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 1.6,
          ),
        ),
      );
}
