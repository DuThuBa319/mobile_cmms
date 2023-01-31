import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../base/base.dart';
import '../interactor/splash_interactor.dart';

part 'splash_event.dart';

part 'splash_state.dart';

@injectable
class SplashBloc extends AppBlocBase<SplashEvent, SplashState> {
  final SplashInteractor _interactor;

  SplashBloc(this._interactor) : super(SplashInitialState()) {
    on<SplashInitialEvent>(initial);
  }

  Future<void> initial(
    SplashInitialEvent event,
    Emitter<SplashState> emitter,
  ) async {
    // await firebaseAuthService.init();

    // emitter(SplashFinishState(RouteList.mainPageRoute));
  }

  Future<void> _configServices() async {
    // final notificationService = injector.get<NotificationService>();
    // injector.get<NotificationManager>().registerService(notificationService);
    // await Future.wait([
    //   injector.get<LocalDataManager>().init(),
    //   injector.get<AuthService>().init(),
    //   notificationService.init(),
    // ]);
  }
}
