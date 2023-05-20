import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../data/models/cmms/cmms_enum.dart';
import '../../../../../data/models/cmms/maintenance_response/maintenance_response_item.dart';
import '../../../../../data/models/cmms/put/update_response.dart';
import '../../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../../domain/entities/cmms/maintenance_response_entity.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../../repository/response_repository.dart';
import '../../usecase/response_usecase.dart';

part 'repair_task_event.dart';
part 'repair_task_state.dart';

@injectable
class RepairTaskBloc extends AppBlocBase<RepairTaskEvent, RepairTaskState> {
  final ResponseUsecase _usecase;
  final ResponseRepository _repository;

  RepairTaskBloc(this._usecase, this._repository)
      : super(RepairTaskInitialState()) {
    on<GetMaintenanceResponseEvent>(_onGetMaintenanceResponses);
    on<StartTaskEvent>(_onStartTask);
    on<FinishTaskEvent>(_onFinishTask);
    on<ReceiveCauseEvent>(_onReceiveCauses);
    on<SaveChangeEvent>(_onSaveChange);
  }

  Future<void> _onGetMaintenanceResponses(
    GetMaintenanceResponseEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      GetMaintenanceResponseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final listCauseEntity = <CauseEntity>[];
      final response = await _repository.getMaintenanceResponse(
        responseId: event.responseId,
      );

      final responseEntity = response.getMaintenanceResponseItemEntity();
      for (final item in responseEntity!.cause!) {
        listCauseEntity.add(item.getCauseEntity());
      }
      final update = UpdateResponse().copyWith(
        actualFinishTime: response.items?[0].actualFinishTime,
        actualStartTime: response.items?[0].actualStartTime,
        status: response.items?[0].status,
        updatedAt: response.items?[0].updatedAt,
      );
      final newViewModel = state.viewModel.copyWith(
        responseEntity: responseEntity,
        response: response,
        updateResponse: update,
        listCausesSelected: listCauseEntity,
      );
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

  Future<void> _onStartTask(
    StartTaskEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      UpdateMaintenanceResponseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final update = state.viewModel.updateResponse!.copyWith(
        actualStartTime: DateTime.now().toUtc(),
        status: MaintenanceStatus.inProgress,
        updatedAt: DateTime.now().toUtc(),
      );
      final newViewModel = state.viewModel.copyWith(
        updateResponse: update,
      );
      await _repository.updateMaintenanceResponse(
        maintenanceResponseId: state.viewModel.responseEntity!.id!,
        updateResponse: update,
      );

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

  Future<void> _onFinishTask(
    FinishTaskEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      UpdateMaintenanceResponseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final update = state.viewModel.updateResponse!.copyWith(
        actualFinishTime: DateTime.now().toUtc(),
        status: MaintenanceStatus.completed,
        updatedAt: DateTime.now().toUtc(),
      );
      final newViewModel = state.viewModel.copyWith(
        updateResponse: update,
      );
      await _repository.updateMaintenanceResponse(
        maintenanceResponseId: state.viewModel.responseEntity!.id!,
        updateResponse: update,
      );
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

  Future<void> _onSaveChange(
    SaveChangeEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      UpdateMaintenanceResponseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final listCauseId = <String>[];
      if (state.viewModel.listCausesSelected!.isNotEmpty) {
        for (final item in state.viewModel.listCausesSelected!) {
          listCauseId.add(item.causeId!);
        }
      }

      final update = state.viewModel.updateResponse!.copyWith(
        updatedAt: DateTime.now().toUtc(),
        cause: listCauseId,
      );
      final newViewModel = state.viewModel.copyWith(
        updateResponse: update,
      );
      await _repository.updateMaintenanceResponse(
        maintenanceResponseId: state.viewModel.responseEntity!.id!,
        updateResponse: update,
      );
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

  Future<void> _onReceiveCauses(
    ReceiveCauseEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      ReceiveCausesState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final newViewModel = state.viewModel.copyWith(
        listCausesSelected: event.listCauseEntity,
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(
        state.copyWith(
          viewModel: state.viewModel,
          status: BlocStatusState.failure,
        ),
      );
    }
  }
}
