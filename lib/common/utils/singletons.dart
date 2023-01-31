import 'package:logger/logger.dart';

import '../../data/data_source/local/datasource/app_config_datasource.dart';
import '../../data/data_source/local/datasource/user_data_datasource.dart';
import '../../di/di.dart';
import '../services/firebase/firebase_auth_service.dart';

Logger get logger => injector<Logger>();
FirebaseAuthService get firebaseAuthService => injector<FirebaseAuthService>();
UserDataDataSource get userDataData => injector<UserDataDataSource>();
AppConfigDataSource get appConfigData => injector<AppConfigDataSource>();
