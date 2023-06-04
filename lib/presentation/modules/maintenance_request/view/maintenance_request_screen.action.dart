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
                  Navigator.pop(context, true);
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
      objectCodeSelection = <String>['<Chọn mã thiết bị>'];

      objectCodeSelection.addAll(state.viewModel.objectCode ?? []);
    }
    if (state is GetEmployeesState && state.status == BlocStatusState.success) {
      employee = <String>[
        '<Chọn KTV>',
      ];

      employee.addAll(state.viewModel.employeeName ?? []);
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
    objectCode = value;

    requestInfoBloc.add(GetEquipmentNameEvent(code: value));
  }

  void equipmentTypeChanged(dynamic value) {
    objectCodeController = DropdownController<String, DropdownData<String>>(
      value: DropdownData(value: objectCodeSelection[0], validation: null),
    );
    if (value == 'Khuôn ép') {
      requestInfoBloc.add(
        GetEquipmentCodeEvent(maintenanceObject: MaintenanceObject.mold),
      );
    } else {
      requestInfoBloc.add(GetEquipmentCodeEvent(type: value));
    }
  }

  void employeeChanged(dynamic value) {
    requestInfoBloc.add(
      EmployeeChangedEvent(name: value),
    );
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
    if (value == 'Kiểm tra tổng quát') {
      maintenanceType = MaintenanceType.preventiveInspection;
    }
  }

  void selectTime(GetRequestInfoState state, BuildContext context) async {
    if (state.viewModel.isEnable!) {
      DateTime? date = await pickDate();
      if (date == null) return;
      TimeOfDay? time = await pickTime();
      if (time == null) return;
      currentDate =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);
      requestInfoBloc.add(ChangeDateEvent(selectedDate: currentDate));
    }
  }

  Future<DateTime?> pickDate() {
    return showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
  }

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: currentDate.hour, minute: currentDate.minute));

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

  void createRequest(GetRequestInfoState state) {
    if (state.viewModel.isEnable!) {
      if (state.viewModel.employeeId == null) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => Center(
            child: AlertDialog(
              title: const Text('Phản hồi'),
              content: Text(
                'Vui lòng chọn KTV',
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
      } else {
        bloc.add(
          MakeRequestEvent(
            imageFiles: imageFiles,
            audioFiles: audioFiles,
            priority: priority,
            problem: descriptionTextController.text,
            requestedCompletionDate: currentDate,
            type: maintenanceType,
            objectCode: objectCode,
            requestorCode: state.viewModel.employeeId,
            maintenanceObject: state.viewModel.maintenanceObject,
          ),
        );
      }
    }
  }
}
