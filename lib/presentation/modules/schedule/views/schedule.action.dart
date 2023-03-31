part of 'schedule_screen.dart';

extension ScheduleAction on _ScheduleState {
  void _blocListener(BuildContext context, ScheduleState state) {
    // logger.d('change state', state);
    // _refreshController
    //   ..refreshCompleted()
    //   ..loadComplete();
    BuildContext? dialogContext;
    if (state is ScheduleGetWorkOrderState &&
        state.status == BlocStatusState.loading) {
      showToast('Đang tải dữ liệu');

      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) => const Center(
      //       child: CircularProgressIndicator(),
      //     ),
      //   );
    }
    if (state is ScheduleGetWorkOrderState &&
        state.status == BlocStatusState.success) {
      showToast('Đã tải dữ liệu thành công');
      // Navigator.of(context, rootNavigator: true).pop();
    }
    if (state is ScheduleGetWorkOrderState &&
        state.status == BlocStatusState.failure) {
      showToast('Tải dữ liệu không thành công');
      // Navigator.of(context, rootNavigator: true).pop();
    }
  }

  void setDate(DateTime? setDate) {
    setState(() {
      currentDate = setDate ?? DateTime.now();
      strDate = DateFormat('dd/MM/yyyy').format(currentDate);
    });
    onGetWorkOrder();
  }

  Future<void> onGetWorkOrder() async {
    bloc.add(
      GetWorkOrderEvent(
        dateRequest: strDate,
        maintenanceTypeRequest:
            isCorrectiveMaintenance ? 'Khắc phục' : 'Đã lên lịch',
      ),
    );
  }

  Future<void> _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    await onGetWorkOrder();
  }

  void onTapTabBar() {
    isCorrectiveMaintenance = !isCorrectiveMaintenance;
    onGetWorkOrder();
    setState(() {});
  }

  Widget taskIcon({String? task}) {
    switch (task) {
      case 'Sửa chữa':
        return const Icon(
          Icons.build,
          size: 14,
        );
      case 'Thay khuôn':
        return const Icon(
          Icons.invert_colors,
          size: 14,
        );
      case 'Kiểm tra tổng quát':
        return const Icon(
          Icons.description,
          size: 14,
        );
      default:
        return const SizedBox();
    }
  }
}
