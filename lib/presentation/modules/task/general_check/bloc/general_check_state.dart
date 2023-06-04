part of 'general_check_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated

class _ViewModel {
  final List<InspectionReportEntity>? inspectionReports;
  final MaintenanceResponseEntity? responseEntity;

  final UpdateResponse? updateResponse;
  final bool isChanged;

  const _ViewModel({
    this.inspectionReports,
    this.responseEntity,
    this.updateResponse,
    this.isChanged = false,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    MaintenanceResponseEntity? responseEntity,
    UpdateResponse? updateResponse,
    bool? isChanged,
    List<InspectionReportEntity>? inspectionReports,
  }) {
    return _ViewModel(
      responseEntity: responseEntity ?? this.responseEntity,
      updateResponse: updateResponse ?? this.updateResponse,
      isChanged: isChanged ?? this.isChanged,
      inspectionReports: inspectionReports ?? this.inspectionReports,
    );
  }
}

// Abstract class
abstract class GeneralCheckState {
  final _ViewModel viewModel;
  // Status of the state. GeneralCheck "success" "failed" "loading"
  final BlocStatusState status;

  GeneralCheckState(this.viewModel, {this.status = BlocStatusState.initial});

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of GeneralCheckState (abstract class)
  T copyWith<T extends GeneralCheckState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == GeneralCheckState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class GeneralCheckInitialState extends GeneralCheckState {
  GeneralCheckInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class GetMaintenanceResponseState extends GeneralCheckState {
  GetMaintenanceResponseState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class GeneralCheckChangedState extends GeneralCheckState {
  GeneralCheckChangedState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class UpdateMaintenanceResponseState extends GeneralCheckState {
  UpdateMaintenanceResponseState({
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
  GeneralCheckInitialState: (viewModel, status) => GeneralCheckInitialState(
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
  GeneralCheckChangedState: (viewModel, status) => GeneralCheckChangedState(
        viewModel: viewModel,
        status: status,
      ),
};
