import 'package:flutter/material.dart';

import '../../../../custom/general_report_container.dart';
import '../../../../theme/theme_color.dart';
import 'general_check_screen.dart';
import 'general_check_widget.dart';

class GeneralCheckView extends StatefulWidget {
  const GeneralCheckView({super.key});

  @override
  State<GeneralCheckView> createState() => _GeneralCheckViewState();
}

class _GeneralCheckViewState extends State<GeneralCheckView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralReportContainer(task: 'Kiểm tra tổng quát'),
            RowTile(title: 'KIỂM TRA ĐIỆN:'),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: listWork.length,
              itemBuilder: (context, index) => RowCheckBox(index: index),
              separatorBuilder: (context, index) {
                if (index == 6) {
                  return RowTile(isSeparate: true, title: 'KIỂM TRA CƠ');
                }
                if (index == 11) {
                  return RowTile(
                    isSeparate: true,
                    title: 'KIỂM TRA CẢO NHIỆT',
                  );
                }
                return const SizedBox();
              },
            ),
            const SizedBox(height: 60),
            Container(
              decoration: BoxDecoration(
                color: AppColor.greyD9,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 360,
              height: 70,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Lưu',
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 40),
              decoration: BoxDecoration(
                color: AppColor.blue0089D7,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 360,
              height: 70,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Kết thúc công việc',
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
