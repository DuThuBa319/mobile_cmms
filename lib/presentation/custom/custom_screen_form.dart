import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import 'custom_bottom_navigation_bar_v2.dart';
import 'custom_submit_screen_form.dart';

class CustomScreenForm extends StatefulWidget {
  CustomScreenForm({
    super.key,
    this.child,
    this.title,
    this.isShowBottomAppBar = false,
  });
  final Widget? child;
  final String? title;
  final bool isShowBottomAppBar;

  @override
  State<CustomScreenForm> createState() => _CustomScreenFormState();
}

class _CustomScreenFormState extends State<CustomScreenForm> {
  @override
  Widget build(BuildContext context) {
    return CustomSubmitScreenForm(
      isBackButtonVisible: false,
      titleColor: Colors.white,
      title: widget.title,
      isShowBottomButton: false,
      rightIconButton: IconButton(
        icon: const Icon(Icons.search, color: Colors.white),
        onPressed: () {},
      ),
      isShowBottomNayvigationBar: widget.isShowBottomAppBar,
      bottomAppBar: customBottomAppBar(),
      child: widget.child,
    );
  }

  Widget customBottomAppBar() {
    return CustomBottomNavigationBarV2(
      selectedIdx: null,
      onItemSelection: null,
      items: <BottomBarItemData>[
        BottomBarItemData(
          icon: Assets.icHome,
          label: 'Home',
        ),
        BottomBarItemData(
          icon: Assets.icHistory,
          label: 'History',
        ),
        BottomBarItemData(
          icon: Assets.icNotification,
          label: 'Notification',
        ),
        BottomBarItemData(
          icon: Assets.icAccount,
          label: 'Account',
        )
      ],
    );
  }
}
