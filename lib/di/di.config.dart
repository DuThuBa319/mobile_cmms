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

import '../common/components/navigation/navigation_service.dart' as _i23;
import '../common/services/firebase/firebase_auth_service.dart' as _i17;
import '../common/services/onesignal_notification_service.dart' as _i24;
import '../data/data_source/local/datasource/app_config_datasource.dart' as _i6;
import '../data/data_source/local/datasource/impl/app_config_datasource.impl.dart'
    as _i7;
import '../data/data_source/local/datasource/impl/user_data_datasource.impl.dart'
    as _i37;
import '../data/data_source/local/datasource/user_data_datasource.dart' as _i36;
import '../data/data_source/local/local_data_manager.dart' as _i20;
import '../data/data_source/local/sqlite/dao/stock_dao.dart' as _i33;
import '../data/data_source/local/sqlite/sqlite_database.dart' as _i29;
import '../data/data_source/remote/app_api_service.dart' as _i5;
import '../data/data_source/remote/rest_api_repository/cause/cause_repository.dart'
    as _i9;
import '../data/data_source/remote/rest_api_repository/cause/cause_repository_impl.dart'
    as _i10;
import '../data/data_source/remote/rest_api_repository/correction/correction_repository.dart'
    as _i11;
import '../data/data_source/remote/rest_api_repository/correction/correction_repository_impl.dart'
    as _i12;
import '../data/data_source/remote/rest_api_repository/employee/employee_repository.dart'
    as _i13;
import '../data/data_source/remote/rest_api_repository/employee/employee_repository_impl.dart'
    as _i14;
import '../data/data_source/remote/rest_api_repository/equipment/equipment_repository.dart'
    as _i15;
import '../data/data_source/remote/rest_api_repository/equipment/equipment_repository_impl.dart'
    as _i16;
import '../data/data_source/remote/rest_api_repository/example/weather_api_repository.dart'
    as _i38;
import '../data/data_source/remote/rest_api_repository/example/weather_api_repository_impl.dart'
    as _i39;
import '../data/data_source/remote/rest_api_repository/example_temp_humid/temperature_api_repository.dart'
    as _i34;
import '../data/data_source/remote/rest_api_repository/example_temp_humid/temperature_api_repository_impl.dart'
    as _i35;
import '../data/data_source/remote/rest_api_repository/maintenance_request/maintenance_request_repository.dart'
    as _i25;
import '../data/data_source/remote/rest_api_repository/maintenance_request/maintenance_resquest_repository_impl.dart'
    as _i26;
import '../data/data_source/remote/rest_api_repository/maintenance_response/maintenance_response_repository.dart'
    as _i21;
import '../data/data_source/remote/rest_api_repository/maintenance_response/maintenance_response_repository_impl.dart'
    as _i22;
import '../data/data_source/remote/rest_api_repository/mock_work_order/work_order_api_repository.dart'
    as _i40;
import '../data/data_source/remote/rest_api_repository/mock_work_order/work_order_api_repository_impl.dart'
    as _i41;
import '../presentation/custom/audio_picker/audio_picker_bloc/audio_picker_bloc.dart'
    as _i8;
import '../presentation/custom/image_picker/image_picker_bloc/image_picker_bloc.dart'
    as _i19;
import '../presentation/custom/select_info_screen/bloc/select_info_bloc.dart'
    as _i56;
import '../presentation/custom/select_info_screen/repository/select_info_repository.dart'
    as _i30;
import '../presentation/custom/select_info_screen/usecase/select_info_usecase.dart'
    as _i31;
import '../presentation/modules/example/bloc/example_bloc.dart' as _i58;
import '../presentation/modules/example/repository/example_repository.dart'
    as _i43;
import '../presentation/modules/example/usecase/example_usecase.dart' as _i46;
import '../presentation/modules/example_temp_humid/bloc/example_temp_humid_bloc.dart'
    as _i59;
import '../presentation/modules/example_temp_humid/repository/example_temp_humid_repository.dart'
    as _i44;
import '../presentation/modules/example_temp_humid/usecase/example_temp_humid_usecase.dart'
    as _i45;
import '../presentation/modules/main_page/account/bloc/account_bloc.dart'
    as _i42;
import '../presentation/modules/main_page/account/interactor/account_interactor.dart'
    as _i3;
import '../presentation/modules/main_page/account/repository/account_repository.dart'
    as _i4;
import '../presentation/modules/main_page/home/bloc/home_bloc.dart' as _i61;
import '../presentation/modules/main_page/home/interactor/home_interactor.dart'
    as _i47;
import '../presentation/modules/main_page/home/repository/home_repository.dart'
    as _i18;
import '../presentation/modules/main_screen/bloc/main_screen_bloc.dart' as _i62;
import '../presentation/modules/main_screen/repository/main_screen_repository.dart'
    as _i48;
import '../presentation/modules/main_screen/usecase/main_screen_usecase.dart'
    as _i49;
import '../presentation/modules/maintenance_request/bloc/get_detail_bloc/get_request_info_bloc.dart'
    as _i60;
import '../presentation/modules/maintenance_request/bloc/request_bloc/request_bloc.dart'
    as _i53;
import '../presentation/modules/maintenance_request/repository/maintenance_request_repository.dart'
    as _i50;
import '../presentation/modules/maintenance_request/usecase/maintenance_request_usecase.dart'
    as _i51;
import '../presentation/modules/schedule/bloc/schedule_bloc.dart' as _i63;
import '../presentation/modules/schedule/repository/schedule_repository.dart'
    as _i54;
import '../presentation/modules/schedule/usecase/schedule_usecase.dart' as _i55;
import '../presentation/modules/task/repair_task/bloc/repair_task_bloc.dart'
    as _i52;
import '../presentation/modules/task/repository/response_repository.dart'
    as _i27;
import '../presentation/modules/task/usecase/response_usecase.dart' as _i28;
import '../presentation/modules/welcome/splash/bloc/splash_bloc.dart' as _i57;
import '../presentation/modules/welcome/splash/interactor/splash_interactor.dart'
    as _i32;
import 'di.dart' as _i64;

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
  gh.factory<_i11.CorrectionRepository>(() => _i12.CorrectionRepositoryImpl());
  gh.factory<_i13.EmployeeRepository>(() => _i14.EmployeeRepositoryImpl());
  gh.factory<_i15.EquipmentRepository>(() => _i16.EquipmentRepositoryImpl());
  gh.singleton<_i17.FirebaseAuthService>(_i17.FirebaseAuthService());
  gh.factory<_i18.HomeRepository>(() => _i18.HomeRepositoryImpl());
  gh.factory<_i19.ImagePickerBloc>(() => _i19.ImagePickerBloc());
  gh.singletonAsync<_i20.LocalDataManager>(() => appModule.localDataManager);
  gh.factory<_i21.MaintenanceResponseRepository>(
      () => _i22.MaintenanceResponseRepositoryImpl());
  gh.singleton<_i23.NavigationService>(appModule.navigationService);
  gh.singletonAsync<_i24.OneSignalNotificationService>(
      () => _i24.OneSignalNotificationService.create());
  gh.factory<_i25.RequestRepository>(() => _i26.RequestRepositoryImpl());
  gh.factory<_i27.ResponseRepository>(() =>
      _i27.ResponseRepositoryImpl(gh<_i21.MaintenanceResponseRepository>()));
  gh.factory<_i28.ResponseUsecase>(
      () => _i28.ResponseUsecaseImpl(gh<_i27.ResponseRepository>()));
  gh.singleton<_i29.SQLiteDatabase>(_i29.SQLiteDatabaseImpl());
  gh.factory<_i30.SelectInfoRepository>(() => _i30.SelectInfoRepositoryImpl(
        gh<_i9.CauseRepository>(),
        gh<_i11.CorrectionRepository>(),
      ));
  gh.factory<_i31.SelectInfoUsecase>(
      () => _i31.SelectInfoUsecaseImpl(gh<_i30.SelectInfoRepository>()));
  gh.factory<_i32.SplashInteractor>(() => _i32.SplashInteractorImpl());
  gh.singleton<_i33.StockDAO>(_i33.StockDAO());
  gh.factory<_i34.TemperatureApiRespository>(
      () => _i35.TemperatureApiRespositoryImpl());
  gh.factory<_i36.UserDataDataSource>(() => _i37.UserDataDataSourceImpl());
  gh.factory<_i38.WeatherApiRespository>(
      () => _i39.WeatherApiRespositoryImpl());
  gh.factory<_i40.WorkOrderApiRepository>(
      () => _i41.WorkOrderApiRepositoryImpl());
  gh.factory<_i42.AccountBloc>(
      () => _i42.AccountBloc(gh<_i3.AccountInteractor>()));
  gh.factory<_i43.ExampleRepository>(
      () => _i43.ExampleRepositoryImpl(gh<_i38.WeatherApiRespository>()));
  gh.factory<_i44.ExampleTempHumidRepository>(() =>
      _i44.ExampleTempHumidRepositoryImpl(
          gh<_i34.TemperatureApiRespository>()));
  gh.factory<_i45.ExampleTempHumidUsecase>(() =>
      _i45.ExampleTempHumidUsecaseImpl(gh<_i44.ExampleTempHumidRepository>()));
  gh.factory<_i46.ExampleUsecase>(
      () => _i46.ExampleUsecaseImpl(gh<_i43.ExampleRepository>()));
  gh.factory<_i47.HomeInteractor>(
      () => _i47.HomeInteractorImpl(gh<_i18.HomeRepository>()));
  gh.factory<_i48.MainScreenRepository>(() =>
      _i48.MainScreenRepositoryImpl(gh<_i21.MaintenanceResponseRepository>()));
  gh.factory<_i49.MainScreenUsecase>(
      () => _i49.MainScreenUsecaseImpl(gh<_i48.MainScreenRepository>()));
  gh.factory<_i50.MaintenanceRequestRepository>(
      () => _i50.MaintenanceRequestRepositoryImpl(
            gh<_i15.EquipmentRepository>(),
            gh<_i13.EmployeeRepository>(),
            gh<_i9.CauseRepository>(),
            gh<_i25.RequestRepository>(),
          ));
  gh.factory<_i51.MaintenanceRequestUsecase>(() =>
      _i51.MaintenanceRequestUsecaseImpl(
          gh<_i50.MaintenanceRequestRepository>()));
  gh.factory<_i52.RepairTaskBloc>(() => _i52.RepairTaskBloc(
        gh<_i28.ResponseUsecase>(),
        gh<_i27.ResponseRepository>(),
      ));
  gh.factory<_i53.RequestBloc>(
      () => _i53.RequestBloc(gh<_i50.MaintenanceRequestRepository>()));
  gh.factory<_i54.ScheduleRepository>(() => _i54.ScheduleRepositoryImpl(
        gh<_i40.WorkOrderApiRepository>(),
        gh<_i21.MaintenanceResponseRepository>(),
      ));
  gh.factory<_i55.ScheduleUsecase>(
      () => _i55.ScheduleUsecaseImpl(gh<_i54.ScheduleRepository>()));
  gh.factory<_i56.SelectInfoBloc>(
      () => _i56.SelectInfoBloc(gh<_i31.SelectInfoUsecase>()));
  gh.factory<_i57.SplashBloc>(
      () => _i57.SplashBloc(gh<_i32.SplashInteractor>()));
  gh.factory<_i58.ExampleBloc>(
      () => _i58.ExampleBloc(gh<_i46.ExampleUsecase>()));
  gh.factory<_i59.ExampleTempHumidBloc>(
      () => _i59.ExampleTempHumidBloc(gh<_i45.ExampleTempHumidUsecase>()));
  gh.factory<_i60.GetRequestInfoBloc>(
      () => _i60.GetRequestInfoBloc(gh<_i51.MaintenanceRequestUsecase>()));
  gh.factory<_i61.HomeBloc>(() => _i61.HomeBloc(gh<_i47.HomeInteractor>()));
  gh.factory<_i62.MainScreenBloc>(() => _i62.MainScreenBloc(
        gh<_i49.MainScreenUsecase>(),
        gh<_i48.MainScreenRepository>(),
      ));
  gh.factory<_i63.ScheduleBloc>(() => _i63.ScheduleBloc(
        gh<_i55.ScheduleUsecase>(),
        gh<_i54.ScheduleRepository>(),
      ));
  return getIt;
}

class _$AppModule extends _i64.AppModule {}
