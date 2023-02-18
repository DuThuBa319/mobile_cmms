part of 'example_temp_humid_screen.dart';

extension ExampleTempHumidAction on _ExampleTempHumidState {
  void _blocListener(BuildContext context, ExampleTempHumidState state) {
    // logger.d('change state', state);
    // _refreshController
    //   ..refreshCompleted()
    //   ..loadComplete();
    if (state is ExampleGetTemperatureState &&
        state.status == BlocStatusState.success) {
      showToast('Đã tải dữ liệu thành công');
    }
  }

  Future<void> onGetTemperature() async {
    final startDate = DateFormat('yyyy-MM-dd').format(date);
    final endDate = DateFormat('yyyy-MM-dd').format(date);
    bloc.add(
      GetTemperatureEvent(
        startDate: startDate,
        endDate: endDate,
        latitude: latitude.text,
        longtitude: longtitude.text,
      ),
    );
  }

  selectedDate({bool isSelectedDateFrom = true}) async {
    final datePicker = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (datePicker != null) {
      setState(() {
        date = datePicker;
        strStartDate = DateFormat('dd/MM/yyyy').format(datePicker);
      });
    }
  }
}
