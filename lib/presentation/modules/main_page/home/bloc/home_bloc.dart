import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../common/utils/singletons.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../interactor/home_interactor.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends AppBlocBase<HomeEvent, HomeState> {
  final HomeInteractor _interactor;

  HomeBloc(this._interactor) : super(HomeInitial());
}
