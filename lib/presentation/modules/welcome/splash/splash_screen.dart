import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/singletons.dart';
import '../../../base/base.dart';
import '../../../common_widget/after_layout.dart';
import '../../../route/route_list.dart';
import 'bloc/splash_bloc.dart';
import 'splash_view.dart';

part 'splash_action.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends StateBase<SplashScreen> with AfterLayoutMixin {
  final int autoRetryLimit = 3;
  int autoRetryCount = 0;

  @override
  SplashBloc get bloc => BlocProvider.of(context);

  @override
  bool get willHandleError => false;

  @override
  void afterFirstLayout(BuildContext context) {
    initCall();
  }

  @override
  void onCloseErrorDialog() {
    super.onCloseErrorDialog();
    // _bloc.add(LoadNetworkDataEvent());
  }

  // @override
  // void showLoginRequired({String? message, Function? onClose}) {
  //   LocalDataManager.clearData()!.then((_) {
  //     refreshHeader();
  //   });
  //
  //   super.showLoginRequired(onClose: () {
  //     _bloc.add(LoadBaseNetworkDataEvent());
  //   });
  // }

  // @override
  // void showErrorDialog(
  //   String? message, {
  //   Function()? onClose,
  //   ErrorType? errorType,
  // }) {
  //   if (autoRetryCount < autoRetryLimit) {
  //     autoRetryCount++;
  //     Future.delayed(const Duration(milliseconds: 200), onCloseErrorDialog);
  //   } else {
  //     showNoticeErrorDialog(
  //       context: context,
  //       titleBtn: tr('common.retry'),
  //       message: message?.isNotEmpty != true
  //           ? tr('common.error.technicalIssues')
  //           : message,
  //       onClose: () {
  //         onCloseErrorDialog();
  //         onClose?.call();
  //   }
  // }

  @override
  Widget buildBase(BuildContext context) {
    return Scaffold(
      body: SplashView(),
    );
  }
}
