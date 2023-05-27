import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../custom/audio_picker/audio_picker_bloc/audio_picker_bloc.dart';
import '../../custom/image_picker/image_picker_bloc/image_picker_bloc.dart';

import '../../custom/select_info_screen/bloc/receive_info_selection_bloc/receive_info_selection_bloc.dart';
import '../../custom/select_info_screen/bloc/select_info_bloc/select_info_bloc.dart';
import '../../route/route_list.dart';

import 'bloc/get_detail_bloc/get_request_info_bloc.dart';

import 'bloc/request_bloc/request_bloc.dart';
import 'view/maintenance_request_screen.dart';

class RequestRoute {
  static GetIt getIt = GetIt.instance;
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RouteList.request: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ImagePickerBloc>(
                create: (context) => ImagePickerBloc(),
              ),
              BlocProvider<RequestBloc>(
                create: (context) => getIt<RequestBloc>(),
              ),
              BlocProvider<AudioPickerBloc>(
                create: (context) => AudioPickerBloc(),
              ),
              BlocProvider<GetRequestInfoBloc>(
                create: (context) => getIt<GetRequestInfoBloc>(),
              ),
              BlocProvider<SelectInfoBloc>(
                create: (context) => getIt<SelectInfoBloc>(),
              ),
              BlocProvider<ReceiveInfoSelectionBloc>(
                create: (context) => ReceiveInfoSelectionBloc(),
              ),
            ],
            child: const MaintenanceRequestScreen(),
          );
        },
      };
}
