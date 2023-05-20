part of 'select_info_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated

class _ViewModel {
  final List<dynamic>? response;
  final List<bool>? isCauseSelected;
  final List<dynamic>? listInfoSelected;

  const _ViewModel({
    this.response,
    this.isCauseSelected,
    this.listInfoSelected,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    List<dynamic>? response,
    List<bool>? isCauseSelected,
    List<dynamic>? listInfoSelected,
  }) {
    return _ViewModel(
      response: response ?? this.response,
      isCauseSelected: isCauseSelected ?? this.isCauseSelected,
      listInfoSelected: listInfoSelected ?? this.listInfoSelected,
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

class ResponseCausesState extends SelectInfoState {
  ResponseCausesState({
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
  ResponseCausesState: (viewModel, status) => ResponseCausesState(
        viewModel: viewModel,
        status: status,
      ),
  GetInfoState: (viewModel, status) => GetInfoState(
        viewModel: viewModel,
        status: status,
      ),
};
