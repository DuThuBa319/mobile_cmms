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
    bloc.add(GetWeatherEvent());
  }
}
