import '../../../common/components/graphql/graphql_provider.dart';
import '../../../di/di.dart';
import 'remote/app_api_service.dart';
import 'remote/rest_api_repository/rest_api_repository.dart';

mixin DataRepository {
  AppApiService appApiService = injector.get<AppApiService>();

  late GraphqlProvider graphqlProvider = GraphqlProvider(
    appApiService.graphQLClient,
  );

  RestApiRepository get restApi => appApiService.restClient;

  void resetClient() {
    appApiService = injector.get<AppApiService>();
    graphqlProvider = GraphqlProvider(
      appApiService.graphQLClient,
    );
  }
}
