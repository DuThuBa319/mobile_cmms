part of 'example_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated
class _ViewModel {
  final List<WeatherEntity>? weathers;

  const _ViewModel({
    this.weathers,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    List<WeatherEntity>? weathers,
  }) {
    return _ViewModel(
      weathers: weathers ?? this.weathers,
    );
  }
}

// Abstract class
abstract class ExampleState {
  final _ViewModel viewModel;
  // Status of the state. Example "success" "failed" "loading"
  final BlocStatusState status;

  ExampleState(this.viewModel, {this.status = BlocStatusState.initial});

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of ExampleState (abstract class)
  T copyWith<T extends ExampleState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == ExampleState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class ExampleInitialState extends ExampleState {
  ExampleInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class ExampleGetWeatherState extends ExampleState {
  ExampleGetWeatherState({
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
  ExampleInitialState: (viewModel, status) => ExampleInitialState(
        viewModel: viewModel,
        status: status,
      ),
  ExampleGetWeatherState: (viewModel, status) => ExampleGetWeatherState(
        viewModel: viewModel,
        status: status,
      ),
};
