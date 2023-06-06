part of 'general_check_view.dart';

extension GeneralCheckViewAction on _GeneralCheckViewState {
  void _blocListener(BuildContext context, GeneralCheckState state) {
    BuildContext? dialogContext;
    if (state is GetMaintenanceResponseState &&
        state.status == BlocStatusState.loading) {
      showToast('Đang tải dữ liệu');
    }
    if (state is GetMaintenanceResponseState &&
        state.status == BlocStatusState.success) {
      showToast('Đã tải dữ liệu thành công');

      taskDropdownControllers = List.generate(
        20,
        (index) => DropdownController<String, DropdownData<String>>(
          value: DropdownData<String>(
            value: state.viewModel.inspectionReports![index].inspectionStatus,
            validation: null,
          ),
        ),
      );
      if (state.viewModel.responseEntity!.status ==
          MaintenanceStatus.inProgress) {
        isInProgress = true;
      } else {
        isInProgress = false;
      }
    }
    if (state is GetMaintenanceResponseState &&
        state.status == BlocStatusState.failure) {
      showToast('Tải dữ liệu không thành công');
    }
    if (state is UpdateMaintenanceResponseState &&
        state.status == BlocStatusState.loading) {
      showToast('Đang cập nhật dữ liệu');
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (state is UpdateMaintenanceResponseState &&
        state.status == BlocStatusState.success) {
      Navigator.pop(context);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Center(
          child: AlertDialog(
            title: const Text('Phản hồi'),
            content: Text(
              'Đã cập nhật dữ liệu thành công',
              style: Theme.of(context).textTheme.caption,
            ),
            actions: [
              TextButton(
                child: const Text('Thoát'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  widget.scheduleBloc!.add(
                    GetListMaintenanceResponsesEvent(
                      dateRequest: widget.selectedDate,
                      maintenanceTypeRequest: 'Đã lên lịch',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );

      // Navigator.of(context, rootNavigator: true).pop();
    }
    if (state is UpdateMaintenanceResponseState &&
        state.status == BlocStatusState.failure) {
      Navigator.pop(context);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Center(
          child: AlertDialog(
            title: const Text('Phản hồi'),
            content: Text(
              'Cập nhật dữ liệu không thành công',
              style: Theme.of(context).textTheme.caption,
            ),
            actions: [
              TextButton(
                child: const Text('Thực hiện lại'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
