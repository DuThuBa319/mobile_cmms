part of 'repair_task_view.dart';

extension RepairTaskViewAction on _RepairTaskViewState {
  void _blocListener(BuildContext context, RepairTaskState state) {
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
        materialItems = state.viewModel.materialMenuItems!;
        if (state.viewModel.responseEntity!.status ==
            MaintenanceStatus.inProgress) {
          isInProgress = true;
        } else {
          isInProgress = false;
        }
        listCauseSelected = state.viewModel.listCausesSelected!;
        listCorrectionSelected = state.viewModel.listCorrectionsSelected!;
        receiveBloc.add(
          ReceiveInfoInitialEvent(
            listCauseSelected: listCauseSelected,
            listCorrectionSelected: listCorrectionSelected,
            imageFiles: state.viewModel.imageFiles,
            audioFiles: state.viewModel.audioFiles,
          ),
        );
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
                        maintenanceTypeRequest: 'Khắc phục',
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
      if (state is GetMaterialState) {
        materialItems = state.viewModel.materialMenuItems!;
      }
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
      if (state is GetMaterialState) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => Center(
            child: AlertDialog(
              title: const Text('Phản hồi'),
              content: Text(
                'Linh kiện không khả dụng',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.red),
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

  void _receiveBlocListener(
    BuildContext context,
    ReceiveInfoSelectionState receiveState,
  ) {
    if (receiveState is ReceiveCauseState &&
        receiveState.status == BlocStatusState.success) {
      bloc.add(
        ReceiveCauseIdEvent(
          listCauseId: receiveState.viewModel.listCauseId,
        ),
      );
    }

    if (receiveState is ReceiveCorrectionState &&
        receiveState.status == BlocStatusState.success) {
      bloc.add(
        ReceiveCorrectionIdEvent(
          listCorrectionId: receiveState.viewModel.listCorrectionId,
        ),
      );
    }
    if (receiveState is ReceiveImageFileState &&
        receiveState.status == BlocStatusState.success) {
      bloc.add(
        ReceiveListImageFileEvent(
          imageFiles: receiveState.viewModel.imageFiles,
        ),
      );
    }
    if (receiveState is ReceiveAudioFileState &&
        receiveState.status == BlocStatusState.success) {
      bloc.add(
        ReceiveListAudioFileEvent(
          audioFiles: receiveState.viewModel.audioFiles,
        ),
      );
    }
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#e60000',
        'Cancel',
        true,
        ScanMode.QR,
      );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (barcodeScanRes == '-1') {
      showToast('Quét không thành công');
    } else {
      textController = barcodeScanRes;
      showToast(textController);
      bloc.add(GetMaterialEvent(sku: textController));
    }
  }
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
