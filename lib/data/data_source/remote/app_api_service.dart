import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart' as dio_p;
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../common/client_info.dart';
import '../../../common/components/graphql/graphql.dart';
import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/services/firebase/firebase_auth_service.dart';
import '../../../common/utils.dart';
import '../../../common/utils/singletons.dart';
import '../../../di/di.dart';
import 'interceptor/auth_interceptor.dart';
import 'interceptor/header_interceptor.dart';
import 'rest_api_repository/rest_api_repository.dart';

part 'api_service_error.dart';

ApiServiceDelegate? apiServiceDelegate;

class AppApiService {
  late dio_p.Dio _dio;
  late RestApiRepository restClient;
  late MockApiRepository mockClient;
  late GraphQLClient graphQLClient;

  AppApiService() {
    _config();
  }

  void _config() {
    _setupDioClient();

    _createRestClient();
    _createMockClient();
  }

  Map<String, String> _getDefaultHeader() {
    var authTime = 0;
    try {
      authTime = firebaseAuthService.getAuthTime()?.millisecondsSinceEpoch ?? 0;
    } catch (e) {
      authTime = DateTime.now().millisecondsSinceEpoch;
    }
    final defaultHeader = <String, String>{
      HttpConstants.contentType: 'application/json',
      HttpConstants.device: Platform.operatingSystem,
      HttpConstants.model: ClientInfo.model,
      HttpConstants.osversion: ClientInfo.osversion,
      HttpConstants.appVersion: ClientInfo.appVersionName,
      HttpConstants.platform: 'app_keeper',
      // HttpConstants.authtime:
      //     (firebaseAuthService.getAuthTime() ?? DateTime.now())
      //         .millisecondsSinceEpoch
      //         .toString(),
      HttpConstants.authtime: authTime.toString(),
    };

    // if (!kIsWeb) {
    //   defaultHeader[HttpConstants.osplatform] = Platform.operatingSystem;
    // }
    return defaultHeader;
  }

  void _setupDioClient() {
    _dio = dio_p.Dio(
      dio_p.BaseOptions(
        followRedirects: false,
        receiveTimeout: 30000, // 30s
        sendTimeout: 30000, // 30s
      ),
    );

    _dio.options.headers.clear();

    _dio.options.headers = _getDefaultHeader();

    /// CERTIFICATE_VERIFY_FAILED
    final clientAdapter = _dio.httpClientAdapter;
    if (clientAdapter is DefaultHttpClientAdapter) {
      clientAdapter.onHttpClientCreate = (client) {
        client.badCertificateCallback = (cert, host, port) {
          LogUtils.d({
            'From': 'AppApiService -> badCertificateCallback',
            'Time': DateTime.now().toString(),
            'host': host,
            'port': port,
            'cert': cert,
          });
          return true;
        };
        return client;
      };
    }

    void _createGraphQLClient() {
      graphQLClient = createGraphQLClient(
        baseUri: Config.instance.appConfig.baseGraphQLUrl,
        getToken: () async {
          return refreshToken('');
        },
        onError: (err, linkException) {
          // final error = GraphQLException.fromJson({
          //   'message': err?.message,
          //   'locations': err?.locations,
          //   'path': err?.path,
          //   'extensions': err?.extensions,
          // });
          // handleErrorObserve.fireError(
          //   ErrorData.fromGraphQL(
          //     error: error,
          //     exception:
          //         error.isAccessDenied ? RefreshTokenException() : linkException,
          //   ),
          // );

          // Hide duplicate delegate error
          // apiServiceDelegate?.onError(
          //   ErrorData.fromGraphQL(
          //     error: error,
          //     exception:
          //         error.isAccessDenied ? RefreshTokenException() : linkException,
          //   ),
          // );
        },

        /// Remove old `authorization` bcs of GraphQl will get new from `getToken`
        headers: _getDefaultHeader()..remove(HttpConstants.authorization),
        customHeaderFnc: () {
          return {..._getDefaultHeader()}..remove(HttpConstants.authorization);
        },
        onRefreshToken: refreshToken,
      );
    }

    /// Dio InterceptorsWrapper
    _dio.interceptors.add(
      HeaderInterceptor(
        getHeader: _getDefaultHeader,
      ),
    );
    _dio.interceptors.add(
      AuthInterceptor(
        // TODO : implement get token if needed
        getToken: null /*localDataManager.getToken*/,
        refreshToken: (token, options) async {
          return refreshToken(token);
        },
        onLogoutRequest: () {
          //unawaited(userDataData.clearData());
        },
      ),
    );
  }

  void _createRestClient() {
    restClient = RestApiRepository(
      _dio,
      baseUrl: Config.instance.appConfig.baseApiLayer,
    );
  }

  void _createMockClient() {
    mockClient = MockApiRepository(
      _dio,
      baseUrl: Config.instance.appConfig.mockApiLayer,
    );
  }

  Future<String?> refreshToken(String token, {bool saveToken = true}) async {
    final newToken = await injector<FirebaseAuthService>().refreshToken();
    if (newToken != null) {
      await userDataData.setToken(newToken);
    }
    return newToken;
  }
}

mixin ApiServiceDelegate {
  void onError(ErrorData onError);
}
