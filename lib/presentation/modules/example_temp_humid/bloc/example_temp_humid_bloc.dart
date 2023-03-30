import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/temperature_entity.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../usecase/example_temp_humid_usecase.dart';

part 'example_temp_humid_event.dart';
part 'example_temp_humid_state.dart';

@injectable
class ExampleTempHumidBloc
    extends AppBlocBase<ExampleTempHumidEvent, ExampleTempHumidState> {
  final ExampleTempHumidUsecase _usecase;

  ExampleTempHumidBloc(this._usecase) : super(ExampleInitialState()) {
    on<GetTemperatureEvent>(_onGetTemperatureHourly);
  }

  Future<void> _onGetTemperatureHourly(
    GetTemperatureEvent event,
    Emitter<ExampleTempHumidState> emit,
  ) async {
    emit(
      ExampleGetTemperatureState(
        status: BlocStatusState.loading,
      ),
    );
    final response = await _usecase.getTemperatureHourly(
      startDate: event.startDate,
      endDate: event.endDate,
      latitude: event.latitude,
      longtitude: event.longtitude,
    );
    final newViewModel = state.viewModel.copyWith(weathers: response);
    emit(
      state.copyWith(
        status: BlocStatusState.success,
        viewModel: newViewModel,
      ),
    );
  }
}
