import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../route/route_list.dart';
import 'bloc/schedule_bloc.dart';
import 'schedule.dart';

class ScheduleRoute {
  static GetIt getIt = GetIt.instance;
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.schedule: (context) {
          return BlocProvider(
            create: (context) => getIt<ScheduleBloc>(),
            child: const ScheduleScreen(),
          );
        },
      };
}
