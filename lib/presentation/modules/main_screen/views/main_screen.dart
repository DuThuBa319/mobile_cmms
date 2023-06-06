import 'package:flutter/material.dart';

import '../../../../common/services/permission_service.dart';
import '../../../custom/custom_screen_form.dart';
import 'main_screen_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    initPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreenForm(
      title: 'Home',
      isShowBottomAppBar: true,
      isShowBackButton: false,
      isMainScreen: true,
      child: const MainScreenView(),
    );
  }

  Future initPermission() async {
    final status = await Permission.manageExternalStorage.request();
    if (status == PermissionStatus.denied ||
        status == PermissionStatus.permanentlyDenied ||
        status == PermissionStatus.restricted) {
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Center(
          child: AlertDialog(
            title: const Text('Phản hồi'),
            content: Text(
              'Vui lòng cho phép truy cập tất cả file',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  Navigator.pop(context);
                  await [Permission.manageExternalStorage].request();
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
