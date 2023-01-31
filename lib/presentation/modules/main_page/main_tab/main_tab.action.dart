part of 'main_tab_screen.dart';

extension MainTabAction on _MainTabScreenState {
  Future<bool> onNavigationPressed(int idx) async {
    if (idx != MainTabConst.home.index) {
      requireLogin(onSuccess: () => onNavigationPressed(idx));
      return false;
    }
    switch (idx) {
      default:
        _cubit.navigateTo(idx);
    }
    return true;
  }

  void initOneSignal() {
    OneSignalNotificationService.onNotificationOpened((notification) {
      final context = navigatorKey.currentContext;
      if (context != null) {
        //NotificationRoute.onOpened(context, notification);
      }
    });
    // OneSignalNotificationService.onNotificationReceived(
    //   (notificaiton) {
    //     this.context.read<NotificationServiceBloc>().add(GetBadgeCountEvent());
    //     final context = navigatorKey.currentContext;
    //     if (context != null) {
    //       NotificationRoute.onReceived(context, notificaiton);
    //     }
    //   },
    // );
    OneSignalNotificationService.create().then((_) {
      //`UpdateNotificationSettingEvent` needs `PushNotificationService` to delete/set tag.
      // BlocProvider.of<AccountBloc>(context).add(
      //   UpdateNotificationSettingEvent(locale(context)),
      // );
      if (userDataData.getUser() != null) {
        OneSignalNotificationService.subscribeNotification(
          userDataData.getUser()!,
        );
      }
    });
  }

  void _didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      AppColor.setLightStatusBar();
    }
  }

  void _cubitListener(BuildContext context, MainTabState state) {
    if (state.index < 1) {
      AppColor.setDarkStatusBar();
    } else {
      AppColor.setLightStatusBar();
    }
    _pageController.jumpToPage(
      state.index,
    );
  }
}
