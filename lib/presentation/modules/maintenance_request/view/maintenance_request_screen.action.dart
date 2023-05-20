part of 'maintenance_request_screen_view.dart';

extension MaintenanceRequestViewAction on _MaintenanceRequestViewState {
  void _requestBlocListener(BuildContext context, RequestState state) {
    if (state is MakeRequestState && state.status == BlocStatusState.loading) {
      showToast('Đang gửi dữ liệu');
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (state is MakeRequestState && state.status == BlocStatusState.success) {
      // showToast('Đã gửi dữ liệu thành công');
      Navigator.pop(context);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Center(
          child: AlertDialog(
            title: const Text('Phản hồi'),
            content: Text(
              'Đã gửi dữ liệu thành công',
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
    if (state is MakeRequestState && state.status == BlocStatusState.failure) {
      // showToast('Gửi dữ liệu không thành công');
      Navigator.pop(context);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Center(
          child: AlertDialog(
            title: const Text('Phản hồi'),
            content: const Text('Gửi dữ liệu không thành công'),
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
      // Navigator.of(context, rootNavigator: true).pop();
    }
  }

  void _requestInfoBlocListener(
    BuildContext context,
    GetRequestInfoState state,
  ) {
    if (state.status == BlocStatusState.loading) {
      showToast('Đang tải dữ liệu');
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (state is GetEquipmentCodeState &&
        state.status == BlocStatusState.success) {
      equipmentCodeSelection = <String>['<Chọn mã thiết bị>'];

      check = false;
      equipmentCodeSelection.addAll(state.viewModel.equipmentCode ?? []);
    }
    if (state is GetEmployeesState && state.status == BlocStatusState.success) {
      employee = <String>[
        '<Chọn KTV>',
      ];

      employee.addAll(state.viewModel.employeeId ?? []);
    }

    if (state.status == BlocStatusState.success) {
      Navigator.of(context).pop();
      showToast('Đã tải dữ liệu thành công');
    }
    if (state.status == BlocStatusState.failure) {
      Navigator.of(context).pop();
      showToast('Tải dữ liệu không thành công');
    }
  }

  void equipmentCodeChanged(dynamic value) {
    equipmentCode = value;
    if (value == '<Chọn mã thiết bị>') {
      check = false;
    } else {
      check = true;
      requestInfoBloc.add(GetEquipmentNameEvent(code: value));
    }
  }

  void equipmentTypeChanged(dynamic value) {
    requestInfoBloc.add(GetEquipmentCodeEvent(type: value));
  }

  void employeeChanged(dynamic value) {
    requestorId = value;
  }

  void priorityChanged(dynamic value) {
    priority = value;
  }

  void maintenanceTypeChanged(dynamic value) {
    if (value == 'Khắc phục') {
      maintenanceType = MaintenanceType.reactive;
    }
    if (value == 'Phòng ngừa') {
      maintenanceType = MaintenanceType.preventive;
    }
    if (value == 'Dự đoán') {
      maintenanceType = MaintenanceType.predictive;
    }
  }

  void setDate(DateTime? setDate) {
    currentDate = setDate ?? DateTime.now();
    requestInfoBloc.add(ChangeDateEvent(selectedDate: currentDate));
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
    return list[0].causeName;
  }
}
