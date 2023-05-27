part of 'repair_task_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated

class _ViewModel {
  final MaintenanceResponseItem? response;
  final MaintenanceResponseEntity? responseEntity;
  final List<CauseEntity>? listCausesSelected;
  final List<CorrectionEntity>? listCorrectionsSelected;
  final UpdateResponse? updateResponse;
  final bool isChanged;
  final List<String>? listCauseId;
  final List<String>? listCorrectionId;
  final List<File>? imageFiles;
  final List<File>? audioFiles;
  final List<String>? imageUrls;
  final List<String>? audioUrls;
  const _ViewModel({
    this.response,
    this.responseEntity,
    this.listCausesSelected,
    this.updateResponse,
    this.listCorrectionsSelected,
    this.isChanged = false,
    this.listCorrectionId,
    this.listCauseId,
    this.imageFiles,
    this.imageUrls,
    this.audioFiles,
    this.audioUrls,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    MaintenanceResponseItem? response,
    MaintenanceResponseEntity? responseEntity,
    List<CauseEntity>? listCausesSelected,
    List<CorrectionEntity>? listCorrectionsSelected,
    UpdateResponse? updateResponse,
    bool? isChanged,
    List<String>? listCauseId,
    List<String>? listCorrectionId,
    List<File>? imageFiles,
    List<String>? imageUrls,
    List<File>? audioFiles,
    List<String>? audioUrls,
  }) {
    return _ViewModel(
      response: response ?? this.response,
      responseEntity: responseEntity ?? this.responseEntity,
      listCausesSelected: listCausesSelected ?? this.listCausesSelected,
      listCorrectionsSelected:
          listCorrectionsSelected ?? this.listCorrectionsSelected,
      updateResponse: updateResponse ?? this.updateResponse,
      isChanged: isChanged ?? this.isChanged,
      listCauseId: listCauseId ?? this.listCauseId,
      listCorrectionId: listCorrectionId ?? this.listCorrectionId,
      imageFiles: imageFiles ?? this.imageFiles,
      imageUrls: imageUrls ?? this.imageUrls,
      audioFiles: audioFiles ?? this.audioFiles,
      audioUrls: audioUrls ?? this.audioUrls,
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

class ReceiveInfosState extends RepairTaskState {
  ReceiveInfosState({
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
  ReceiveInfosState: (viewModel, status) => ReceiveInfosState(
        viewModel: viewModel,
        status: status,
      ),
};
