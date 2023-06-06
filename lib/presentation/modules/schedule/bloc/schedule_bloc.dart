import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/cmms/maintenance_response_entity.dart';
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

    on<GetListMaintenanceResponsesEvent>(_onGetListMaintenanceResponses);
  }

  Future<void> _onGetListMaintenanceResponses(
    GetListMaintenanceResponsesEvent event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(
      ScheduleGetWorkOrderState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final responses = await _usecase.getListMaintenanceResponse();
      final list = <MaintenanceResponseEntity>[];
      for (final response in responses!) {
        if (response.searchDate == event.dateRequest &&
            response.maintenanceType == event.maintenanceTypeRequest) {
          list.add(response);
        }
      }
      final newViewModel = state.viewModel.copyWith(responses: list);
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
        maintenanceTypeRequest: event.maintenanceTypeRequest!,
      );
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
