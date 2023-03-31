// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../domain/entities/work_order_entity.dart';
import '../../../../common_widget/item_devider.dart';
import '../../../../common_widget/menu_item_view.dart';
import '../../../../theme/theme_color.dart';

import '../../../task/general_check/view/general_check_screen.dart';
import '../../../task/repair_task/view/repair_task_screen.dart';
import '../../../task/replace_mold/view/replace_mold_screen.dart';

class WorkOrderCell extends StatefulWidget {
  final WorkOrderEntity? workOrderEntity;
  final Widget? taskIcon;
  const WorkOrderCell({
    Key? key,
    this.workOrderEntity,
    this.taskIcon,
  }) : super(key: key);

  @override
  State<WorkOrderCell> createState() => _WorkOrderCellState();
}

class _WorkOrderCellState extends State<WorkOrderCell> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceName = widget.workOrderEntity?.deviceName;
    final updateTime = widget.workOrderEntity?.timeUpdate;
    final id = widget.workOrderEntity?.id;
    return GestureDetector(
      onTap: () {
        if (widget.workOrderEntity?.task == 'Sửa chữa') {
          goToScreen(
            RepairTaskScreen(
              title: widget.workOrderEntity?.deviceName,
            ),
          );
        } else if (widget.workOrderEntity?.task == 'Thay khuôn') {
          goToScreen(
            ReplaceMoldTaskScreen(
              title: widget.workOrderEntity?.deviceName,
            ),
          );
        } else {
          goToScreen(
            GeneralCheckScreen(
              title: widget.workOrderEntity?.deviceName,
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                children: [
                  MenuItemView(
                    title: deviceName ?? '--',
                    titleSize: 20,
                    icon: widget.taskIcon ?? const Icon(Icons.abc),
                    divider: ItemDivider.line,
                    padding: const EdgeInsets.only(bottom: 9),
                    tailIcon: null,
                    onTap: null,
                  ),
                  Positioned(
                    right: 0,
                    top: 2,
                    child: Row(
                      children: [
                        Text(
                          updateTime ?? '--',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(width: 15),
                        statusContainer(
                          width: 61,
                          height: 22,
                          statusText: widget.workOrderEntity?.level ?? '--',
                          color:
                              widget.workOrderEntity?.LevelColor ?? Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              statusContainer(
                width: 94,
                height: 22,
                margin: const EdgeInsets.only(bottom: 7, top: 8),
                statusText: widget.workOrderEntity?.status ?? '--',
                color: widget.workOrderEntity?.StatusColor ?? Colors.grey,
              ),
              DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(height: 1.7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      width: 212,
                      height: 118,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Thiết bị: Máy ép'),
                          Text('Thời gian: 70 phút'),
                          Expanded(
                            child: Text(
                              'Nguyên nhân: Thay ty lói, vệ sinh',
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
                      children: const [
                        Text('Mã số: M39'),
                        Text('Kết quả: đạt'),
                      ],
                    ),
                  ],
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
