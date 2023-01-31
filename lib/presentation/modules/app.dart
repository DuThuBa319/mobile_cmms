import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../common/components/navigation/navigation_observer.dart';
import '../../common/components/navigation/navigation_service.dart';
import '../../di/di.dart';
import '../../domain/entities/app_data.dart';
import '../../presentation/modules/welcome/splash/bloc/splash_bloc.dart';
import '../../presentation/modules/welcome/splash/splash_screen.dart';
import '../common_bloc/app_data_bloc.dart';
import '../common_widget/text_scale_fixed.dart';
import '../route/route.dart';
import '../theme/theme_data.dart';
import 'main_page/main_tab/cubit/main_tab_cubit.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  final AppDataBloc _appDataBloc = AppDataBloc();

  @override
  void initState() {
    _appDataBloc.initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _appDataBloc),
        BlocProvider(create: (context) => MainTabCubit()),
      ],
      child: BlocBuilder<AppDataBloc, AppData?>(
        builder: (context, appData) {
          return MaterialApp(
            navigatorKey: injector<NavigationService>().navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: appData?.themeData ?? buildDarkTheme().data,
            // // localizationsDelegates: const [
            // //   AppLocalizations.delegate,
            // //   GlobalMaterialLocalizations.delegate,
            // //   GlobalWidgetsLocalizations.delegate,
            // //   GlobalCupertinoLocalizations.delegate,
            // // ],
            // supportedLocales: AppLocale.supportedLocales,
            // locale: appData?.locale ?? AppLocale.vi,
            onGenerateRoute: RouteGenerator.generateRoute,
            home: BlocProvider(
              create: (_) => injector<SplashBloc>(),
              child: SplashScreen(),
            ),
            navigatorObservers: [myNavigatorObserver],
            builder: EasyLoading.init(
              builder: (_, child) {
                return TextScaleFixed(
                  child: child ?? const SizedBox(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
