import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../../domain/entities/cmms/employee_entity.dart';
import '../../../../../domain/entities/cmms/equipment_entity.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../../usecase/maintenance_request_usecase.dart';

part 'get_request_info_event.dart';
part 'get_request_info_state.dart';

@injectable
class GetRequestInfoBloc
    extends AppBlocBase<GetRequestInfoEvent, GetRequestInfoState> {
  final MaintenanceRequestUsecase _usecase;
  GetRequestInfoBloc(this._usecase) : super(GetRequestInfoInitialState()) {
    on<GetEquipmentCodeEvent>(_onGetEquipmentCode);
    on<GetEquipmentNameEvent>(_onGetEquipmentName);

    on<GetEmployeesEvent>(_onGetEmployees);

    on<ChangeDateEvent>(_onChangeDate);
    on<ReceiveCauseEvent>(_onReceiveCauses);
  }
  Future<void> _onGetEquipmentCode(
    GetEquipmentCodeEvent event,
    Emitter<GetRequestInfoState> emit,
  ) async {
    emit(
      GetEquipmentCodeState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      const String? name = '--';
      final responses = await _usecase.getListEquipments();
      final listEquipmentCode = <String>[];
      final listEquipmentEntities = <EquipmentEntity>[];
      if (responses != null) {
        for (final response in responses) {
          if (response.equipmentType == event.type) {
            listEquipmentCode.add(response.code!);
            listEquipmentEntities.add(response);
          }
        }
      }
      final newViewModel = state.viewModel.copyWith(
        equipmentName: name,
        equipmentCode: listEquipmentCode,
        equipmentEntities: listEquipmentEntities,
        listCausesSelected: [],
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

  Future<void> _onGetEquipmentName(
    GetEquipmentNameEvent event,
    Emitter<GetRequestInfoState> emit,
  ) async {
    emit(
      GetEquipmentNameState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      String? name = '--';
      for (var i = 0; i <= state.viewModel.equipmentEntities!.length; i++) {
        if (event.code == state.viewModel.equipmentEntities?[i].code) {
          name = state.viewModel.equipmentEntities?[i].name;
          break;
        }
      }

      final newViewModel = state.viewModel.copyWith(
        equipmentName: name,
      );
      emit(
        GetEquipmentNameState(
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

  Future<void> _onGetEmployees(
    GetEmployeesEvent event,
    Emitter<GetRequestInfoState> emit,
  ) async {
    emit(
      GetEmployeesState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final responses = await _usecase.getListEmployees();
      final listEmployeeId = <String>[];

      if (responses != null) {
        for (final response in responses) {
          listEmployeeId.add(response.personId!);
        }
      }

      final newViewModel = state.viewModel.copyWith(
        employeeEntities: responses,
        employeeId: listEmployeeId,
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

  Future<void> _onChangeDate(
    ChangeDateEvent event,
    Emitter<GetRequestInfoState> emit,
  ) async {
    emit(
      ChangeDateState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final newViewModel = state.viewModel.copyWith(
        selectedDate: event.selectedDate,
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

  Future<void> _onReceiveCauses(
    ReceiveCauseEvent event,
    Emitter<GetRequestInfoState> emit,
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
