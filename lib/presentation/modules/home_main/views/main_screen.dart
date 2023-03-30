import 'package:flutter/material.dart';

import '../../../custom/custom_screen_form.dart';
import 'main_screen_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreenForm(
      title: 'Home',
      isShowBottomAppBar: true,
      child: const MainScreenView(),
    );
  }
}
