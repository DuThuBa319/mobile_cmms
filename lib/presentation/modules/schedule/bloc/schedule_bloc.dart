import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/work_order_entity.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../usecase/schedule_usecase.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

@injectable
class ScheduleBloc extends AppBlocBase<ScheduleEvent, ScheduleState> {
  final ScheduleUsecase _usecase;

  ScheduleBloc(this._usecase) : super(ScheduleInitialState()) {
    on<GetWorkOrderEvent>(_onGetWorkOrder);
  }

  Future<void> _onGetWorkOrder(
    GetWorkOrderEvent event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(
      ScheduleGetWorkOrderState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final response = await _usecase.getWorkOrder(
          dateRequest: event.dateRequest!,
          maintenanceTypeRequest: event.maintenanceTypeRequest!);
      final newViewModel = state.viewModel.copyWith(workOrders: response);
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(status: BlocStatusState.failure));
    }
  }
}
