import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/cmms/cmms_enum.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../../../common_widget/loading.dart';
import '../../../common_widget/smart_refresher_wrapper.dart';
import '../../../route/route_list.dart';
import '../../../theme/theme_color.dart';
import '../../add_material/view/add_material_screen.dart';
import '../../maintenance_request/view/maintenance_request_screen.dart';
import '../../task/general_check/view/general_check_screen.dart';
import '../../task/repair_task/view/repair_task_screen.dart';
import '../../task/replace_mold/view/replace_mold_screen.dart';
import '../bloc/main_screen_bloc.dart';

part 'main_screen.action.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends StateBase<MainScreenView> {
  late String textController;
  final _refreshController = RefreshController(initialRefresh: false);
  @override
  MainScreenBloc get bloc => BlocProvider.of(context);

  @override
  Widget buildBase(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            color: const Color.fromARGB(255, 234, 234, 234),
            width: 396,
            height: 170,
          ),
          LineDivider(),
          Row(
            children: [
              BoxIcon(
                Icons.calendar_month,
                'Lịch sửa chữa',
                function: scheduleNavigator,
              ),
              BoxIcon(Icons.qr_code_scanner, 'Quét mã', function: scanQR),
              BoxIcon(
                Icons.send,
                'Tạo yêu cầu',
                function: maintenanceRequestNavigator,
              ),
            ],
          ),
          LineDivider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 24, 0, 8),
            child: Text(
              'Gần đây',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Builder(
            builder: (context) {
              if (state is MainScreenInitialState) {
                onGetListResponse();
              }
              if (state is MainScreenGetResponseState &&
                  state.status == BlocStatusState.loading) {
                return const Expanded(
                  child: Center(
                    child: Loading(
                      brightness: Brightness.light,
                    ),
                  ),
                );
              }
              if (state is MainScreenGetResponseState &&
                  state.status == BlocStatusState.failure) {
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Xảy ra lỗi khi tải dữ liệu',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.red),
                      ),
                      IconButton(
                        onPressed: onRefresh,
                        icon: const Icon(Icons.refresh),
                      )
                    ],
                  ),
                );
              }
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 3, bottom: 20),
                  child: SmartRefresher(
                    controller: _refreshController,
                    onRefresh: onRefresh,
                    header: const WaterDropHeader(),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: state.viewModel.responses?.length,
                      itemBuilder: (context, index) => InfoCard(
                        id: state.viewModel.responses?[index].id,
                        taskIcon: state.viewModel.responses?[index].taskIcon,
                        equipmentName:
                            state.viewModel.responses?[index].code ?? '--',
                        // updatedTime: state.viewModel.responses?[index].updatedAt
                        //         ?.toIso8601String() ??
                        //     '--',
                        updatedTime:
                            state.viewModel.responses?[index].updatedDate ??
                                '--',
                        task:
                            state.viewModel.responses?[index].maintenanceTask ??
                                '--',
                        equipmentCode:
                            state.viewModel.responses?[index].objectCode ??
                                '--',
                        equipmentType: state.viewModel.responses?[index]
                                    .maintenanceObject ==
                                MaintenanceObject.equipment
                            ? 'Máy ép'
                            : 'Khuôn ép',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Card InfoCard({
    Widget? taskIcon,
    String? equipmentName,
    String? updatedTime,
    String? task,
    String? equipmentCode,
    String? equipmentType,
    required String? id,
  }) {
    final textStyle =
        Theme.of(context).textTheme.headline4?.copyWith(fontSize: 12);
    return Card(
      shadowColor: Colors.transparent,
      color: AppColor.greyF3,
      margin: const EdgeInsets.fromLTRB(24, 5, 24, 5),
      child: ListTile(
        onTap: () {
          onTapWorkOrder(task: task, title: equipmentName, id: id!);
        },
        horizontalTitleGap: 0, // khoang cach gia icon va tiltle
        dense: true,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        contentPadding: const EdgeInsets.fromLTRB(14, 3, 7, 2),
        leading: taskIcon,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              equipmentName!,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text(
                  equipmentType ?? '--',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
                Text(
                  equipmentCode ?? '--',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        subtitle: Text(
          updatedTime!,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                height: 2,
              ),
        ),
      ),
    );
  }

  Widget LineDivider() => const Divider(
        indent: 32,
        endIndent: 32,
        thickness: 1,
        color: Color.fromARGB(255, 220, 220, 220),
      );

  Widget BoxIcon(IconData icon, String text, {Function()? function}) {
    return Container(
      margin: const EdgeInsets.fromLTRB(23, 20, 10, 20),
      child: Column(
        children: [
          IconButton(
            padding: const EdgeInsets.only(bottom: 8, right: 5),
            onPressed: function ?? () {},
            icon: Icon(
              icon,
              size: 35,
            ),
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
