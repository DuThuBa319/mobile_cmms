part of 'select_info_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated

class _ViewModel {
  final List? infoResponse;
  final List<bool>? isInfoSelected;
  final List<CauseEntity>? listCauseSelected;
  final List<CauseEntity>? causeResponse;
  final List<CorrectionEntity>? listCorrectionSelected;
  final List<CorrectionEntity>? correctionResponse;
  const _ViewModel({
    this.infoResponse,
    this.isInfoSelected,
    this.causeResponse,
    this.listCauseSelected,
    this.correctionResponse,
    this.listCorrectionSelected,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    List? infoResponse,
    List<bool>? isInfoSelected,
    List<CauseEntity>? listCauseSelected,
    List<CauseEntity>? causeResponse,
    List<CorrectionEntity>? listCorrectionSelected,
    List<CorrectionEntity>? correctionResponse,
  }) {
    return _ViewModel(
      infoResponse: infoResponse ?? this.infoResponse,
      isInfoSelected: isInfoSelected ?? this.isInfoSelected,
      listCauseSelected: listCauseSelected ?? this.listCauseSelected,
      causeResponse: causeResponse ?? this.causeResponse,
      listCorrectionSelected:
          listCorrectionSelected ?? this.listCorrectionSelected,
      correctionResponse: correctionResponse ?? this.correctionResponse,
    );
  }
}

// Abstract class
abstract class SelectInfoState {
  final _ViewModel viewModel;
  // Status of the state. Schedule "success" "failed" "loading"
  final BlocStatusState status;

  SelectInfoState(this.viewModel, {this.status = BlocStatusState.initial});

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of SelectInfoState (abstract class)
  T copyWith<T extends SelectInfoState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == SelectInfoState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class SelectInfoInitialState extends SelectInfoState {
  SelectInfoInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class GetInfoState extends SelectInfoState {
  GetInfoState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class ResponseInfosState extends SelectInfoState {
  ResponseInfosState({
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
  SelectInfoInitialState: (viewModel, status) => SelectInfoInitialState(
        viewModel: viewModel,
        status: status,
      ),
  ResponseInfosState: (viewModel, status) => ResponseInfosState(
        viewModel: viewModel,
        status: status,
      ),
  GetInfoState: (viewModel, status) => GetInfoState(
        viewModel: viewModel,
        status: status,
      ),
};
