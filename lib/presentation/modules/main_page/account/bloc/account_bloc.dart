import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../common/utils/singletons.dart';
import '../../../../../domain/entities/user.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../interactor/account_interactor.dart';

part 'account_event.dart';

part 'account_state.dart';

@injectable
class AccountBloc extends AppBlocBase<AccountEvent, AccountState> {
  final AccountInteractor _interactor;

  AccountBloc(this._interactor) : super(AccountInitial()) {
    on<AccountEvent>(_onAccountEvent);
    on<GetUserEvent>(_onGetUserEvent);
  }

  Future<void> _onAccountEvent(
    AccountEvent event,
    Emitter<AccountState> emit,
  ) async {}

  FutureOr<void> _onGetUserEvent(
    GetUserEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(
      state.copyWith(
        status: BlocStatusState.success,
        viewModel: state.viewModel.copyWith(user: userDataData.getUser()),
      ),
    );
    emit(
      state.copyWith(
        status: BlocStatusState.success,
        viewModel: state.viewModel,
      ),
    );
  }
}
