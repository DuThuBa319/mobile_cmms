part of 'schedule_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated
class _ViewModel {
  final List<WorkOrderEntity>? workOrders;

  const _ViewModel({
    this.workOrders,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    List<WorkOrderEntity>? workOrders,
  }) {
    return _ViewModel(
      workOrders: workOrders ?? this.workOrders,
    );
  }
}

// Abstract class
abstract class ScheduleState {
  final _ViewModel viewModel;
  // Status of the state. Schedule "success" "failed" "loading"
  final BlocStatusState status;

  ScheduleState(this.viewModel, {this.status = BlocStatusState.initial});

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of ScheduleState (abstract class)
  T copyWith<T extends ScheduleState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == ScheduleState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class ScheduleInitialState extends ScheduleState {
  ScheduleInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class ScheduleGetWorkOrderState extends ScheduleState {
  ScheduleGetWorkOrderState({
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
  ScheduleInitialState: (viewModel, status) => ScheduleInitialState(
        viewModel: viewModel,
        status: status,
      ),
  ScheduleGetWorkOrderState: (viewModel, status) => ScheduleGetWorkOrderState(
        viewModel: viewModel,
        status: status,
      ),
};
