part of 'home_bloc.dart';

class _ViewModel {
  final bool? canLoadMore;

  const _ViewModel({
    this.canLoadMore,
  });

  _ViewModel copyWith({
    bool? canLoadMore,
  }) {
    return _ViewModel(
      canLoadMore: canLoadMore ?? this.canLoadMore,
    );
  }
}

abstract class HomeState {
  final _ViewModel viewModel;
  final BlocStatusState status;

  HomeState(this.viewModel, {this.status = BlocStatusState.initial});

  T copyWith<T extends HomeState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == HomeState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class HomeInitial extends HomeState {
  HomeInitial({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

final _factories = <
    Type,
    Function(
  _ViewModel viewModel,
  BlocStatusState status,
)>{
  HomeInitial: (viewModel, status) => HomeInitial(
        viewModel: viewModel,
        status: status,
      ),
};
