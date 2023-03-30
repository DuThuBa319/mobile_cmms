import 'package:flutter/foundation.dart';

class Env {
  static const environment = 'environment';
  static const developmentMode = 'developmentMode';
  static const appName = 'appname';
  static const baseApiLayer = 'baseApiLayer';
  static const mockApiLayer = 'mockApiLayer';
  static const baseGraphQLUrl = 'baseGraphQLUrl';
  static const onesignalAppID = 'onesignalAppID';

  static const devEnvName = 'Development';
  static const stagingEnvName = 'Staging';
  static const prodEnvName = 'Production';

  static final Map<String, dynamic> devEnv = {
    environment: devEnvName,
    developmentMode: kDebugMode,
    appName: 'Daikin Keeper Dev',
    baseApiLayer: 'https://api.open-meteo.com/v1/',
    mockApiLayer: 'https://my.api.mockaroo.com/',
    baseGraphQLUrl: 'https://dev-data-app.daikin.com.vn:8082/v1/graphql',
    onesignalAppID: '',
  };

  static final Map<String, dynamic> stagingEnv = {
    environment: stagingEnvName,
    developmentMode: kDebugMode,
    appName: 'Daikin Keeper Staging',
    baseApiLayer: '',
    mockApiLayer: '',
    baseGraphQLUrl: 'https://stag2-data-app.daikin.com.vn:8082/v1/graphql',
    onesignalAppID: '',
  };

  static final Map<String, dynamic> prodEnv = {
    environment: prodEnvName,
    developmentMode: kDebugMode,
    appName: 'Daikin Keeper',
    baseApiLayer: '',
    mockApiLayer: '',
    baseGraphQLUrl: '',
    onesignalAppID: '',
  };
}
