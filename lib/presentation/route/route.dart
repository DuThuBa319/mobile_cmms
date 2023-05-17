import 'package:flutter/cupertino.dart';

import '../common_widget/text_scale_fixed.dart';
import '../modules/example/example_route.dart';
import '../modules/example_temp_humid/example_temp_humid_route.dart';

import '../modules/main_page/main_page_route.dart';
import '../modules/main_screen/main_screen_route.dart';
import '../modules/maintenance_request/maintenance_request_route.dart';
import '../modules/schedule/schedule_route.dart';

class RouteGenerator {
  static Map<String, WidgetBuilder> _getAll(RouteSettings settings) => {
        ...MainRoute.getAll(settings),
        ...ExampleRoute.getAll(settings),
        ...ExampleTempHumidRoute.getAll(settings),
        ...MainScreenRoute.getAll(settings),
        ...ScheduleRoute.getAll(settings),
        ...RequestRoute.getAll(settings),
      }; // Add into Route Generator

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _builder = _getAll(settings)[settings.name!];

    return buildRoute(
      _builder ?? (context) => const SizedBox(),
      settings: settings,
    );
  }
}

Route buildRoute<T>(WidgetBuilder builder, {RouteSettings? settings}) {
  return CupertinoPageRoute<T>(
    builder: (context) => TextScaleFixed(
      child: builder(context),
    ),
    settings: settings,
  );
}
