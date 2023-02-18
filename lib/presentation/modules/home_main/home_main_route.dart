import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import '../../route/route_list.dart';
import 'home_main.dart';

class HomeMainRoute {
  static GetIt getIt = GetIt.instance;
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.home: (context) {
          return const MainScreen();

          // return const ExampleScreen();
        },
      };
}
