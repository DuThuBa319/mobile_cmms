import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../base/base.dart';
import '../../../common_widget/export.dart';
import '../../../custom/audio_picker/audio_picker_widget.dart';
import '../../../custom/image_picker/image_picker_widget.dart';
import '../../../theme/theme_color.dart';
import '../../maintenance_request/bloc/audio_picker_bloc/audio_picker_bloc.dart';
import '../../maintenance_request/bloc/image_picker_bloc/image_picker_bloc.dart';

class ReportReviewView extends StatefulWidget {
  const ReportReviewView({super.key});

  @override
  State<ReportReviewView> createState() => _ReportReviewViewState();
}

class _ReportReviewViewState extends StateBase<ReportReviewView> {
  @override
  ImagePickerBloc get bloc => BlocProvider.of(context);

  AudioPickerBloc get audioBloc => BlocProvider.of(context);
  @override
  Widget buildBase(BuildContext context) {
    final bodyTextStyle = Theme.of(context).textTheme.bodyText2;
    return SingleChildScrollView(
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
            ],
          ),
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

          ImagePickerGridView(bloc: bloc),

          Text(
            'Ghi âm báo cáo: ',
            style: bodyTextStyle,
          ),
          AudioListView(bloc: audioBloc),
          const SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: AppColor.blue0089D7,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 360,
            height: 70,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
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
    );
  }

  Widget itemBuilder(String item) {
    return Text(item, style: Theme.of(context).textTheme.bodyText2);
  }

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
}
