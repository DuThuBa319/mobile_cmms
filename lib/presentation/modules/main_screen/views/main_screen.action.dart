part of 'main_screen_view.dart';

extension MainScreenViewAction on _MainScreenViewState {
  Future<void> onGetListResponse() async {
    bloc.add(GetListMaintenanceResponsesEvent());
  }

  Future<void> onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    await onGetListResponse();
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
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (barcodeScanRes == '-1') {
      showToast('Quét không thành công');
    } else {
      textController = barcodeScanRes;
      showToast(textController);
    }
  }

  void scheduleNavigator() {
    Navigator.pushNamed(context, RouteList.schedule);
  }

  void maintenanceRequestNavigator() {
    Navigator.pushNamed(context, RouteList.request);
  }

  Widget taskIcon({String? task}) {
    switch (task) {
      case 'Sửa chữa':
        return const Icon(
          Icons.build,
          size: 18,
          color: Colors.black,
        );
      case 'Thay khuôn':
        return const Icon(
          Icons.invert_colors,
          size: 18,
          color: Colors.black,
        );
      case 'Kiểm tra tổng quát':
        return const Icon(
          Icons.description,
          size: 18,
          color: Colors.black,
        );
      default:
        return const SizedBox();
    }
  }

  void onTapWorkOrder({String? task, String? title, required String id}) {
    if (task == 'Sửa chữa') {
      goToScreen(
        RepairTaskScreen(
          title: title,
          responseId: id,
        ),
      );
    } else if (task == 'Thay khuôn') {
      goToScreen(
        ReplaceMoldTaskScreen(
          title: title,
        ),
      );
    } else {
      goToScreen(
        GeneralCheckScreen(title: title),
      );
    }
  }

  void goToScreen(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
