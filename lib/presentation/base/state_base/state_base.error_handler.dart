part of '../base.dart';

extension StateBaseErrorHandlerExt on StateBase {
  void _onError(ErrorData error) {
    LogUtils.w(
      '''[$runtimeType] error ${error.type} message ${error.message}''',
    );
    if (!mounted) {
      LogUtils.w('[$runtimeType] error when state disposed!');
      return;
    }
    hideLoading();
    //final trans = translate(context);
    switch (error.type) {
      case ErrorType.unauthorized:
      case ErrorType.graphQLInvalidToken:
        if (errorTypeShowing == error.type) {
          break;
        }
        errorTypeShowing = error.type;
        requireLogin(onSuccess: () {});
        break;
      case ErrorType.httpException:
        if (errorTypeShowing == ErrorType.httpException) {
          break;
        }
        errorTypeShowing = ErrorType.httpException;
        if (error.statusCode != null &&
            error.statusCode! >= 500 &&
            error.statusCode! < 600) {
          showErrorDialog('Đã xảy ra lỗi kỹ thuật');
        } else {
          onLogicError(error.message);
        }
        break;
      case ErrorType.timeout:
        if (errorTypeShowing == ErrorType.timeout) {
          break;
        }
        errorTypeShowing = ErrorType.timeout;
        showErrorDialog('Yêu cầu hết thời gian chờ');
        break;
      case ErrorType.noInternet:
        if (errorTypeShowing == ErrorType.noInternet) {
          break;
        }
        errorTypeShowing = ErrorType.noInternet;
        Connectivity().checkConnectivity().then((value) {
          if (value == ConnectivityResult.none) {
            showNoInternetDialog();
          } else {
            showErrorDialog('Đã xảy ra lỗi kỹ thuật');
          }
        });
        break;
      case ErrorType.unknown:
        if (errorTypeShowing == ErrorType.unknown) {
          break;
        }
        errorTypeShowing = ErrorType.unknown;
        showErrorDialog('Lỗi không xác định');
        break;
      case ErrorType.graphQLUnknown:
        if (errorTypeShowing == ErrorType.graphQLUnknown) {
          break;
        }
        errorTypeShowing = ErrorType.graphQLUnknown;
        onLogicError(error.message);
        break;
      case ErrorType.serverUnExpected:
        if (errorTypeShowing == ErrorType.serverUnExpected) {
          break;
        }
        errorTypeShowing = ErrorType.serverUnExpected;
        showErrorDialog('Máy chủ đang bảo trì');
        break;
      default:
        break;
    }
  }
}
