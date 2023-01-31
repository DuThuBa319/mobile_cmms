part of 'base.dart';

abstract class AppBlocBase<E, S> extends Bloc<E, S> {
  Function(ErrorData)? errorHandler;

  void registerDelegate(ApiServiceDelegate delegate) {
    apiServiceDelegate = delegate;
    errorHandler = delegate.onError;
  }

  AppBlocBase(S s) : super(s);

  EventTransformer<T> debounceSequential<T>(Duration duration) {
    return (events, mapper) =>
        events.debounceTime(duration).asyncExpand(mapper);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  Future<void> logout(BuildContext context) async {
    // OneSignalNotificationService.unsubscribeNotification();
    // await Future.wait([
    //   firebaseAuthService.signOut(),
    //   userDataData.setUser(null),
    // ]);
    await Navigator.of(context).pushNamedAndRemoveUntil(
      RouteList.loginRoute,
      (route) => false,
    );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (error is OperationException) {
      final glError = error.graphqlErrors.firstOrNull;
      ErrorData(message: 'Đã xảy ra lỗi OperationException');
    } else if (error is Exception) {
      errorHandler?.call(ErrorData(message: 'Đã xảy ra lỗi Exception'));
    } else {
      LogUtils.e('onError', error, stackTrace);
    }
    super.onError(error, stackTrace);
  }
}
