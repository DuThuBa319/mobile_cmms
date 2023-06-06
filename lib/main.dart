import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'common/components/navigation/navigation_observer.dart';
import 'common/components/navigation/navigation_service.dart';
import 'common/config.dart';
import 'common/constants/app_locale.dart';
import 'common/services/firebase/firebase_service.dart';
import 'common/services/permission_service.dart';
import 'di/di.dart';
import 'domain/entities/app_data.dart';
import 'presentation/common_bloc/app_data_bloc.dart';
import 'presentation/common_widget/export.dart';
import 'presentation/modules/main_page/main_tab/cubit/main_tab_cubit.dart';
import 'presentation/modules/welcome/splash/bloc/splash_bloc.dart';
import 'presentation/modules/welcome/splash/splash_screen.dart';
import 'presentation/route/route.dart';
import 'presentation/theme/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Config.instance.setup();
  configureDependencies();
  await Future.wait([]);

  return runZonedGuarded(
    () async {
      await FirebaseService.initialize();
      //Remove this method to stop OneSignal Debugging
      await initOneSignal();
      runApp(const App());
    },
    (Object error, StackTrace stack) {},
  );
}

Future<void> initOneSignal() async {
  await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  await OneSignal.shared.setAppId('2247a758-2d57-4bff-98dd-6aba60f3f77b');

  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  await OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {});
  final status = await Permission.notification.request();
  if (status.isDenied) {
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
    //  await openAppSettings();
  }

  OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
    // Will be called whenever a notification is received in foreground
    // Display Notification, pass null param for not displaying the notification
    event.complete(event.notification);
  });

  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    // Will be called whenever a notification is opened/button pressed.
  });

  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    // Will be called whenever the permission changes
    // (ie. user taps Allow on the permission prompt in iOS)
  });

  OneSignal.shared
      .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    // Will be called whenever the subscription changes
    // (ie. user gets registered with OneSignal and gets a user ID)
  });

  OneSignal.shared.setEmailSubscriptionObserver(
      (OSEmailSubscriptionStateChanges emailChanges) {
    // Will be called whenever then user's email subscription changes
    // (ie. OneSignal.setEmail(email) is called and the user gets registered
  });
}

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
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            navigatorKey: injector<NavigationService>().navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: appData?.themeData ?? buildDarkTheme().data,
            //localizationsDelegates: const [],
            supportedLocales: AppLocale.supportedLocales,
            locale: appData?.locale ?? AppLocale.vi,
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
