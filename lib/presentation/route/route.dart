import 'package:flutter/cupertino.dart';

import '../common_widget/text_scale_fixed.dart';

import '../modules/main_page/main_page_route.dart';

class RouteGenerator {
  static Map<String, WidgetBuilder> _getAll(RouteSettings settings) => {
        ...MainRoute.getAll(settings),
      };

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
