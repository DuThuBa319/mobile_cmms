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
      child: const MainScreenView(),
    );
  }

  Future initPermission() async {
    if (await Permission.manageExternalStorage.isDenied) {
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Center(
          child: AlertDialog(
            title: const Text('Phản hồi'),
            content: Text(
              'Vui lòng cho phép truy cập tất cả file',
              style: Theme.of(context).textTheme.caption,
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
