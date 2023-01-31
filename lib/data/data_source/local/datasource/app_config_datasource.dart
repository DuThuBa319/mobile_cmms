import '../../../../presentation/theme/theme_data.dart';
import '../base_datasource.dart';

abstract class AppConfigDataSource extends BaseDataSource {
  SupportedTheme getTheme();

  Future<void> setTheme(String? data);

  String? getLocalization();

  Future<void> saveLocalization(String? locale);
}
