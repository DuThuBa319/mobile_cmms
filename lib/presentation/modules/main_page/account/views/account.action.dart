part of 'account_screen.dart';

extension AccountAction on _AccountScreenState {
  void _blocListener(BuildContext context, AccountState state) {
    if (_refreshController.isRefresh) {
      _refreshController.refreshCompleted();
    }
  }

  void _onRefresh() {
    bloc.add(GetUserEvent());
  }

  void gotoDetailScreen() {}

  Future<void> goToProfile() async {
    final user = bloc.state.viewModel.user;
    final isNeedRefresh = await Navigator.of(context).pushNamed(
      RouteList.profile,
      arguments: user,
    );

    if (isNeedRefresh is bool && isNeedRefresh == true) {
      unawaited(_refreshController.requestRefresh());
    }
  }

  void logOut() {
    showNoticeConfirmDialog(
      context: context,
      message: 'Bạn có chắc chắn đăng xuất',
      title: 'Thông báo',
      titleBtnDone: 'Đồng ý',
      titleBtnCancel: 'Hủy bỏ',
      onConfirmed: () {
        bloc.logout(context);
      },
    );
  }

  void deleteAccount() {}

  void changePassword() {}
}
