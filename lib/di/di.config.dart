// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cha_cmms/common/components/navigation/navigation_service.dart'
    as _i11;
import 'package:cha_cmms/common/services/firebase/firebase_auth_service.dart'
    as _i8;
import 'package:cha_cmms/common/services/onesignal_notification_service.dart'
    as _i12;
import 'package:cha_cmms/data/data_source/local/datasource/app_config_datasource.dart'
    as _i6;
import 'package:cha_cmms/data/data_source/local/datasource/impl/app_config_datasource.impl.dart'
    as _i7;
import 'package:cha_cmms/data/data_source/local/datasource/impl/user_data_datasource.impl.dart'
    as _i17;
import 'package:cha_cmms/data/data_source/local/datasource/user_data_datasource.dart'
    as _i16;
import 'package:cha_cmms/data/data_source/local/local_data_manager.dart'
    as _i10;
import 'package:cha_cmms/data/data_source/local/sqlite/dao/stock_dao.dart'
    as _i15;
import 'package:cha_cmms/data/data_source/local/sqlite/sqlite_database.dart'
    as _i13;
import 'package:cha_cmms/data/data_source/remote/app_api_service.dart' as _i5;
import 'package:cha_cmms/presentation/modules/main_page/account/bloc/account_bloc.dart'
    as _i18;
import 'package:cha_cmms/presentation/modules/main_page/account/interactor/account_interactor.dart'
    as _i3;
import 'package:cha_cmms/presentation/modules/main_page/account/repository/account_repository.dart'
    as _i4;
import 'package:cha_cmms/presentation/modules/main_page/home/bloc/home_bloc.dart'
    as _i21;
import 'package:cha_cmms/presentation/modules/main_page/home/interactor/home_interactor.dart'
    as _i19;
import 'package:cha_cmms/presentation/modules/main_page/home/repository/home_repository.dart'
    as _i9;
import 'package:cha_cmms/presentation/modules/welcome/splash/bloc/splash_bloc.dart'
    as _i20;
import 'package:cha_cmms/presentation/modules/welcome/splash/interactor/splash_interactor.dart'
    as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'di.dart' as _i22;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.AccountInteractor>(() => _i3.AccountInteractorImpl());
  gh.factory<_i4.AccountRepository>(() => _i4.AccountRepositoryImpl());
  gh.singletonAsync<_i5.AppApiService>(() => appModule.appApiService);
  gh.factory<_i6.AppConfigDataSource>(() => _i7.AppConfigDataSourceImpl());
  gh.singleton<_i8.FirebaseAuthService>(_i8.FirebaseAuthService());
  gh.factory<_i9.HomeRepository>(() => _i9.HomeRepositoryImpl());
  gh.singletonAsync<_i10.LocalDataManager>(() => appModule.localDataManager);
  gh.singleton<_i11.NavigationService>(appModule.navigationService);
  gh.singletonAsync<_i12.OneSignalNotificationService>(
      () => _i12.OneSignalNotificationService.create());
  gh.singleton<_i13.SQLiteDatabase>(_i13.SQLiteDatabaseImpl());
  gh.factory<_i14.SplashInteractor>(() => _i14.SplashInteractorImpl());
  gh.singleton<_i15.StockDAO>(_i15.StockDAO());
  gh.factory<_i16.UserDataDataSource>(() => _i17.UserDataDataSourceImpl());
  gh.factory<_i18.AccountBloc>(
      () => _i18.AccountBloc(gh<_i3.AccountInteractor>()));
  gh.factory<_i19.HomeInteractor>(
      () => _i19.HomeInteractorImpl(gh<_i9.HomeRepository>()));
  gh.factory<_i20.SplashBloc>(
      () => _i20.SplashBloc(gh<_i14.SplashInteractor>()));
  gh.factory<_i21.HomeBloc>(() => _i21.HomeBloc(gh<_i19.HomeInteractor>()));
  return getIt;
}

class _$AppModule extends _i22.AppModule {}
