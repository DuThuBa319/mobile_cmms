import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../main_tab_constants.dart';

part 'main_tab_state.dart';

class MainTabCubit extends Cubit<MainTabState> {
  // bool get isLoggedIn => LocalDataManager.getToken()?.isNotEmpty == true;

  MainTabCubit() : super(MainTabHome());

  void navigateTo(int idx) {
    if (idx == MainTabConst.home.index) {
      emit(MainTabHome());
    } else if (idx == MainTabConst.search.index) {
      emit(MainTabSearch());
    } else if (idx == MainTabConst.notification.index) {
      emit(MainTabNotification());
    } else if (idx == MainTabConst.account.index) {
      emit(MainTabAccount());
    } else {
      assert(false, 'Page with idx $idx not found!');
    }
  }
}
