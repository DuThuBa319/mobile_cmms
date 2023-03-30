import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import '../../route/route_list.dart';
import '../schedule/bloc/schedule_bloc.dart';
import 'view/maintenance_request_screen.dart';

class RequestRoute {
  static GetIt getIt = GetIt.instance;
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.request: (context) {
          return const MaintenanceRequestScreen();
        },
      };
}
