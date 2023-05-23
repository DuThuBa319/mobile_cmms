part of 'repair_task_view.dart';

extension RepairTaskViewAction on _RepairTaskViewState {
  void _blocListener(BuildContext context, RepairTaskState state) {
    BuildContext? dialogContext;
    if (state is GetMaintenanceResponseState &&
        state.status == BlocStatusState.loading) {
      showToast('Đang tải dữ liệu');
    }
    if (state is GetMaintenanceResponseState &&
        state.status == BlocStatusState.success) {
      showToast('Đã tải dữ liệu thành công');
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

  String? textCause({List<CauseEntity>? list}) {
    if (list == null) {
      return '<Chọn nguyên nhân>';
    }
    if (list.isEmpty) {
      return '<Chọn nguyên nhân>';
    }
    if (list.length > 1) {
      return 'Nhiều nguyên nhân';
    }
    return list[0].name;
  }

  String? textCorrection({List<CorrectionEntity>? list}) {
    if (list == null) {
      return '<Chọn phương án>';
    }
    if (list.isEmpty) {
      return '<Chọn phương án>';
    }
    if (list.length > 1) {
      return 'Nhiều phương án';
    }
    return list[0].name;
  }
}
