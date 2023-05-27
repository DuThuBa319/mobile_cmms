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

import '../common/components/navigation/navigation_service.dart' as _i27;
import '../common/services/firebase/firebase_auth_service.dart' as _i17;
import '../common/services/onesignal_notification_service.dart' as _i28;
import '../data/data_source/local/datasource/app_config_datasource.dart' as _i6;
import '../data/data_source/local/datasource/impl/app_config_datasource.impl.dart'
    as _i7;
import '../data/data_source/local/datasource/impl/user_data_datasource.impl.dart'
    as _i42;
import '../data/data_source/local/datasource/user_data_datasource.dart' as _i41;
import '../data/data_source/local/local_data_manager.dart' as _i20;
import '../data/data_source/local/sqlite/dao/stock_dao.dart' as _i38;
import '../data/data_source/local/sqlite/sqlite_database.dart' as _i34;
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
    as _i43;
import '../data/data_source/remote/rest_api_repository/example/weather_api_repository_impl.dart'
    as _i44;
import '../data/data_source/remote/rest_api_repository/example_temp_humid/temperature_api_repository.dart'
    as _i39;
import '../data/data_source/remote/rest_api_repository/example_temp_humid/temperature_api_repository_impl.dart'
    as _i40;
import '../data/data_source/remote/rest_api_repository/maintenance_request/maintenance_request_repository.dart'
    as _i30;
import '../data/data_source/remote/rest_api_repository/maintenance_request/maintenance_resquest_repository_impl.dart'
    as _i31;
import '../data/data_source/remote/rest_api_repository/maintenance_response/maintenance_response_repository.dart'
    as _i21;
import '../data/data_source/remote/rest_api_repository/maintenance_response/maintenance_response_repository_impl.dart'
    as _i22;
import '../data/data_source/remote/rest_api_repository/material/material_info_repository.dart'
    as _i23;
import '../data/data_source/remote/rest_api_repository/material/material_info_repository_impl.dart'
    as _i24;
import '../data/data_source/remote/rest_api_repository/material/material_repository.dart'
    as _i25;
import '../data/data_source/remote/rest_api_repository/material/material_repositpry_impl.dart'
    as _i26;
import '../data/data_source/remote/rest_api_repository/mock_work_order/work_order_api_repository.dart'
    as _i45;
import '../data/data_source/remote/rest_api_repository/mock_work_order/work_order_api_repository_impl.dart'
    as _i46;
import '../presentation/custom/audio_picker/audio_picker_bloc/audio_picker_bloc.dart'
    as _i8;
import '../presentation/custom/image_picker/image_picker_bloc/image_picker_bloc.dart'
    as _i19;
import '../presentation/custom/select_info_screen/bloc/receive_info_selection_bloc/receive_info_selection_bloc.dart'
    as _i29;
import '../presentation/custom/select_info_screen/bloc/select_info_bloc/select_info_bloc.dart'
    as _i63;
import '../presentation/custom/select_info_screen/repository/select_info_repository.dart'
    as _i35;
import '../presentation/custom/select_info_screen/usecase/select_info_usecase.dart'
    as _i36;
import '../presentation/modules/add_material/bloc/add_material_bloc.dart'
    as _i65;
import '../presentation/modules/add_material/repository/add_material_repository.dart'
    as _i48;
import '../presentation/modules/add_material/usecase/add_material_usecase.dart'
    as _i49;
import '../presentation/modules/example/bloc/example_bloc.dart' as _i66;
import '../presentation/modules/example/repository/example_repository.dart'
    as _i50;
import '../presentation/modules/example/usecase/example_usecase.dart' as _i53;
import '../presentation/modules/example_temp_humid/bloc/example_temp_humid_bloc.dart'
    as _i67;
import '../presentation/modules/example_temp_humid/repository/example_temp_humid_repository.dart'
    as _i51;
import '../presentation/modules/example_temp_humid/usecase/example_temp_humid_usecase.dart'
    as _i52;
import '../presentation/modules/main_page/account/bloc/account_bloc.dart'
    as _i47;
import '../presentation/modules/main_page/account/interactor/account_interactor.dart'
    as _i3;
import '../presentation/modules/main_page/account/repository/account_repository.dart'
    as _i4;
import '../presentation/modules/main_page/home/bloc/home_bloc.dart' as _i69;
import '../presentation/modules/main_page/home/interactor/home_interactor.dart'
    as _i54;
import '../presentation/modules/main_page/home/repository/home_repository.dart'
    as _i18;
import '../presentation/modules/main_screen/bloc/main_screen_bloc.dart' as _i70;
import '../presentation/modules/main_screen/repository/main_screen_repository.dart'
    as _i55;
import '../presentation/modules/main_screen/usecase/main_screen_usecase.dart'
    as _i56;
import '../presentation/modules/maintenance_request/bloc/get_detail_bloc/get_request_info_bloc.dart'
    as _i68;
import '../presentation/modules/maintenance_request/bloc/request_bloc/request_bloc.dart'
    as _i60;
import '../presentation/modules/maintenance_request/repository/maintenance_request_repository.dart'
    as _i57;
import '../presentation/modules/maintenance_request/usecase/maintenance_request_usecase.dart'
    as _i58;
import '../presentation/modules/schedule/bloc/schedule_bloc.dart' as _i71;
import '../presentation/modules/schedule/repository/schedule_repository.dart'
    as _i61;
import '../presentation/modules/schedule/usecase/schedule_usecase.dart' as _i62;
import '../presentation/modules/task/repair_task/bloc/repair_task_bloc.dart'
    as _i59;
import '../presentation/modules/task/repository/response_repository.dart'
    as _i32;
import '../presentation/modules/task/usecase/response_usecase.dart' as _i33;
import '../presentation/modules/welcome/splash/bloc/splash_bloc.dart' as _i64;
import '../presentation/modules/welcome/splash/interactor/splash_interactor.dart'
    as _i37;
import 'di.dart' as _i72;

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
  gh.factory<_i23.MaterialInfoRepository>(
      () => _i24.MaterialInfoRepositoryImpl());
  gh.factory<_i25.MaterialRepository>(() => _i26.MaterialRepositoryImpl());
  gh.singleton<_i27.NavigationService>(appModule.navigationService);
  gh.singletonAsync<_i28.OneSignalNotificationService>(
      () => _i28.OneSignalNotificationService.create());
  gh.factory<_i29.ReceiveInfoSelectionBloc>(
      () => _i29.ReceiveInfoSelectionBloc());
  gh.factory<_i30.RequestRepository>(() => _i31.RequestRepositoryImpl());
  gh.factory<_i32.ResponseRepository>(() =>
      _i32.ResponseRepositoryImpl(gh<_i21.MaintenanceResponseRepository>()));
  gh.factory<_i33.ResponseUsecase>(
      () => _i33.ResponseUsecaseImpl(gh<_i32.ResponseRepository>()));
  gh.singleton<_i34.SQLiteDatabase>(_i34.SQLiteDatabaseImpl());
  gh.factory<_i35.SelectInfoRepository>(() => _i35.SelectInfoRepositoryImpl(
        gh<_i9.CauseRepository>(),
        gh<_i11.CorrectionRepository>(),
      ));
  gh.factory<_i36.SelectInfoUsecase>(
      () => _i36.SelectInfoUsecaseImpl(gh<_i35.SelectInfoRepository>()));
  gh.factory<_i37.SplashInteractor>(() => _i37.SplashInteractorImpl());
  gh.singleton<_i38.StockDAO>(_i38.StockDAO());
  gh.factory<_i39.TemperatureApiRespository>(
      () => _i40.TemperatureApiRespositoryImpl());
  gh.factory<_i41.UserDataDataSource>(() => _i42.UserDataDataSourceImpl());
  gh.factory<_i43.WeatherApiRespository>(
      () => _i44.WeatherApiRespositoryImpl());
  gh.factory<_i45.WorkOrderApiRepository>(
      () => _i46.WorkOrderApiRepositoryImpl());
  gh.factory<_i47.AccountBloc>(
      () => _i47.AccountBloc(gh<_i3.AccountInteractor>()));
  gh.factory<_i48.AddMaterialRepository>(() => _i48.AddMaterialRepositoryImpl(
        gh<_i25.MaterialRepository>(),
        gh<_i23.MaterialInfoRepository>(),
      ));
  gh.factory<_i49.AddMaterialUsecase>(
      () => _i49.AddMaterialUsecaseImpl(gh<_i48.AddMaterialRepository>()));
  gh.factory<_i50.ExampleRepository>(
      () => _i50.ExampleRepositoryImpl(gh<_i43.WeatherApiRespository>()));
  gh.factory<_i51.ExampleTempHumidRepository>(() =>
      _i51.ExampleTempHumidRepositoryImpl(
          gh<_i39.TemperatureApiRespository>()));
  gh.factory<_i52.ExampleTempHumidUsecase>(() =>
      _i52.ExampleTempHumidUsecaseImpl(gh<_i51.ExampleTempHumidRepository>()));
  gh.factory<_i53.ExampleUsecase>(
      () => _i53.ExampleUsecaseImpl(gh<_i50.ExampleRepository>()));
  gh.factory<_i54.HomeInteractor>(
      () => _i54.HomeInteractorImpl(gh<_i18.HomeRepository>()));
  gh.factory<_i55.MainScreenRepository>(() =>
      _i55.MainScreenRepositoryImpl(gh<_i21.MaintenanceResponseRepository>()));
  gh.factory<_i56.MainScreenUsecase>(
      () => _i56.MainScreenUsecaseImpl(gh<_i55.MainScreenRepository>()));
  gh.factory<_i57.MaintenanceRequestRepository>(
      () => _i57.MaintenanceRequestRepositoryImpl(
            gh<_i15.EquipmentRepository>(),
            gh<_i13.EmployeeRepository>(),
            gh<_i9.CauseRepository>(),
            gh<_i30.RequestRepository>(),
          ));
  gh.factory<_i58.MaintenanceRequestUsecase>(() =>
      _i58.MaintenanceRequestUsecaseImpl(
          gh<_i57.MaintenanceRequestRepository>()));
  gh.factory<_i59.RepairTaskBloc>(() => _i59.RepairTaskBloc(
        gh<_i33.ResponseUsecase>(),
        gh<_i32.ResponseRepository>(),
      ));
  gh.factory<_i60.RequestBloc>(
      () => _i60.RequestBloc(gh<_i57.MaintenanceRequestRepository>()));
  gh.factory<_i61.ScheduleRepository>(() => _i61.ScheduleRepositoryImpl(
        gh<_i45.WorkOrderApiRepository>(),
        gh<_i21.MaintenanceResponseRepository>(),
      ));
  gh.factory<_i62.ScheduleUsecase>(
      () => _i62.ScheduleUsecaseImpl(gh<_i61.ScheduleRepository>()));
  gh.factory<_i63.SelectInfoBloc>(
      () => _i63.SelectInfoBloc(gh<_i36.SelectInfoUsecase>()));
  gh.factory<_i64.SplashBloc>(
      () => _i64.SplashBloc(gh<_i37.SplashInteractor>()));
  gh.factory<_i65.AddMaterialBloc>(() => _i65.AddMaterialBloc(
        gh<_i49.AddMaterialUsecase>(),
        gh<_i48.AddMaterialRepository>(),
      ));
  gh.factory<_i66.ExampleBloc>(
      () => _i66.ExampleBloc(gh<_i53.ExampleUsecase>()));
  gh.factory<_i67.ExampleTempHumidBloc>(
      () => _i67.ExampleTempHumidBloc(gh<_i52.ExampleTempHumidUsecase>()));
  gh.factory<_i68.GetRequestInfoBloc>(
      () => _i68.GetRequestInfoBloc(gh<_i58.MaintenanceRequestUsecase>()));
  gh.factory<_i69.HomeBloc>(() => _i69.HomeBloc(gh<_i54.HomeInteractor>()));
  gh.factory<_i70.MainScreenBloc>(() => _i70.MainScreenBloc(
        gh<_i56.MainScreenUsecase>(),
        gh<_i55.MainScreenRepository>(),
      ));
  gh.factory<_i71.ScheduleBloc>(() => _i71.ScheduleBloc(
        gh<_i62.ScheduleUsecase>(),
        gh<_i61.ScheduleRepository>(),
      ));
  return getIt;
}

class _$AppModule extends _i72.AppModule {}
