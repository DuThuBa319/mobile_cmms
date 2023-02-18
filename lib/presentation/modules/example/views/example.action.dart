part of 'example_screen.dart';

extension ExampleAction on _ExampleState {
  void _blocListener(BuildContext context, ExampleState state) {
    // logger.d('change state', state);
    // _refreshController
    //   ..refreshCompleted()
    //   ..loadComplete();
    if (state is ExampleGetWeatherState &&
        state.status == BlocStatusState.success) {
      showToast('Đã tải dữ liệu thành công');
    }
  }

  Future<void> onGetWeather() async {
    final startDate = DateFormat('yyyy-MM-dd').format(dateFrom);
    final endDate = DateFormat('yyyy-MM-dd').format(dateTo);
    bloc.add(
      GetWeatherEvent(
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
      initialDate: isSelectedDateFrom ? dateFrom : dateTo,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (datePicker != null) {
      setState(() {
        if (isSelectedDateFrom) {
          dateFrom = datePicker;
          strDateFrom = DateFormat('dd/MM').format(datePicker);
        } else {
          dateTo = datePicker;
          strDateTo = DateFormat('dd/MM').format(datePicker);
        }
      });
      if (dateTo.isBefore(dateFrom)) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
              'Chọn sai thời gian.',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.red),
            ),
          ),
        );
      }
    }
  }
}
