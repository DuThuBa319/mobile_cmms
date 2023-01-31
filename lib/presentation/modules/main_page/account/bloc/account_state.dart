part of 'account_bloc.dart';

class _ViewModel {
  final User? user;
  const _ViewModel({this.user});

  _ViewModel copyWith({User? user}) {
    return _ViewModel(user: user ?? this.user);
  }
}

abstract class AccountState {
  final _ViewModel viewModel;
  final BlocStatusState status;

  AccountState(this.viewModel, {this.status = BlocStatusState.initial});

  T copyWith<T extends AccountState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == AccountState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class AccountInitial extends AccountState {
  AccountInitial({
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
  AccountInitial: (viewModel, status) => AccountInitial(
        viewModel: viewModel,
        status: status,
      ),
};
