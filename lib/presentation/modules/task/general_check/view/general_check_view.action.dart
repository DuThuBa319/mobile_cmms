part of 'general_check_view.dart';

extension GeneralCheckViewAction on _GeneralCheckViewState {
  void _blocListener(BuildContext context, GeneralCheckState state) {
    if (state.status == BlocStatusState.loading) {
      if (state is GetMaintenanceResponseState) {
        showToast('Đang tải dữ liệu');
      }
      if (state is UpdateMaintenanceResponseState) {
        showToast('Đang cập nhật dữ liệu');
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    }

    if (state.status == BlocStatusState.success) {
      if (state is GetMaintenanceResponseState) {
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
      if (state is UpdateMaintenanceResponseState) {
        Navigator.pop(context);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => Center(
            child: AlertDialog(
              title: const Text('Phản hồi'),
              content: Text(
                'Cập nhật công việc thành công',
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
      }
      if (state is StartTaskState) {
        successAlert(
          context,
          alertText: 'Công việc đã bắt đầu',
        );
      }
      if (state is FinishTaskState) {
        successAlert(
          context,
          alertText: 'Công việc đã kết thúc',
        );
      }
      if (state.status == BlocStatusState.failure) {
        showToast('Tải dữ liệu không thành công');
        if (state is GetMaintenanceResponseState) {
          failureAlert(
            context,
            alertText: 'Tải dữ liệu không thành công',
          );
        }
        if (state is UpdateMaintenanceResponseState ||
            state is FinishTaskState ||
            state is StartTaskState) {
          Navigator.pop(context);
          failureAlert(
            context,
            alertText: 'Lưu thay đổi không thành công',
          );
        }
      }
    }
  }
}

Future<dynamic> commonAlert(BuildContext context,
    {required String alertText,
    required String exiText,
    Color? textColor = Colors.black}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => Center(
      child: AlertDialog(
        title: const Text('Phản hồi'),
        content: Text(
          alertText,
          style:
              Theme.of(context).textTheme.caption!.copyWith(color: textColor),
        ),
        actions: [
          TextButton(
            child: Text(exiText),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}

Future<dynamic> successAlert(
  BuildContext context, {
  required String alertText,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => Center(
      child: AlertDialog(
        title: const Text('Phản hồi'),
        content: Text(
          alertText,
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: Colors.black),
        ),
        actions: [
          TextButton(
            child: Text('Thoát'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}

Future<dynamic> failureAlert(BuildContext context,
    {required String alertText}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => Center(
      child: AlertDialog(
        title: const Text('Phản hồi'),
        content: Text(
          alertText,
          style:
              Theme.of(context).textTheme.caption!.copyWith(color: Colors.red),
        ),
        actions: [
          TextButton(
            child: Text('Thực hiện lại'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}
