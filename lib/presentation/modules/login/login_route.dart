import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../route/route_list.dart';
import 'bloc/login_bloc.dart';
import 'view/login_screen.dart';

class LoginRoute {
  static GetIt getIt = GetIt.instance;
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.login: (context) {
          return BlocProvider(
            create: (context) => getIt<LoginBloc>(),
            child: const LoginScreen(),
          );
        },
      };
}
