import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/utils/singletons.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../../../common_widget/date_picker/cupertino_date_picker_custom.dart';
import '../../../common_widget/smart_refresher_wrapper.dart';
import '../../../custom/custom_screen_form.dart';
import '../bloc/schedule_bloc.dart';
import 'widget/work_order_cell.dart';

part 'schedule.action.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleState();
}

class _ScheduleState extends StateBase<ScheduleScreen> {
  final _refreshController = RefreshController(initialRefresh: false);
  DateTime currentDate = DateTime.now();
  String strDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  bool isCorrectiveMaintenance = false;
  @override
  ScheduleBloc get bloc => BlocProvider.of(context);

  @override
  Widget buildBase(BuildContext context) {
    return BlocConsumer<ScheduleBloc, ScheduleState>(
      listener: _blocListener,
      builder: (context, state) {
        final isLogin = userDataData.isLogin;
        final theme = Theme.of(context);
        return CustomScreenForm(
          title: 'Lịch sửa chữa',
          isShowBottomAppBar: true,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: isCorrectiveMaintenance ? onTapTabBar : null,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 1,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 4),
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                          )
                        ],
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Đã lên lịch',
                        textAlign: TextAlign.center,
                        style: isCorrectiveMaintenance
                            ? Theme.of(context).textTheme.bodyText2
                            : Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: isCorrectiveMaintenance ? null : onTapTabBar,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 1,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-1, 4),
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                          )
                        ],
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Khắc phục',
                        textAlign: TextAlign.center,
                        style: isCorrectiveMaintenance
                            ? Theme.of(context).textTheme.headline5
                            : Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 32,
                width: 200,
                margin: const EdgeInsets.only(top: 30, bottom: 28),
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
              Expanded(
                child: SmartRefresher(
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  header: const WaterDropHeader(),
                  child: Builder(
                    builder: (context) {
                      if (state is ScheduleInitialState) {
                        onGetWorkOrder();
                      }

                      // if (state is ScheduleGetWorkOrderState &&
                      //     state.status == BlocStatusState.loading) {
                      //   return const Expanded(
                      //     child: Center(
                      //       child: Loading(
                      //         brightness: Brightness.light,
                      //       ),
                      //     ),
                      //   );
                      // }
                      if (state is ScheduleGetWorkOrderState &&
                          state.status == BlocStatusState.failure) {
                        return Text(
                          'Xảy ra lỗi khi tải dữ liệu',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Colors.red),
                        );
                      }
                      if (state is ScheduleGetWorkOrderState &&
                          state.status == BlocStatusState.success &&
                          state.viewModel.workOrders?.isEmpty == true) {
                        return Center(
                          child: Text(
                            'Ngày này không có dữ liệu',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(color: Colors.red),
                          ),
                        );
                      }
                      return Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: state.viewModel.workOrders?.length ?? 0,
                          itemBuilder: (context, index) {
                            return WorkOrderCell(
                              workOrderEntity:
                                  state.viewModel.workOrders?[index],
                              taskIcon: taskIcon(
                                task: state.viewModel.workOrders?[index].task,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
