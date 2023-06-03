import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../data/models/cmms/cmms_enum.dart';
import '../../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../../domain/entities/cmms/employee_entity.dart';
import '../../../../../domain/entities/cmms/equipment_entity.dart';
import '../../../../../domain/entities/cmms/mold_entity.dart';
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
    on<ReceiveListCauseEvent>(_onReceiveCauses);
    on<EmployeeChangedEvent>(_onEmployeeChanged);
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
      final listObjectCode = <String>[];
      final listEquipmentEntities = <EquipmentEntity>[];
      final listMoldEntities = <MoldEntity>[];
      if (event.maintenanceObject == MaintenanceObject.mold) {
        final responses = await _usecase.getListMolds();

        if (responses != null) {
          for (final response in responses) {
            listObjectCode.add(response.code!);
            listMoldEntities.add(response);
          }
        }
      } else {
        final responses = await _usecase.getListEquipments();

        if (responses != null) {
          for (final response in responses) {
            if (response.equipmentType == event.type) {
              listObjectCode.add(response.code!);
              listEquipmentEntities.add(response);
            }
          }
        }
      }

      final newViewModel = state.viewModel.copyWith(
        objectName: name,
        objectCode: listObjectCode,
        equipmentEntities:
            event.maintenanceObject == MaintenanceObject.equipment
                ? listEquipmentEntities
                : null,
        moldEntities: event.maintenanceObject == MaintenanceObject.mold
            ? listMoldEntities
            : null,
        listCausesSelected: [],
        maintenanceObject: event.maintenanceObject,
        isEnable: false,
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
      var isEnable = false;
      if (event.code != '<Chọn mã thiết bị>') {
        if (state.viewModel.maintenanceObject == MaintenanceObject.equipment) {
          for (var i = 0; i <= state.viewModel.equipmentEntities!.length; i++) {
            if (event.code == state.viewModel.equipmentEntities?[i].code) {
              name = state.viewModel.equipmentEntities?[i].name;
              break;
            }
          }
        } else {
          for (var i = 0; i <= state.viewModel.moldEntities!.length; i++) {
            if (event.code == state.viewModel.moldEntities?[i].code) {
              name = state.viewModel.moldEntities?[i].name;
              break;
            }
          }
        }
        isEnable = true;
      }

      final newViewModel = state.viewModel.copyWith(
        objectName: name,
        isEnable: isEnable,
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
      final listEmployeeName = <String>[];

      if (responses != null) {
        for (final response in responses) {
          listEmployeeName.add(response.personName!);
        }
      }

      final newViewModel = state.viewModel.copyWith(
        employeeEntities: responses,
        employeeName: listEmployeeName,
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

  Future<void> _onEmployeeChanged(
    EmployeeChangedEvent event,
    Emitter<GetRequestInfoState> emit,
  ) async {
    emit(
      GetEmployeesState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      String? employeeId;
      if (event.name != '<Chọn KTV>') {
        for (final employeeEntity in state.viewModel.employeeEntities!) {
          if (event.name == employeeEntity.personName) {
            employeeId = employeeEntity.personId;
          }
        }
      }

      final newViewModel = state.viewModel.copyWith(employeeId: employeeId);
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
    ReceiveListCauseEvent event,
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
