part of 'main_tab_cubit.dart';

@immutable
abstract class MainTabState {
  final int index;

  MainTabState(this.index);
}

class MainTabHome extends MainTabState {
  MainTabHome() : super(MainTabConst.home.index);
}

class MainTabSearch extends MainTabState {
  MainTabSearch() : super(MainTabConst.search.index);
}

class MainTabNotification extends MainTabState {
  MainTabNotification() : super(MainTabConst.notification.index);
}

class MainTabAccount extends MainTabState {
  MainTabAccount() : super(MainTabConst.account.index);
}
