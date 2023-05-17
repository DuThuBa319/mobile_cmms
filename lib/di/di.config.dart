// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../common/components/navigation/navigation_service.dart' as _i21;
import '../common/services/firebase/firebase_auth_service.dart' as _i15;
import '../common/services/onesignal_notification_service.dart' as _i22;
import '../data/data_source/local/datasource/app_config_datasource.dart' as _i6;
import '../data/data_source/local/datasource/impl/app_config_datasource.impl.dart'
    as _i7;
import '../data/data_source/local/datasource/impl/user_data_datasource.impl.dart'
    as _i31;
import '../data/data_source/local/datasource/user_data_datasource.dart' as _i30;
import '../data/data_source/local/local_data_manager.dart' as _i18;
import '../data/data_source/local/sqlite/dao/stock_dao.dart' as _i27;
import '../data/data_source/local/sqlite/sqlite_database.dart' as _i25;
import '../data/data_source/remote/app_api_service.dart' as _i5;
import '../data/data_source/remote/rest_api_repository/cause/employee_repository.dart'
    as _i9;
import '../data/data_source/remote/rest_api_repository/cause/employee_repository_impl.dart'
    as _i10;
import '../data/data_source/remote/rest_api_repository/employee/employee_repository.dart'
    as _i11;
import '../data/data_source/remote/rest_api_repository/employee/employee_repository_impl.dart'
    as _i12;
import '../data/data_source/remote/rest_api_repository/equipment/equipment_repository.dart'
    as _i13;
import '../data/data_source/remote/rest_api_repository/equipment/equipment_repository_impl.dart'
    as _i14;
import '../data/data_source/remote/rest_api_repository/example/weather_api_repository.dart'
    as _i32;
import '../data/data_source/remote/rest_api_repository/example/weather_api_repository_impl.dart'
    as _i33;
import '../data/data_source/remote/rest_api_repository/example_temp_humid/temperature_api_repository.dart'
    as _i28;
import '../data/data_source/remote/rest_api_repository/example_temp_humid/temperature_api_repository_impl.dart'
    as _i29;
import '../data/data_source/remote/rest_api_repository/maintenance_request/maintenance_request_repository.dart'
    as _i23;
import '../data/data_source/remote/rest_api_repository/maintenance_request/maintenance_resquest_repository_impl.dart'
    as _i24;
import '../data/data_source/remote/rest_api_repository/maintenance_response/maintenance_response_repository.dart'
    as _i19;
import '../data/data_source/remote/rest_api_repository/maintenance_response/maintenance_response_repository_impl.dart'
    as _i20;
import '../data/data_source/remote/rest_api_repository/mock_work_order/work_order_api_repository.dart'
    as _i34;
import '../data/data_source/remote/rest_api_repository/mock_work_order/work_order_api_repository_impl.dart'
    as _i35;
import '../presentation/modules/example/bloc/example_bloc.dart' as _i50;
import '../presentation/modules/example/repository/example_repository.dart'
    as _i37;
import '../presentation/modules/example/usecase/example_usecase.dart' as _i40;
import '../presentation/modules/example_temp_humid/bloc/example_temp_humid_bloc.dart'
    as _i51;
import '../presentation/modules/example_temp_humid/repository/example_temp_humid_repository.dart'
    as _i38;
import '../presentation/modules/example_temp_humid/usecase/example_temp_humid_usecase.dart'
    as _i39;
import '../presentation/modules/main_page/account/bloc/account_bloc.dart'
    as _i36;
import '../presentation/modules/main_page/account/interactor/account_interactor.dart'
    as _i3;
import '../presentation/modules/main_page/account/repository/account_repository.dart'
    as _i4;
import '../presentation/modules/main_page/home/bloc/home_bloc.dart' as _i53;
import '../presentation/modules/main_page/home/interactor/home_interactor.dart'
    as _i41;
import '../presentation/modules/main_page/home/repository/home_repository.dart'
    as _i16;
import '../presentation/modules/main_screen/bloc/main_screen_bloc.dart' as _i54;
import '../presentation/modules/main_screen/repository/main_screen_repository.dart'
    as _i42;
import '../presentation/modules/main_screen/usecase/main_screen_usecase.dart'
    as _i43;
import '../presentation/modules/maintenance_request/bloc/audio_picker_bloc/audio_picker_bloc.dart'
    as _i8;
import '../presentation/modules/maintenance_request/bloc/get_detail_bloc/get_request_info_bloc.dart'
    as _i52;
import '../presentation/modules/maintenance_request/bloc/image_picker_bloc/image_picker_bloc.dart'
    as _i17;
import '../presentation/modules/maintenance_request/bloc/request_bloc/request_bloc.dart'
    as _i46;
import '../presentation/modules/maintenance_request/repository/maintenance_request_repository.dart'
    as _i44;
import '../presentation/modules/maintenance_request/usecase/maintenance_request_usecase.dart'
    as _i45;
import '../presentation/modules/schedule/bloc/schedule_bloc.dart' as _i55;
import '../presentation/modules/schedule/repository/schedule_repository.dart'
    as _i47;
import '../presentation/modules/schedule/usecase/schedule_usecase.dart' as _i48;
import '../presentation/modules/welcome/splash/bloc/splash_bloc.dart' as _i49;
import '../presentation/modules/welcome/splash/interactor/splash_interactor.dart'
    as _i26;
import 'di.dart' as _i56;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
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
  gh.factory<_i8.AudioPickerBloc>(() => _i8.AudioPickerBloc());
  gh.factory<_i9.CauseRepository>(() => _i10.CauseRepositoryImpl());
  gh.factory<_i11.EmployeeRepository>(() => _i12.EmployeeRepositoryImpl());
  gh.factory<_i13.EquipmentRepository>(() => _i14.EquipmentRepositoryImpl());
  gh.singleton<_i15.FirebaseAuthService>(_i15.FirebaseAuthService());
  gh.factory<_i16.HomeRepository>(() => _i16.HomeRepositoryImpl());
  gh.factory<_i17.ImagePickerBloc>(() => _i17.ImagePickerBloc());
  gh.singletonAsync<_i18.LocalDataManager>(() => appModule.localDataManager);
  gh.factory<_i19.MaintenanceResponseRepository>(
      () => _i20.MaintenanceResponseRepositoryImpl());
  gh.singleton<_i21.NavigationService>(appModule.navigationService);
  gh.singletonAsync<_i22.OneSignalNotificationService>(
      () => _i22.OneSignalNotificationService.create());
  gh.factory<_i23.RequestRepository>(() => _i24.RequestRepositoryImpl());
  gh.singleton<_i25.SQLiteDatabase>(_i25.SQLiteDatabaseImpl());
  gh.factory<_i26.SplashInteractor>(() => _i26.SplashInteractorImpl());
  gh.singleton<_i27.StockDAO>(_i27.StockDAO());
  gh.factory<_i28.TemperatureApiRespository>(
      () => _i29.TemperatureApiRespositoryImpl());
  gh.factory<_i30.UserDataDataSource>(() => _i31.UserDataDataSourceImpl());
  gh.factory<_i32.WeatherApiRespository>(
      () => _i33.WeatherApiRespositoryImpl());
  gh.factory<_i34.WorkOrderApiRepository>(
      () => _i35.WorkOrderApiRepositoryImpl());
  gh.factory<_i36.AccountBloc>(
      () => _i36.AccountBloc(gh<_i3.AccountInteractor>()));
  gh.factory<_i37.ExampleRepository>(
      () => _i37.ExampleRepositoryImpl(gh<_i32.WeatherApiRespository>()));
  gh.factory<_i38.ExampleTempHumidRepository>(() =>
      _i38.ExampleTempHumidRepositoryImpl(
          gh<_i28.TemperatureApiRespository>()));
  gh.factory<_i39.ExampleTempHumidUsecase>(() =>
      _i39.ExampleTempHumidUsecaseImpl(gh<_i38.ExampleTempHumidRepository>()));
  gh.factory<_i40.ExampleUsecase>(
      () => _i40.ExampleUsecaseImpl(gh<_i37.ExampleRepository>()));
  gh.factory<_i41.HomeInteractor>(
      () => _i41.HomeInteractorImpl(gh<_i16.HomeRepository>()));
  gh.factory<_i42.MainScreenRepository>(() =>
      _i42.MainScreenRepositoryImpl(gh<_i19.MaintenanceResponseRepository>()));
  gh.factory<_i43.MainScreenUsecase>(
      () => _i43.MainScreenUsecaseImpl(gh<_i42.MainScreenRepository>()));
  gh.factory<_i44.MaintenanceRequestRepository>(
      () => _i44.MaintenanceRequestRepositoryImpl(
            gh<_i13.EquipmentRepository>(),
            gh<_i11.EmployeeRepository>(),
            gh<_i9.CauseRepository>(),
            gh<_i23.RequestRepository>(),
          ));
  gh.factory<_i45.MaintenanceRequestUsecase>(() =>
      _i45.MaintenanceRequestUsecaseImpl(
          gh<_i44.MaintenanceRequestRepository>()));
  gh.factory<_i46.RequestBloc>(
      () => _i46.RequestBloc(gh<_i44.MaintenanceRequestRepository>()));
  gh.factory<_i47.ScheduleRepository>(() => _i47.ScheduleRepositoryImpl(
        gh<_i34.WorkOrderApiRepository>(),
        gh<_i19.MaintenanceResponseRepository>(),
      ));
  gh.factory<_i48.ScheduleUsecase>(
      () => _i48.ScheduleUsecaseImpl(gh<_i47.ScheduleRepository>()));
  gh.factory<_i49.SplashBloc>(
      () => _i49.SplashBloc(gh<_i26.SplashInteractor>()));
  gh.factory<_i50.ExampleBloc>(
      () => _i50.ExampleBloc(gh<_i40.ExampleUsecase>()));
  gh.factory<_i51.ExampleTempHumidBloc>(
      () => _i51.ExampleTempHumidBloc(gh<_i39.ExampleTempHumidUsecase>()));
  gh.factory<_i52.GetRequestInfoBloc>(
      () => _i52.GetRequestInfoBloc(gh<_i45.MaintenanceRequestUsecase>()));
  gh.factory<_i53.HomeBloc>(() => _i53.HomeBloc(gh<_i41.HomeInteractor>()));
  gh.factory<_i54.MainScreenBloc>(() => _i54.MainScreenBloc(
        gh<_i43.MainScreenUsecase>(),
        gh<_i42.MainScreenRepository>(),
      ));
  gh.factory<_i55.ScheduleBloc>(() => _i55.ScheduleBloc(
        gh<_i48.ScheduleUsecase>(),
        gh<_i47.ScheduleRepository>(),
      ));
  return getIt;
}

class _$AppModule extends _i56.AppModule {}
