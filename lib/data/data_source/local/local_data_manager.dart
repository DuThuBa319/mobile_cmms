import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../di/di.dart';
import 'preferences_helper/preferences_helper.dart';
import 'sqlite/dao/stock_dao.dart';

class LocalDataManager {
  late PreferencesHelper _preferencesHelper;
  late FlutterSecureStorage _secureStorage;
  final StockDAO _stockDAO = injector.get();
  LocalDataManager() {
    init();
  }

  void init() {
    _secureStorage = const FlutterSecureStorage();
    _preferencesHelper = PreferencesHelperImpl();
    _preferencesHelper.init();
  }

  PreferencesHelper get preferencesHelper => _preferencesHelper;

  FlutterSecureStorage get secureStorage => _secureStorage;

  StockDAO get stockDAO => _stockDAO;
}
