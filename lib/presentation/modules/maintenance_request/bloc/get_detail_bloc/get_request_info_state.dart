part of 'get_request_info_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated

class _ViewModel {
  final List<String>? employeeId;
  final List<String>? equipmentCode;
  final String? equipmentName;
  final List<EquipmentEntity>? equipmentEntities;
  final List<EmployeeEntity>? employeeEntities;
  final bool? isSelected;

  final List<CauseEntity>? listCausesSelected;
  final DateTime? selectedDate;
  const _ViewModel({
    this.employeeId,
    this.equipmentCode,
    this.equipmentName,
    this.isSelected,
    this.equipmentEntities,
    this.employeeEntities,
    this.listCausesSelected,
    this.selectedDate,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    List<String>? employeeId,
    List<String>? equipmentCode,
    String? equipmentName,
    List<EquipmentEntity>? equipmentEntities,
    bool? isSelected,
    List<EmployeeEntity>? employeeEntities,
    List<CauseEntity>? listCausesSelected,
    DateTime? selectedDate,
  }) {
    return _ViewModel(
      employeeId: employeeId ?? this.employeeId,
      equipmentCode: equipmentCode ?? this.equipmentCode,
      equipmentName: equipmentName ?? this.equipmentName,
      isSelected: isSelected ?? this.isSelected,
      equipmentEntities: equipmentEntities ?? this.equipmentEntities,
      employeeEntities: employeeEntities ?? this.employeeEntities,
      listCausesSelected: listCausesSelected ?? this.listCausesSelected,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}

// Abstract class
abstract class GetRequestInfoState {
  final _ViewModel viewModel;
  // Status of the state. Schedule "success" "failed" "loading"
  final BlocStatusState status;

  GetRequestInfoState(this.viewModel, {this.status = BlocStatusState.initial});

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of GetRequestInfoState (abstract class)
  T copyWith<T extends GetRequestInfoState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == GetRequestInfoState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class GetRequestInfoInitialState extends GetRequestInfoState {
  GetRequestInfoInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class GetInfoState extends GetRequestInfoState {
  GetInfoState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class GetEquipmentNameState extends GetRequestInfoState {
  GetEquipmentNameState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class GetEmployeesState extends GetRequestInfoState {
  GetEmployeesState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class GetEquipmentCodeState extends GetRequestInfoState {
  GetEquipmentCodeState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class ChangeDateState extends GetRequestInfoState {
  ChangeDateState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class ReceiveCausesState extends GetRequestInfoState {
  ReceiveCausesState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

final _factories = <
    Type,
    Function(
  _ViewModel viewModel,
  BlocStatusState status,
)>{
  GetRequestInfoInitialState: (viewModel, status) => GetRequestInfoInitialState(
        viewModel: viewModel,
        status: status,
      ),
  GetEquipmentNameState: (viewModel, status) => GetEquipmentNameState(
        viewModel: viewModel,
        status: status,
      ),
  GetEquipmentCodeState: (viewModel, status) => GetEquipmentCodeState(
        viewModel: viewModel,
        status: status,
      ),
  GetEmployeesState: (viewModel, status) => GetEmployeesState(
        viewModel: viewModel,
        status: status,
      ),
  ChangeDateState: (viewModel, status) => ChangeDateState(
        viewModel: viewModel,
        status: status,
      ),
  ReceiveCausesState: (viewModel, status) => ReceiveCausesState(
        viewModel: viewModel,
        status: status,
      ),
  GetInfoState: (viewModel, status) => GetInfoState(
        viewModel: viewModel,
        status: status,
      ),
};
