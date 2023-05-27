part of 'receive_info_selection_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated

class _ViewModel {
  final List<String>? listCauseId;
  final List<String>? listCorrectionId;
  final List<CauseEntity>? listCauseSelected;
  final List<CorrectionEntity>? listCorrectionSelected;
  final List<File>? imageFiles;

  final List<File>? audioFiles;

  const _ViewModel({
    this.listCorrectionId,
    this.listCauseId,
    this.listCorrectionSelected,
    this.listCauseSelected,
    this.imageFiles,
    this.audioFiles,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    List<String>? listCauseId,
    List<String>? listCorrectionId,
    List<CauseEntity>? listCauseSelected,
    List<CorrectionEntity>? listCorrectionSelected,
    List<File>? imageFiles,
    List<File>? audioFiles,
  }) {
    return _ViewModel(
      listCauseId: listCauseId ?? this.listCauseId,
      listCorrectionId: listCorrectionId ?? this.listCorrectionId,
      listCauseSelected: listCauseSelected ?? this.listCauseSelected,
      listCorrectionSelected:
          listCorrectionSelected ?? this.listCorrectionSelected,
      imageFiles: imageFiles ?? this.imageFiles,
      audioFiles: audioFiles ?? this.audioFiles,
    );
  }
}

// Abstract class
abstract class ReceiveInfoSelectionState {
  final _ViewModel viewModel;
  // Status of the state. Schedule "success" "failed" "loading"
  final BlocStatusState status;

  ReceiveInfoSelectionState(
    this.viewModel, {
    this.status = BlocStatusState.initial,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of ReceiveInfoSelectionState (abstract class)
  T copyWith<T extends ReceiveInfoSelectionState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == ReceiveInfoSelectionState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class ReceiveInfoSelectionInitialState extends ReceiveInfoSelectionState {
  ReceiveInfoSelectionInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class ReceiveCorrectionState extends ReceiveInfoSelectionState {
  ReceiveCorrectionState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class ReceiveCauseState extends ReceiveInfoSelectionState {
  ReceiveCauseState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class ReceiveImageFileState extends ReceiveInfoSelectionState {
  ReceiveImageFileState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class ReceiveAudioFileState extends ReceiveInfoSelectionState {
  ReceiveAudioFileState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class LoadFileState extends ReceiveInfoSelectionState {
  LoadFileState({
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
  ReceiveInfoSelectionInitialState: (viewModel, status) =>
      ReceiveInfoSelectionInitialState(
        viewModel: viewModel,
        status: status,
      ),
  ReceiveCauseState: (viewModel, status) => ReceiveCauseState(
        viewModel: viewModel,
        status: status,
      ),
  ReceiveCorrectionState: (viewModel, status) => ReceiveCorrectionState(
        viewModel: viewModel,
        status: status,
      ),
  ReceiveImageFileState: (viewModel, status) => ReceiveImageFileState(
        viewModel: viewModel,
        status: status,
      ),
  ReceiveAudioFileState: (viewModel, status) => ReceiveAudioFileState(
        viewModel: viewModel,
        status: status,
      ),
  LoadFileState: (viewModel, status) => LoadFileState(
        viewModel: viewModel,
        status: status,
      ),
};
