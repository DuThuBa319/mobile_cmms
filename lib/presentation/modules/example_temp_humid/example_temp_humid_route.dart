import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../route/route_list.dart';
import 'example_temp_humid.dart';

class ExampleTempHumidRoute {
  static GetIt getIt = GetIt.instance;
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.exampleTempHumid: (context) {
          return BlocProvider(
            create: (context) => getIt<ExampleTempHumidBloc>(),
            child: const ExampleTempHumidScreen(),
          );
          // return const ExampleScreen();
        },
      };
}
