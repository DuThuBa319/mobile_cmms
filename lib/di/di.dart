import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../common/components/navigation/navigation_service.dart';
import '../data/data_source/local/local_data_manager.dart';
import '../data/data_source/remote/app_api_service.dart';

import 'di.config.dart';

GetIt injector = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(injector);

@module
abstract class AppModule {
  @singleton
  Future<LocalDataManager> get localDataManager async =>
      LocalDataManager()..init();

  @singleton
  Future<AppApiService> get appApiService async => AppApiService();

  @singleton
  NavigationService get navigationService => NavigationService();
}
