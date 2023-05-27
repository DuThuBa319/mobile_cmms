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
    // if (receiveState is LoadFileState &&
    //     receiveState.status == BlocStatusState.success) {
    //   imageBloc.add(
    //       ReceiveImageEvent(imageFiles: receiveState.viewModel.imageFiles));
    // }
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
}
