import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common_widget/date_picker/cupertino_date_picker_custom.dart';
import '../../../common_widget/item_devider.dart';
import '../../../common_widget/menu_item_view.dart';
import '../../../theme/theme_color.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  //String currentDate = DateFormat("dd/MM/yyyy").format(DateTime.now());
  DateTime currentDate = DateTime.now();
  String strDate = DateFormat('kk:mm  dd-MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 32,
          width: 200,
          margin: const EdgeInsets.only(top: 23, bottom: 23),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  DateFormat('dd-MM-yyyy').format(currentDate),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                padding: const EdgeInsets.only(bottom: 3),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text('Chọn thời gian'),
                        actions: [
                          CupertinoDatePickerCustom(
                            initialDateTime: currentDate,
                            onCancelled: null,
                            onComfirmed: setDate,
                          )
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.calendar_month),
              )
            ],
          ),
        ),

        //-----------------------------//
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 5, bottom: 20),
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => infoCard(index),
            ),
          ),
        )
      ],
    );
  }

//--------------------
  void setDate(DateTime? setDate) {
    setState(() {
      currentDate = setDate ?? DateTime.now();
      strDate = DateFormat('kk:mm dd-MM-yyyy').format(currentDate);
    });
  }

//-------------------------------//
  Widget infoCard(int index) {
    return Card(
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
                const MenuItemView(
                  title: 'A012345',
                  titleSize: 20,
                  icon: Icon(Icons.build, size: 14),
                  divider: ItemDivider.line,
                  padding: EdgeInsets.only(bottom: 9),
                  tailIcon: null,
                ),
                Positioned(
                  right: 0,
                  top: 2,
                  child: Row(
                    children: [
                      Text(
                        strDate,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(width: 15),
                      statusContainer(
                        width: 61,
                        height: 22,
                        statusText: (index % 2 == 0) ? 'Rất cao' : 'Vừa',
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
              statusText: (index % 2 == 0) ? 'Hoàn thành' : 'Chuẩn bị',
            ),
            DefaultTextStyle(
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(height: 1.7),
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
    );
  }

//------------
  Widget statusContainer({
    double width = 0,
    double height = 0,
    String statusText = 'Hoàn thành',
    EdgeInsetsGeometry margin = const EdgeInsets.all(0),
  }) =>
      Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: processColor(statusText),
        ),
        child: Text(
          statusText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 1.5,
          ),
        ),
      );
  //----------
  Color processColor(String string) {
    switch (string) {
      case 'Chuẩn bị' '':
        return Colors.grey;
      case 'Rất cao':
        return Colors.red;
      case 'Cao':
        return Colors.orange;
      case 'Đang tiến hành':
        return const Color.fromARGB(255, 0, 137, 215);
      case 'Vừa':
        return const Color.fromARGB(255, 0, 137, 215);
      case 'Hoàn thành':
        return const Color.fromARGB(255, 36, 161, 72);
      case 'Thấp':
        return const Color.fromARGB(255, 36, 161, 72);
      case 'Rất thấp':
        return const Color.fromARGB(255, 56, 215, 102);
      default:
        return Colors.black;
    }
  }
}
