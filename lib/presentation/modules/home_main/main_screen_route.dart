import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../route/route_list.dart';
import '../schedule/bloc/schedule_bloc.dart';
import 'views/main_screen.dart';

class HomeMainRoute {
  static GetIt getIt = GetIt.instance;
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.home: (context) {
          return BlocProvider(
            create: (context) => getIt<ScheduleBloc>(),
            child: const MainScreen(),
          );

          // return const ExampleScreen();
        },
      };
}
