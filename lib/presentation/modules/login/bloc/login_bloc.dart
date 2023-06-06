import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/user.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends AppBlocBase<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginUserEvent>(_onLogin);
  }
  Future<void> _onLogin(
    LoginUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      LoginInitialState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );

    /// Validation
    if (event.username == null || event.username?.trim() == '') {
      emit(
        LoginFailState(
          status: BlocStatusState.failure,
          viewModel: const _ViewModel(
            isLogin: false,
            errorMessage: 'Vui lòng nhập tài khoản',
          ),
        ),
      );
      return;
    }
    if (event.password == null || event.password?.trim() == '') {
      emit(
        LoginFailState(
          status: BlocStatusState.failure,
          viewModel: const _ViewModel(
            isLogin: false,
            errorMessage: 'Vui lòng nhập mật khẩu',
          ),
        ),
      );
      return;
    }
    final user =
        USER_LIST.where((element) => element.id == event.username).firstOrNull;
    if (user == null || event.password != 'chacmms') {
      emit(
        LoginFailState(
          status: BlocStatusState.failure,
          viewModel: const _ViewModel(
            isLogin: false,
            errorMessage: 'Tài khoản hoặc mật khẩu không đúng',
          ),
        ),
      );
      return;
    } else {
      emit(
        LoginSuccessState(
          status: BlocStatusState.success,
          viewModel: _ViewModel(isLogin: true, person: user),
        ),
      );
      return;
    }
  }
}

const USER_LIST = [
  User(id: 'dvmuoi', name: 'Dinh Van Muoi'),
  User(id: 'tvcuong', name: 'Tang Vi Cuong'),
  User(id: 'tvxua', name: 'Tran Van Xua'),
  User(id: 'tvhuoi', name: 'Tran Van Huoi'),
  User(id: 'nvhdang', name: 'Nguyen Van Hai Dang'),
  User(id: 'lttuan', name: 'Le Thanh Tuan'),
  User(id: 'vvdan', name: 'Vo Van Dan'),
  User(id: 'chbao', name: 'Cao Hoang Bao'),
  User(id: 'ltphuong', name: 'Le Thanh Phuong'),
  User(id: 'pmm', name: 'Pham Minh Man'),
  User(id: 'tnhuy', name: 'Tran Ngoc Huy'),
  User(id: 'thnhan', name: 'Ta Huu Nhan'),
];
