import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../data/models/cmms/cmms_enum.dart';
import '../../../../../data/models/cmms/maintenance_response/inspection_report.dart';
import '../../../../../data/models/cmms/put/update_response.dart';
import '../../../../../domain/entities/cmms/inspection_report_entity.dart';
import '../../../../../domain/entities/cmms/maintenance_response_entity.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../../repository/response_repository.dart';
import '../../usecase/response_usecase.dart';

part 'general_check_event.dart';
part 'general_check_state.dart';

@injectable
class GeneralCheckBloc
    extends AppBlocBase<GeneralCheckEvent, GeneralCheckState> {
  final ResponseUsecase _usecase;
  final ResponseRepository _repository;

  GeneralCheckBloc(this._usecase, this._repository)
      : super(GeneralCheckInitialState()) {
    on<GetMaintenanceResponseEvent>(_onGetMaintenanceResponses);
    on<DropdownChangedEvent>(_onDropdownChanged);
    on<StartTaskEvent>(_onStartTask);
    on<FinishTaskEvent>(_onFinishTask);
    on<MakeRequestEvent>(_onMakeRequest);
    on<SaveChangeEvent>(_onSaveChange);
  }

  Future<void> _onGetMaintenanceResponses(
    GetMaintenanceResponseEvent event,
    Emitter<GeneralCheckState> emit,
  ) async {
    emit(
      GetMaintenanceResponseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final inspectionReports = event.inspectionReports;
      final responseEntity =
          await _usecase.getMaintenanceResponse(responseId: event.responseId);
      final listCauseId = <String>[];
      final listCorrectionId = <String>[];
      final listSku = <String>[];
      for (final cause in responseEntity!.causeEntities!) {
        listCauseId.add(cause.id!);
      }
      for (final correction in responseEntity.correctionEntities!) {
        listCorrectionId.add(correction.id!);
      }
      for (final material in responseEntity.materials!) {
        listSku.add(material.sku!);
      }
      for (var i = 0; i < inspectionReports.length; i++) {
        for (var j = 0;
            j < responseEntity.inspectionReportEntity!.length;
            j++) {
          if (inspectionReports[i].name ==
              responseEntity.inspectionReportEntity![j].name) {
            inspectionReports[i] = responseEntity.inspectionReportEntity![j];
          }
        }
      }
      final update = UpdateResponse().copyWith(
        actualFinishTime: responseEntity.actualFinishTime,
        actualStartTime: responseEntity.actualStartTime,
        status: responseEntity.status,
        updatedAt: responseEntity.updatedAt,
        cause: listCauseId,
        correction: listCorrectionId,
        images: responseEntity.images,
        sounds: responseEntity.sounds,
        materials: listSku,
        inspectionReports: List<InspectionReport>.generate(
          responseEntity.inspectionReportEntity!.length,
          (index) => responseEntity.inspectionReportEntity![index]
              .getInspectionReport(),
        ),
        type: responseEntity.type,
      );

      final newViewModel = state.viewModel.copyWith(
        responseEntity: responseEntity,
        updateResponse: update,
        isChanged: false,
        inspectionReports: inspectionReports,
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

  Future<void> _onDropdownChanged(
    DropdownChangedEvent event,
    Emitter<GeneralCheckState> emit,
  ) async {
    emit(
      GeneralCheckChangedState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final inspectionReports = state.viewModel.inspectionReports!;
      inspectionReports[event.index!].status = event.status;
      final newViewModel = state.viewModel.copyWith(
        inspectionReports: inspectionReports,
        isChanged: true,
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

  Future<void> _onMakeRequest(
    MakeRequestEvent event,
    Emitter<GeneralCheckState> emit,
  ) async {
    emit(
      GeneralCheckChangedState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final inspectionReports = state.viewModel.inspectionReports!;
      inspectionReports[event.index!].isRequest = event.isRequest ?? false;
      final newViewModel = state.viewModel.copyWith(
        inspectionReports: inspectionReports,
        isChanged: event.isRequest,
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
    Emitter<GeneralCheckState> emit,
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
        isChanged: false,
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
    Emitter<GeneralCheckState> emit,
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
    Emitter<GeneralCheckState> emit,
  ) async {
    emit(
      UpdateMaintenanceResponseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final id = state.viewModel.responseEntity!.id!;
      final update = state.viewModel.updateResponse!.copyWith(
        updatedAt: DateTime.now().toUtc(),
        inspectionReports: List<InspectionReport>.generate(
          state.viewModel.inspectionReports!.length,
          (index) =>
              state.viewModel.inspectionReports![index].getInspectionReport(),
        ),
      );
      final newViewModel = state.viewModel.copyWith(
        updateResponse: update,
      );
      await _repository.updateMaintenanceResponse(
        maintenanceResponseId: id,
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
}
