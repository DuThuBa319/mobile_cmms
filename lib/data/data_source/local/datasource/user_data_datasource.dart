import '../../../../domain/entities/user.dart';
import '../../../models/user_model.dart';
import '../base_datasource.dart';

abstract class UserDataDataSource extends BaseDataSource {
  Future<String?> getToken();

  Future<void> setToken(String token);

  bool get isLogin;

  User? getUser();

  Future<void> setUser(UserModel? user);
}
