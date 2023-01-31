import 'package:flutter/foundation.dart';

class Env {
  static const environment = 'environment';
  static const developmentMode = 'developmentMode';
  static const appName = 'appname';
  static const baseApiLayer = 'baseApiLayer';
  static const baseGraphQLUrl = 'baseGraphQLUrl';
  static const onesignalAppID = 'onesignalAppID';

  static const devEnvName = 'Development';
  static const stagingEnvName = 'Staging';
  static const prodEnvName = 'Production';

  static final Map<String, dynamic> devEnv = {
    environment: devEnvName,
    developmentMode: kDebugMode,
    appName: 'Daikin Keeper Dev',
    baseApiLayer: '',
    baseGraphQLUrl: 'https://dev-data-app.daikin.com.vn:8082/v1/graphql',
    onesignalAppID: '',
  };

  static final Map<String, dynamic> stagingEnv = {
    environment: stagingEnvName,
    developmentMode: kDebugMode,
    appName: 'Daikin Keeper Staging',
    baseApiLayer: '',
    baseGraphQLUrl: 'https://stag2-data-app.daikin.com.vn:8082/v1/graphql',
    onesignalAppID: '',
  };

  static final Map<String, dynamic> prodEnv = {
    environment: prodEnvName,
    developmentMode: kDebugMode,
    appName: 'Daikin Keeper',
    baseApiLayer: '',
    baseGraphQLUrl: '',
    onesignalAppID: '',
  };
}
