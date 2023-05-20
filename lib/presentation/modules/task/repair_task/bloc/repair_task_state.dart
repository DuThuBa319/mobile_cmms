part of 'repair_task_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated

class _ViewModel {
  final MaintenanceResponseItem? response;
  final MaintenanceResponseEntity? responseEntity;
  final List<CauseEntity>? listCausesSelected;
  final UpdateResponse? updateResponse;
  const _ViewModel({
    this.response,
    this.responseEntity,
    this.listCausesSelected,
    this.updateResponse,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    MaintenanceResponseItem? response,
    MaintenanceResponseEntity? responseEntity,
    List<CauseEntity>? listCausesSelected,
    UpdateResponse? updateResponse,
  }) {
    return _ViewModel(
      response: response ?? this.response,
      responseEntity: responseEntity ?? this.responseEntity,
      listCausesSelected: listCausesSelected ?? this.listCausesSelected,
      updateResponse: updateResponse ?? this.updateResponse,
    );
  }
}

// Abstract class
abstract class RepairTaskState {
  final _ViewModel viewModel;
  // Status of the state. RepairTask "success" "failed" "loading"
  final BlocStatusState status;

  RepairTaskState(this.viewModel, {this.status = BlocStatusState.initial});

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of RepairTaskState (abstract class)
  T copyWith<T extends RepairTaskState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == RepairTaskState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class RepairTaskInitialState extends RepairTaskState {
  RepairTaskInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class GetMaintenanceResponseState extends RepairTaskState {
  GetMaintenanceResponseState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class UpdateMaintenanceResponseState extends RepairTaskState {
  UpdateMaintenanceResponseState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class ReceiveCausesState extends RepairTaskState {
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
  RepairTaskInitialState: (viewModel, status) => RepairTaskInitialState(
        viewModel: viewModel,
        status: status,
      ),
  GetMaintenanceResponseState: (viewModel, status) =>
      GetMaintenanceResponseState(
        viewModel: viewModel,
        status: status,
      ),
  UpdateMaintenanceResponseState: (viewModel, status) =>
      UpdateMaintenanceResponseState(
        viewModel: viewModel,
        status: status,
      ),
  ReceiveCausesState: (viewModel, status) => ReceiveCausesState(
        viewModel: viewModel,
        status: status,
      ),
};
