import 'package:injectable/injectable.dart';

import '../../../../../presentation/theme/theme_data.dart';
import '../../base_datasource.dart';
import '../../preferences_helper/preferences_key.dart';
import '../app_config_datasource.dart';

@Injectable(
  as: AppConfigDataSource,
)
class AppConfigDataSourceImpl extends BaseDataSource
    implements AppConfigDataSource {
  @override
  Future<void> clearData() async {}

  @override
  SupportedTheme getTheme() {
    final theme =
        localDataManager.preferencesHelper.getData(PreferencesKey.theme);
    if (theme == null || theme == SupportedTheme.light.name) {
      return SupportedTheme.light;
    }
    return SupportedTheme.dark;
  }

  @override
  Future<void> setTheme(String? data) async {
    return localDataManager.preferencesHelper
        .saveData(PreferencesKey.theme, data);
  }

  @override
  String? getLocalization() {
    return localDataManager.preferencesHelper
        .getData(PreferencesKey.localization);
  }

  @override
  Future<void> saveLocalization(String? locale) async {
    return localDataManager.preferencesHelper
        .saveData(PreferencesKey.localization, locale);
  }
}
