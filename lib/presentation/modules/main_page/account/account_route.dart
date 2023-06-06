import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../route/route_list.dart';
import 'bloc/account_bloc.dart';
import 'views/account_screen.dart';

class AccountRoute {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.account: (context) {
          final getIt = GetIt.instance;
          return BlocProvider(
            create: (context) => getIt<AccountBloc>(),
            child: const AccountScreen(),
          );
        },
      };
}
