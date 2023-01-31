import 'package:flutter/material.dart';

import '../../route/route_list.dart';
import 'main_tab/main_tab_screen.dart';

class MainRoute {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.mainPageRoute: (context) {
          return MainTabScreen();
        },
      };
}
