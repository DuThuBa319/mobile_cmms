import 'dart:io';

import 'package:pedantic/pedantic.dart';
import 'package:permission_handler/permission_handler.dart';

export 'package:permission_handler/permission_handler.dart';

class PermissionService {
  PermissionService._();

  static Future<bool> _requestPermission(Permission ps) async {
    var status = await ps.status;

    if (status.isDenied) {
      status = await ps.request();
    }

    if ((Platform.isAndroid && status.isPermanentlyDenied) ||
        (Platform.isIOS && (status.isDenied || status.isPermanentlyDenied))) {
      unawaited(openAppSettings());

      return false;
    }

    return !status.isDenied && !status.isPermanentlyDenied;
  }

  //////////////////////////////////////////////////////////////////
  ///                         Publish api                        ///
  //////////////////////////////////////////////////////////////////

  static Future<bool> checkPermision(Permission ps) async {
    final status = await ps.status;
    return !status.isDenied && !status.isPermanentlyDenied;
  }

  static Future<bool> requestPermission(Permission ps) async {
    var isGranted = await checkPermision(ps);
    if (!isGranted) {
      isGranted = await _requestPermission(ps);
    }
    return isGranted;
  }

  static Future<List<bool>> requestPermissions(List<Permission> pss) async {
    final result = <bool>[];
    for (final ps in pss) {
      result.add(await requestPermission(ps));
    }
    return result;
  }
}
