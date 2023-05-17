import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../route/route_list.dart';

import 'bloc/main_screen_bloc.dart';
import 'views/main_screen.dart';

class MainScreenRoute {
  static GetIt getIt = GetIt.instance;
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.home: (context) {
          return BlocProvider(
            create: (context) => getIt<MainScreenBloc>(),
            child: const MainScreen(),
          );
        },
      };
}
