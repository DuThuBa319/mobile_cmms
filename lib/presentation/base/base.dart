import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:rxdart/rxdart.dart';

import '../../../common/client_info.dart';
import '../../../common/utils.dart';
import '../../../data/data_source/remote/app_api_service.dart';
// import '../../common/client_info.dart';
// import '../../common/components/navigation/navigation_service.dart';
// import '../../common/config.dart';
// import '../../common/constants/app_locale.dart';
// import '../../common/services/onesignal_notification_service.dart';
// import '../../common/utils.dart';
// import '../../common/utils/singletons.dart';
// import '../../data/data_source/remote/app_api_service.dart';
// import '../../data/models/graphql_error.dart';
// import '../../di/di.dart';
import '../common_widget/export.dart';
import '../extentions/extention.dart';
import '../modules/webview/webview_screen.dart';
import '../route/route_list.dart';

part 'bloc_base.dart';
part 'state_base/state_base.dart';
part 'state_base/state_base.error_handler.dart';
part 'state_base/state_base.ext.dart';
