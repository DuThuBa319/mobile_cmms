part of 'home_screen.dart';

extension HomeAction on _HomeScreenState {
  void _blocListener(BuildContext context, HomeState state) {
    logger.d('change state', state);
    _refreshController
      ..refreshCompleted()
      ..loadComplete();
  }

  Future<void> onRefresh() async {
    bloc.add(GetDataEvent());
  }

  void loadMore() {
    bloc.add(LoadMoreDataEvent());
  }
}
