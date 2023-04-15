part of 'request_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated
class _ViewModel {
  final List<File>? allFiles;

  const _ViewModel({
    this.allFiles,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    List<File>? allFiles,
  }) {
    return _ViewModel(
      allFiles: allFiles ?? this.allFiles,
    );
  }
}

// Abstract class
abstract class RequestState {
  final _ViewModel viewModel;
  // Status of the state. Schedule "success" "failed" "loading"
  final BlocStatusState status;

  RequestState(this.viewModel, {this.status = BlocStatusState.initial});

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of RequestState (abstract class)
  T copyWith<T extends RequestState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == RequestState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class RequestInitialState extends RequestState {
  RequestInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class MakeRequestState extends RequestState {
  MakeRequestState({
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
  RequestInitialState: (viewModel, status) => RequestInitialState(
        viewModel: viewModel,
        status: status,
      ),
  MakeRequestState: (viewModel, status) => MakeRequestState(
        viewModel: viewModel,
        status: status,
      ),
};
