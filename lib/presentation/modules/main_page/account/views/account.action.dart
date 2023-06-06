part of 'account_screen.dart';

extension AccountAction on _AccountScreenState {
  void logOut() {
    showNoticeConfirmDialog(
      context: context,
      message: 'Bạn có chắc chắn đăng xuất',
      title: 'Thông báo',
      titleBtnDone: 'Đồng ý',
      titleBtnCancel: 'Hủy bỏ',
      onConfirmed: () {
        userDataData.setUser(null);
        Navigator.popUntil(
          context,
          (route) => route.settings.name == RouteList.login,
        );
      },
    );
  }
}
