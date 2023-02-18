part of 'example_temp_humid_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated
class _ViewModel {
  final List<TemperatureEntity>? weathers;

  const _ViewModel({
    this.weathers,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    List<TemperatureEntity>? weathers,
  }) {
    return _ViewModel(
      weathers: weathers ?? this.weathers,
    );
  }
}

// Abstract class
abstract class ExampleTempHumidState {
  final _ViewModel viewModel;
  // Status of the state. Example "success" "failed" "loading"
  final BlocStatusState status;

  ExampleTempHumidState(
    this.viewModel, {
    this.status = BlocStatusState.initial,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of ExampleState (abstract class)
  T copyWith<T extends ExampleTempHumidState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == ExampleTempHumidState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class ExampleInitialState extends ExampleTempHumidState {
  ExampleInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class ExampleGetTemperatureState extends ExampleTempHumidState {
  ExampleGetTemperatureState({
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
  ExampleGetTemperatureState: (viewModel, status) => ExampleGetTemperatureState(
        viewModel: viewModel,
        status: status,
      ),
};
