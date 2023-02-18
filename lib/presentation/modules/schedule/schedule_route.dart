import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import '../../route/route_list.dart';
import 'schedule.dart';

class ScheduleRoute {
  static GetIt getIt = GetIt.instance;
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.schedule: (context) {
          return const ScheduleScreen();

          // return const ExampleScreen();
        },
      };
}
