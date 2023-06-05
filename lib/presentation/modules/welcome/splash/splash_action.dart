part of 'splash_screen.dart';

extension SplashAction on _SplashScreenState {
  void initCall() {
    _launchApp();
  }

  void _launchApp() {
    //if (userDataData.isLogin) {
    Navigator.of(context).pushReplacementNamed(RouteList.login);
    //} else {}
  }
}
