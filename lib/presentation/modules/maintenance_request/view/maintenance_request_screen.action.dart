part of 'maintenace_request_screen_view.dart';

extension MaintenanceRequestViewAction on _MaintenanceRequestViewState {
  void _requestBlocListener(BuildContext context, RequestState state) {
    if (state is MakeRequestState && state.status == BlocStatusState.loading) {
      showToast('Đang tải dữ liệu');
    }
    if (state is MakeRequestState && state.status == BlocStatusState.success) {
      showToast('Đã tải dữ liệu thành công');
      Navigator.pop(context);
      // Navigator.of(context, rootNavigator: true).pop();
    }
    if (state is MakeRequestState && state.status == BlocStatusState.failure) {
      showToast('Tải dữ liệu không thành công');

      // Navigator.of(context, rootNavigator: true).pop();
    }
  }

  void equipmentChanged(dynamic value) {
    if (value == 'Khuôn ép') {
      setState(() {
        moldSelected = true;
      });
    }
  }
}
