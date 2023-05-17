import '../envs.dart';

class Config {
  static final Config instance = Config._();

  Config._();

  AppConfig get appConfig => _appConfig;
  late AppConfig _appConfig;

  void setup() {
    _appConfig = AppConfig.from(Env.devEnv);
  }
}

class AppConfig {
  String envName;
  bool developmentMode;
  String appName;
  String baseApiLayer;
  String mockApiLayer;
  String cmmsApiLayer;
  String baseGraphQLUrl;
  String onesignalAppID;

  AppConfig(
    this.envName,
    this.developmentMode,
    this.appName,
    this.baseApiLayer,
    this.mockApiLayer,
    this.cmmsApiLayer,
    this.baseGraphQLUrl,
    this.onesignalAppID,
  );

  AppConfig.from(Map<String, dynamic> env)
      : envName = env[Env.environment],
        developmentMode = env[Env.developmentMode],
        appName = env[Env.appName],
        baseApiLayer = env[Env.baseApiLayer],
        mockApiLayer = env[Env.mockApiLayer],
        cmmsApiLayer = env[Env.cmmsApiLayer],
        baseGraphQLUrl = env[Env.baseGraphQLUrl],
        onesignalAppID = env[Env.onesignalAppID];

  bool get isDevBuild => envName == Env.devEnvName;

  bool get isStagBuild => envName == Env.stagingEnvName;

  bool get isProdBuild => envName == Env.prodEnvName;
}
