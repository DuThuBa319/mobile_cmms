part of 'main_screen_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated
class _ViewModel {
  final List<MaintenanceResponseEntity>? responses;

  const _ViewModel({
    this.responses,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    List<MaintenanceResponseEntity>? responses,
  }) {
    return _ViewModel(
      responses: responses ?? this.responses,
    );
  }
}

// Abstract class
abstract class MainScreenState {
  final _ViewModel viewModel;
  // Status of the state. MainScreen "success" "failed" "loading"
  final BlocStatusState status;

  MainScreenState(this.viewModel, {this.status = BlocStatusState.initial});

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of MainScreenState (abstract class)
  T copyWith<T extends MainScreenState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == MainScreenState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class MainScreenInitialState extends MainScreenState {
  MainScreenInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class MainScreenGetResponseState extends MainScreenState {
  MainScreenGetResponseState({
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
  MainScreenInitialState: (viewModel, status) => MainScreenInitialState(
        viewModel: viewModel,
        status: status,
      ),
  MainScreenGetResponseState: (viewModel, status) => MainScreenGetResponseState(
        viewModel: viewModel,
        status: status,
      ),
};
