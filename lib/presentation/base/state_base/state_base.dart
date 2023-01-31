part of '../base.dart';

abstract class StateBase<T extends StatefulWidget> extends State<T>
    implements ApiServiceDelegate {
  //prevent show the same error dialog when call multiple api at the same time
  ErrorType? errorTypeShowing;
  var _isLoadingShowing = false;

  bool get isLoading => _isLoadingShowing;

  AppBlocBase? get bloc;

  bool get willHandleError => true;

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  // late AppLocalizations trans;

  void onFocusWidget() {}

  void onLostFocusWidget() {}

  @override
  @mustCallSuper
  void initState() {
    if (willHandleError) {
      bloc?.registerDelegate(this);
    }
    super.initState();
    LogUtils.d('[${T.toString()}] initState');
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    ClientInfo.languageCode = 'vi';
    // ignore: omit_local_variable_types
    super.didChangeDependencies();
  }

  @override
  @mustCallSuper
  void dispose() {
    LogUtils.d('[${T.toString()}] dispose');
    super.dispose();
  }

  Widget buildBase(BuildContext context);
  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);

    return FocusDetector(
      onFocusLost: onLostFocusWidget,
      onFocusGained: () {
        if (willHandleError) {
          bloc?.registerDelegate(this);
        }
        onFocusWidget();
      },
      onVisibilityLost: () {
        // LogUtils.i(
        //   'Visibility Lost.'
        //   '\nIt means the widget is no longer visible within your app.',
        // );
      },
      onVisibilityGained: () {
        // LogUtils.i(
        //   'Visibility Gained.'
        //   '\nIt means the widget is now visible within your app.',
        // );
      },
      onForegroundLost: () {
        // LogUtils.i(
        //   'Foreground Lost.'
        //   '\nIt means, for example, that the user sent your app to the background by opening '
        //   'another app or turned off the device\'s screen while your '
        //   'widget was visible.',
        // );
      },
      onForegroundGained: () {
        // LogUtils.i(
        //   'Foreground Gained.'
        //   '\nIt means, for example, that the user switched back to your app or turned the '
        //   'device\'s screen back on while your widget was visible.',
        // );
      },
      child: buildBase(context),
    );
  }

  void showLoading() {
    if (!_isLoadingShowing) {
      _isLoadingShowing = true;
      EasyLoading.show(
        status: 'Đang xử lý',
        indicator: const Loading(),
        maskType: EasyLoadingMaskType.black,
      );
    }
  }

  void hideLoading() {
    if (_isLoadingShowing) {
      _isLoadingShowing = false;
      EasyLoading.dismiss();
    }
  }

  @override
  void onError(ErrorData error) {
    hideLoading();
    _onError(error);
  }

  void showErrorDialog(String? message, {Function()? onClose}) {
    showNoticeErrorDialog(
      context: context,
      message:
          message?.isNotEmpty != true ? 'Đã xảy ra lỗi kỹ thuật' : message!,
      onClose: () {
        onCloseErrorDialog();
        onClose?.call();
      },
    );
  }

  @mustCallSuper
  void onCloseErrorDialog() {
    errorTypeShowing = null;
  }

  void showNoInternetDialog() {
    showNoticeDialog(
      context: context,
      message: 'Không có kết nối',
      onClose: onCloseErrorDialog,
    );
  }

  void onLogicError(String? message) {
    showErrorDialog(message);
  }

  Widget baseLoading() {
    return const Loading();
  }

  void requireLogin({required Function() onSuccess, Function()? onSkip}) {
    // if (firebaseAuthService.isSignedIn) {
    //   onSuccess.call();
    //   return;
    // }
    if (true) {
      onSuccess.call();
      return;
    }
    final trans = translate(context);
    showNoticeConfirmDialog(
      context: context,
      message: 'Yêu cầu đăng nhập',
      title: 'Thông báo',
      titleBtnDone: 'Đăng nhập',
      titleBtnCancel: 'Bỏ qua',
      onCanceled: onSkip,
      onConfirmed: () {
        _showLoginScreen(onSuccess, onSkip);
      },
    );
  }

  void _showLoginScreen(Function() onSuccess, Function()? onSkip) {
    Navigator.pushNamed(context, RouteList.loginRoute).then((value) {
      if (value is bool && value) {
        onSuccess.call();
      } else {
        onSkip?.call();
      }
    });
  }

  Future<void> openWeb({String? title, String? url, String? html}) async {
    await Navigator.of(context).pushNamed(
      RouteList.webview,
      arguments: WebviewArgs(
        title: title,
        html: html,
        url: url,
      ),
    );
  }

  // String get languageCode =>
  //     context.read<AppDataBloc>().state?.locale.languageCode ??
  //     AppLocale.vi.languageCode;
}
