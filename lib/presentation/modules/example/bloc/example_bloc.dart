import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/weather_entity.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../usecase/example_usecase.dart';

part 'example_event.dart';
part 'example_state.dart';

@injectable
class ExampleBloc extends AppBlocBase<ExampleEvent, ExampleState> {
  final ExampleUsecase _usecase;

  ExampleBloc(this._usecase) : super(ExampleInitialState()) {
    on<GetWeatherEvent>(_onGetWeather);
  }

  Future<void> _onGetWeather(
    GetWeatherEvent event,
    Emitter<ExampleState> emit,
  ) async {
    emit(
      ExampleGetWeatherState(
        status: BlocStatusState.loading,
      ),
    );
    final response = await _usecase.getWeather();
    final newViewModel = state.viewModel.copyWith(weathers: response);
    emit(
      state.copyWith(
        status: BlocStatusState.success,
        viewModel: newViewModel,
      ),
    );
  }
}
