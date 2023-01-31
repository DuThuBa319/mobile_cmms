import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/components/navigation/navigation_observer.dart';
import '../../../../common/services/onesignal_notification_service.dart';
import '../../../../common/utils/singletons.dart';
import '../../../../di/di.dart';
import '../../../../generated/assets.dart';
import '../../../base/base.dart';
import '../../../common_widget/export.dart';
import '../../../theme/theme_color.dart';
import '../account/bloc/account_bloc.dart';
import '../account/views/account_screen.dart';
import '../home/home.dart';
import 'cubit/main_tab_cubit.dart';
import 'main_tab_constants.dart';

part 'main_tab.action.dart';

class MainTabScreen extends StatefulWidget {
  MainTabScreen({Key? key}) : super(key: key);

  @override
  _MainTabScreenState createState() => _MainTabScreenState();
}

class _MainTabScreenState extends StateBase<MainTabScreen>
    with AfterLayoutMixin, WidgetsBindingObserver {
  MainTabCubit get _cubit => BlocProvider.of(context);

  final _pageController = PageController();

  @override
  void afterFirstLayout(BuildContext context) {
    _cubit.navigateTo(MainTabConst.home.index);

    // if (firebaseAuthService.isSignedIn) {
    //   //   BlocProvider.of<AccountBloc>(context).add(UpdateAccountDataEvent());
    //   //   BlocProvider.of<AccountBloc>(context).add(UpdateUserLocaleEvent(
    //   //     locale(context),
    //   //   ));
    //   //Delay for navigation animation
    //   //If not when login the first time then the app show notification
    //   //permission dialog that will stuck navigation animation look not good.
    //   Future.delayed(const Duration(milliseconds: 500), initOneSignal);
    //   //
    //   //   //set user for analytic tracking
    //   //   final user = LocalDataManager.getUser();
    //   //   if (user != null) {
    //   //     setAnalyticsUser(user: user);
    //   //   }
    //   //   Future.delayed(const Duration(milliseconds: 200), () {
    //   //     BlocProvider.of<NotificationServiceBloc>(context)
    //   //         .add(GetBadgeCountEvent());
    //   //   });
    // }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _didChangeAppLifecycleState(state);
  }

  @override
  Widget buildBase(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector<HomeBloc>()),
        BlocProvider(create: (context) => injector<AccountBloc>()),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 55,
              ),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: const [
                  HomeScreen(),
                  //LogViewerScreen(),
                  AccountScreen(),
                ],
              ),
            ),
            BlocConsumer(
              listener: _cubitListener,
              bloc: _cubit,
              builder: (context, dynamic state) => CustomBottomNavigationBar(
                items: [
                  BottomBarItemData(
                    label: 'Trang chủ',
                    icon: Assets.arrowCircleRightSoWhite,
                    selectedIcon: Assets.arrowCircleRightSoWhite,
                  ),
                  BottomBarItemData(
                    label: 'Tài khoản',
                    icon: Assets.arrowCircleRightSoWhite,
                    selectedIcon: Assets.arrowCircleRightSoWhite,
                  )
                ],
                selectedIdx: state.index,
                onItemSelection: onNavigationPressed,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  AppBlocBase? get bloc => null;
}
