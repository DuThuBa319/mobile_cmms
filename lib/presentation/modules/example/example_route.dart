import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../route/route_list.dart';
import 'example.dart';

class ExampleRoute {
  static GetIt getIt = GetIt.instance;
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.example: (context) {
          return BlocProvider(
            create: (context) => getIt<ExampleBloc>(),
            child: const ExampleScreen(),
          );
          // return const ExampleScreen();
        },
      };
}
