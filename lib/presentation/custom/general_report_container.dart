import 'package:flutter/material.dart';

import '../theme/theme_color.dart';

Widget GeneralReportContainer({String? task}) => Container(
      margin: const EdgeInsets.only(bottom: 28),
      padding: const EdgeInsets.fromLTRB(17, 10, 16, 0),
      width: 389,
      height: 204,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.greyF3,
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: const [
                Text('Công việc:'),
                Text('Thiết bị:'),
                Text('Mã số:'),
                Text('Thời gian bắt đầu:'),
                Text('Thời gian hoàn thành:'),
                Text('Thời gian:')
              ],
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              direction: Axis.vertical,
              spacing: 10,
              children: [
                Text(task!),
                const Text('Máy ép'),
                const Text('M39'),
                const Text('16:22 16/12/2022'),
                const Text('17:32 16/12/2022'),
                const Text('70 phút')
              ],
            ),
          ],
        ),
      ),
    );