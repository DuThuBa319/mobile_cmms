import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../custom/general_report_container.dart';
import '../../../../theme/theme_color.dart';
import 'panel_expansion.dart';
import 'replace_mold_screen.dart';

class ReplaceMoldView extends StatefulWidget {
  const ReplaceMoldView({super.key});

  @override
  State<ReplaceMoldView> createState() => _ReplaceMoldViewState();
}

class _ReplaceMoldViewState extends State<ReplaceMoldView> {
  @override
  Widget build(BuildContext context) {
    final bodyTextStyle = Theme.of(context).textTheme.bodyText2;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GeneralReportContainer(task: 'Thay khuôn'),

          Text(
            'KHUÔN ÉP: ',
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: AppColor.gray767676),
          ),

          PanelExpansion(expansionItem: moldInfo[0]),
          PanelExpansion(expansionItem: moldInfo[1]),
//-------------------------------------------------//
          const SizedBox(
            height: 12,
          ),
          Wrap(
            spacing: 8,
            direction: Axis.vertical,
            children: [
              Text(
                'BÁO CÁO KỸ THUẬT: ',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: AppColor.gray767676),
              ),
              Text(
                'Hình ảnh báo cáo: ',
                style: bodyTextStyle,
              ),
              Container(
                padding: const EdgeInsets.only(right: 40, top: 10),
                width: MediaQuery.of(context).size.width,
                height: 210,
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  children: List.generate(
                    6,
                    (index) => DottedBorder(
                      color: AppColor.blue0089D7,
                      strokeWidth: 1.5,
                      dashPattern: const [
                        2,
                        2,
                      ],
                      radius: const Radius.circular(4),
                      child: Container(
                        width: 84,
                        height: 84,
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: AppColor.blue0089D7,
                            size: 40,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Ghi âm báo cáo: ',
            style: bodyTextStyle,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.blue0089D7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: AppColor.blue0089D7,
                size: 25,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 30,
          ),
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
    );
  }

  Widget itemBuilder(String item) {
    return Text(item, style: Theme.of(context).textTheme.bodyText2);
  }
}
