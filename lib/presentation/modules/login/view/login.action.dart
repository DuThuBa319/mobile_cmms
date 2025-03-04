part of 'login_screen.dart';

extension LoginAction on _LoginState {
  void _blocListener(BuildContext context, LoginState state) {
    if (state is LoginInitialState && state.status == BlocStatusState.loading) {
      showToast('Đang tải dữ liệu');
    }

    if (state is LoginSuccessState) {
      userDataData.setUser(state.viewModel.person?.convertToModel());
      Navigator.pushNamed(context, RouteList.home);
      // Navigator.of(context, rootNavigator: true).pop();
    } else if (state is LoginFailState) {
      final message = state.viewModel.errorMessage ?? '--';

      showNoticeDialog(context: context, message: message);
    }
  }

  Future<void> login() async {
    final userName = _usernameController.text;
    final password = _passwordController.text;
    bloc.add(
      LoginUserEvent(
        username: userName,
        password: password,
      ),
    );
  }
}
