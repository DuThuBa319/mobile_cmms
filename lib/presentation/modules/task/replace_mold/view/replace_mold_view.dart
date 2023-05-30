import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../base/base.dart';
import '../../../../custom/audio_picker/audio_picker_bloc/audio_picker_bloc.dart';
import '../../../../custom/audio_picker/audio_picker_widget.dart';
import '../../../../custom/general_report_container.dart';
import '../../../../custom/image_picker/image_picker_bloc/image_picker_bloc.dart';
import '../../../../custom/image_picker/image_picker_widget.dart';
import '../../../../theme/theme_color.dart';

import 'panel_expansion.dart';
import 'replace_mold_screen.dart';

class ReplaceMoldView extends StatefulWidget {
  const ReplaceMoldView({super.key});

  @override
  State<ReplaceMoldView> createState() => _ReplaceMoldViewState();
}

class _ReplaceMoldViewState extends StateBase<ReplaceMoldView> {
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
              ImagePickerGridView(
                  bloc: bloc, isEnable: false, receiveBloc: null),
            ],
          ),
          Text(
            'Ghi âm báo cáo: ',
            style: bodyTextStyle,
          ),
          AudioListView(bloc: audioBloc, isEnable: false, receiveBloc: null),
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
              onPressed: () {
                Navigator.pop(context);
              },
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
