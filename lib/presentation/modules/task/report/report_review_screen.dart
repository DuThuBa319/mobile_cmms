import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../common_widget/export.dart';
import '../../../custom/custom_screen_form.dart';
import '../../../theme/theme_color.dart';

class ReportReviewScreen extends StatefulWidget {
  ReportReviewScreen({super.key, required this.title});
  String title;
  @override
  State<ReportReviewScreen> createState() => _ReportReviewScreenState();
}

class _ReportReviewScreenState extends State<ReportReviewScreen> {
  DropdownController<String, DropdownData<String>> hienTuongController =
      DropdownController<String, DropdownData<String>>(
    value: DropdownData(value: 'Máy không hoạt động', validation: null),
  );
  DropdownController<String, DropdownData<String>> nguyenNhanController =
      DropdownController<String, DropdownData<String>>(
    value: DropdownData(value: 'Gãy ty lói', validation: null),
  );
  DropdownController<String, DropdownData<String>> phuongAnController =
      DropdownController<String, DropdownData<String>>(
    value: DropdownData(value: 'Thay thế phụ kiện', validation: null),
  );

  List<String> hienTuong = const ['Máy không hoạt động', 'HT1', 'HT2'];
  List<String> nguyenNhan = const ['Gãy ty lói', 'NN1', 'NN2'];
  List<String> phuongAn = const ['Thay thế phụ kiện', 'PA1', 'PA2'];

  @override
  Widget build(BuildContext context) {
    final bodyTextStyle = Theme.of(context).textTheme.bodyText2;
    return CustomScreenForm(
      title: widget.title,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              direction: Axis.vertical,
              children: [
                Text(
                  'CHẨN ĐOÁN, PHƯƠNG ÁN',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: AppColor.gray767676),
                ),
                Text(
                  'Hiện tượng: ',
                  style: bodyTextStyle,
                ),
                Container(
                  width: 378,
                  height: 36,
                  child: DropdownWidget<String>(
                    controller: hienTuongController,
                    itemBuilder: itemBuilder,
                    borderColor: AppColor.gray767676,
                    items: hienTuong,
                  ),
                ),
                Text(
                  'Nguyên nhân: ',
                  style: bodyTextStyle,
                ),
                Container(
                  width: 378,
                  height: 36,
                  child: DropdownWidget<String>(
                    controller: nguyenNhanController,
                    itemBuilder: itemBuilder,
                    borderColor: AppColor.gray767676,
                    items: nguyenNhan,
                  ),
                ),
                Text(
                  'Phương án sữa chữa: ',
                  style: bodyTextStyle,
                ),
                Container(
                  width: 378,
                  height: 36,
                  child: DropdownWidget<String>(
                    controller: phuongAnController,
                    itemBuilder: itemBuilder,
                    borderColor: AppColor.gray767676,
                    items: phuongAn,
                  ),
                ),
                const SizedBox(height: 18),
//-------------------------------------------------//
                Text(
                  'BÁO CÁO KỸ THUẬT: ',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: AppColor.gray767676),
                ),
                Text(
                  'Hình ảnh báo cáo:',
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
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: AppColor.blue0089D7,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 360,
              height: 70,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Lưu',
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

  Widget itemBuilder(String item) {
    return Text(item, style: Theme.of(context).textTheme.bodyText2);
  }
}
