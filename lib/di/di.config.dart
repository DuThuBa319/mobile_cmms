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

import '../common/components/navigation/navigation_service.dart' as _i30;
import '../common/services/firebase/firebase_auth_service.dart' as _i17;
import '../common/services/onesignal_notification_service.dart' as _i31;
import '../data/data_source/local/datasource/app_config_datasource.dart' as _i6;
import '../data/data_source/local/datasource/impl/app_config_datasource.impl.dart'
    as _i7;
import '../data/data_source/local/datasource/impl/user_data_datasource.impl.dart'
    as _i45;
import '../data/data_source/local/datasource/user_data_datasource.dart' as _i44;
import '../data/data_source/local/local_data_manager.dart' as _i20;
import '../data/data_source/local/sqlite/dao/stock_dao.dart' as _i41;
import '../data/data_source/local/sqlite/sqlite_database.dart' as _i37;
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
    as _i46;
import '../data/data_source/remote/rest_api_repository/example/weather_api_repository_impl.dart'
    as _i47;
import '../data/data_source/remote/rest_api_repository/example_temp_humid/temperature_api_repository.dart'
    as _i42;
import '../data/data_source/remote/rest_api_repository/example_temp_humid/temperature_api_repository_impl.dart'
    as _i43;
import '../data/data_source/remote/rest_api_repository/maintenance_request/maintenance_request_repository.dart'
    as _i33;
import '../data/data_source/remote/rest_api_repository/maintenance_request/maintenance_resquest_repository_impl.dart'
    as _i34;
import '../data/data_source/remote/rest_api_repository/maintenance_response/maintenance_response_repository.dart'
    as _i22;
import '../data/data_source/remote/rest_api_repository/maintenance_response/maintenance_response_repository_impl.dart'
    as _i23;
import '../data/data_source/remote/rest_api_repository/material/material_info_repository.dart'
    as _i24;
import '../data/data_source/remote/rest_api_repository/material/material_info_repository_impl.dart'
    as _i25;
import '../data/data_source/remote/rest_api_repository/material/material_repository.dart'
    as _i26;
import '../data/data_source/remote/rest_api_repository/material/material_repositpry_impl.dart'
    as _i27;
import '../data/data_source/remote/rest_api_repository/mock_work_order/work_order_api_repository.dart'
    as _i48;
import '../data/data_source/remote/rest_api_repository/mock_work_order/work_order_api_repository_impl.dart'
    as _i49;
import '../data/data_source/remote/rest_api_repository/mold/mold_repository.dart'
    as _i28;
import '../data/data_source/remote/rest_api_repository/mold/mold_repository_impl.dart'
    as _i29;
import '../presentation/custom/audio_picker/audio_picker_bloc/audio_picker_bloc.dart'
    as _i8;
import '../presentation/custom/image_picker/image_picker_bloc/image_picker_bloc.dart'
    as _i19;
import '../presentation/custom/select_info_screen/bloc/receive_info_selection_bloc/receive_info_selection_bloc.dart'
    as _i32;
import '../presentation/custom/select_info_screen/bloc/select_info_bloc/select_info_bloc.dart'
    as _i67;
import '../presentation/custom/select_info_screen/repository/select_info_repository.dart'
    as _i38;
import '../presentation/custom/select_info_screen/usecase/select_info_usecase.dart'
    as _i39;
import '../presentation/modules/add_material/bloc/add_material_bloc.dart'
    as _i69;
import '../presentation/modules/add_material/repository/add_material_repository.dart'
    as _i51;
import '../presentation/modules/add_material/usecase/add_material_usecase.dart'
    as _i52;
import '../presentation/modules/example/bloc/example_bloc.dart' as _i70;
import '../presentation/modules/example/repository/example_repository.dart'
    as _i53;
import '../presentation/modules/example/usecase/example_usecase.dart' as _i56;
import '../presentation/modules/example_temp_humid/bloc/example_temp_humid_bloc.dart'
    as _i71;
import '../presentation/modules/example_temp_humid/repository/example_temp_humid_repository.dart'
    as _i54;
import '../presentation/modules/example_temp_humid/usecase/example_temp_humid_usecase.dart'
    as _i55;
import '../presentation/modules/login/bloc/login_bloc.dart' as _i21;
import '../presentation/modules/main_page/account/bloc/account_bloc.dart'
    as _i50;
import '../presentation/modules/main_page/account/interactor/account_interactor.dart'
    as _i3;
import '../presentation/modules/main_page/account/repository/account_repository.dart'
    as _i4;
import '../presentation/modules/main_page/home/bloc/home_bloc.dart' as _i73;
import '../presentation/modules/main_page/home/interactor/home_interactor.dart'
    as _i58;
import '../presentation/modules/main_page/home/repository/home_repository.dart'
    as _i18;
import '../presentation/modules/main_screen/bloc/main_screen_bloc.dart' as _i74;
import '../presentation/modules/main_screen/repository/main_screen_repository.dart'
    as _i59;
import '../presentation/modules/main_screen/usecase/main_screen_usecase.dart'
    as _i60;
import '../presentation/modules/maintenance_request/bloc/get_detail_bloc/get_request_info_bloc.dart'
    as _i72;
import '../presentation/modules/maintenance_request/bloc/request_bloc/request_bloc.dart'
    as _i64;
import '../presentation/modules/maintenance_request/repository/maintenance_request_repository.dart'
    as _i61;
import '../presentation/modules/maintenance_request/usecase/maintenance_request_usecase.dart'
    as _i62;
import '../presentation/modules/schedule/bloc/schedule_bloc.dart' as _i75;
import '../presentation/modules/schedule/repository/schedule_repository.dart'
    as _i65;
import '../presentation/modules/schedule/usecase/schedule_usecase.dart' as _i66;
import '../presentation/modules/task/general_check/bloc/general_check_bloc.dart'
    as _i57;
import '../presentation/modules/task/repair_task/bloc/repair_task_bloc.dart'
    as _i63;
import '../presentation/modules/task/repository/response_repository.dart'
    as _i35;
import '../presentation/modules/task/usecase/response_usecase.dart' as _i36;
import '../presentation/modules/welcome/splash/bloc/splash_bloc.dart' as _i68;
import '../presentation/modules/welcome/splash/interactor/splash_interactor.dart'
    as _i40;
import 'di.dart' as _i76;

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
  gh.factory<_i21.LoginBloc>(() => _i21.LoginBloc());
  gh.factory<_i22.MaintenanceResponseRepository>(
      () => _i23.MaintenanceResponseRepositoryImpl());
  gh.factory<_i24.MaterialInfoRepository>(
      () => _i25.MaterialInfoRepositoryImpl());
  gh.factory<_i26.MaterialRepository>(() => _i27.MaterialRepositoryImpl());
  gh.factory<_i28.MoldRepository>(() => _i29.MoldRepositoryImpl());
  gh.singleton<_i30.NavigationService>(appModule.navigationService);
  gh.singletonAsync<_i31.OneSignalNotificationService>(
      () => _i31.OneSignalNotificationService.create());
  gh.factory<_i32.ReceiveInfoSelectionBloc>(
      () => _i32.ReceiveInfoSelectionBloc());
  gh.factory<_i33.RequestRepository>(() => _i34.RequestRepositoryImpl());
  gh.factory<_i35.ResponseRepository>(() => _i35.ResponseRepositoryImpl(
        gh<_i22.MaintenanceResponseRepository>(),
        gh<_i26.MaterialRepository>(),
      ));
  gh.factory<_i36.ResponseUsecase>(
      () => _i36.ResponseUsecaseImpl(gh<_i35.ResponseRepository>()));
  gh.singleton<_i37.SQLiteDatabase>(_i37.SQLiteDatabaseImpl());
  gh.factory<_i38.SelectInfoRepository>(() => _i38.SelectInfoRepositoryImpl(
        gh<_i9.CauseRepository>(),
        gh<_i11.CorrectionRepository>(),
      ));
  gh.factory<_i39.SelectInfoUsecase>(
      () => _i39.SelectInfoUsecaseImpl(gh<_i38.SelectInfoRepository>()));
  gh.factory<_i40.SplashInteractor>(() => _i40.SplashInteractorImpl());
  gh.singleton<_i41.StockDAO>(_i41.StockDAO());
  gh.factory<_i42.TemperatureApiRespository>(
      () => _i43.TemperatureApiRespositoryImpl());
  gh.factory<_i44.UserDataDataSource>(() => _i45.UserDataDataSourceImpl());
  gh.factory<_i46.WeatherApiRespository>(
      () => _i47.WeatherApiRespositoryImpl());
  gh.factory<_i48.WorkOrderApiRepository>(
      () => _i49.WorkOrderApiRepositoryImpl());
  gh.factory<_i50.AccountBloc>(
      () => _i50.AccountBloc(gh<_i3.AccountInteractor>()));
  gh.factory<_i51.AddMaterialRepository>(() => _i51.AddMaterialRepositoryImpl(
        gh<_i26.MaterialRepository>(),
        gh<_i24.MaterialInfoRepository>(),
      ));
  gh.factory<_i52.AddMaterialUsecase>(
      () => _i52.AddMaterialUsecaseImpl(gh<_i51.AddMaterialRepository>()));
  gh.factory<_i53.ExampleRepository>(
      () => _i53.ExampleRepositoryImpl(gh<_i46.WeatherApiRespository>()));
  gh.factory<_i54.ExampleTempHumidRepository>(() =>
      _i54.ExampleTempHumidRepositoryImpl(
          gh<_i42.TemperatureApiRespository>()));
  gh.factory<_i55.ExampleTempHumidUsecase>(() =>
      _i55.ExampleTempHumidUsecaseImpl(gh<_i54.ExampleTempHumidRepository>()));
  gh.factory<_i56.ExampleUsecase>(
      () => _i56.ExampleUsecaseImpl(gh<_i53.ExampleRepository>()));
  gh.factory<_i57.GeneralCheckBloc>(
      () => _i57.GeneralCheckBloc(gh<_i36.ResponseUsecase>()));
  gh.factory<_i58.HomeInteractor>(
      () => _i58.HomeInteractorImpl(gh<_i18.HomeRepository>()));
  gh.factory<_i59.MainScreenRepository>(() =>
      _i59.MainScreenRepositoryImpl(gh<_i22.MaintenanceResponseRepository>()));
  gh.factory<_i60.MainScreenUsecase>(
      () => _i60.MainScreenUsecaseImpl(gh<_i59.MainScreenRepository>()));
  gh.factory<_i61.MaintenanceRequestRepository>(
      () => _i61.MaintenanceRequestRepositoryImpl(
            gh<_i15.EquipmentRepository>(),
            gh<_i13.EmployeeRepository>(),
            gh<_i9.CauseRepository>(),
            gh<_i33.RequestRepository>(),
            gh<_i28.MoldRepository>(),
          ));
  gh.factory<_i62.MaintenanceRequestUsecase>(() =>
      _i62.MaintenanceRequestUsecaseImpl(
          gh<_i61.MaintenanceRequestRepository>()));
  gh.factory<_i63.RepairTaskBloc>(
      () => _i63.RepairTaskBloc(gh<_i36.ResponseUsecase>()));
  gh.factory<_i64.RequestBloc>(
      () => _i64.RequestBloc(gh<_i62.MaintenanceRequestUsecase>()));
  gh.factory<_i65.ScheduleRepository>(() => _i65.ScheduleRepositoryImpl(
        gh<_i48.WorkOrderApiRepository>(),
        gh<_i22.MaintenanceResponseRepository>(),
      ));
  gh.factory<_i66.ScheduleUsecase>(
      () => _i66.ScheduleUsecaseImpl(gh<_i65.ScheduleRepository>()));
  gh.factory<_i67.SelectInfoBloc>(
      () => _i67.SelectInfoBloc(gh<_i39.SelectInfoUsecase>()));
  gh.factory<_i68.SplashBloc>(
      () => _i68.SplashBloc(gh<_i40.SplashInteractor>()));
  gh.factory<_i69.AddMaterialBloc>(
      () => _i69.AddMaterialBloc(gh<_i52.AddMaterialUsecase>()));
  gh.factory<_i70.ExampleBloc>(
      () => _i70.ExampleBloc(gh<_i56.ExampleUsecase>()));
  gh.factory<_i71.ExampleTempHumidBloc>(
      () => _i71.ExampleTempHumidBloc(gh<_i55.ExampleTempHumidUsecase>()));
  gh.factory<_i72.GetRequestInfoBloc>(
      () => _i72.GetRequestInfoBloc(gh<_i62.MaintenanceRequestUsecase>()));
  gh.factory<_i73.HomeBloc>(() => _i73.HomeBloc(gh<_i58.HomeInteractor>()));
  gh.factory<_i74.MainScreenBloc>(
      () => _i74.MainScreenBloc(gh<_i60.MainScreenUsecase>()));
  gh.factory<_i75.ScheduleBloc>(
      () => _i75.ScheduleBloc(gh<_i66.ScheduleUsecase>()));
  return getIt;
}

class _$AppModule extends _i76.AppModule {}
