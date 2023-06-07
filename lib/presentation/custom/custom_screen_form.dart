import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../route/route_list.dart';
import 'custom_bottom_navigation_bar_v2.dart';
import 'custom_submit_screen_form.dart';

class CustomScreenForm extends StatefulWidget {
  CustomScreenForm({
    super.key,
    this.child,
    this.title,
    this.isShowBottomAppBar = false,
    this.isShowBackButton = true,
    this.isMainScreen = false,
  });
  final Widget? child;
  final String? title;
  final bool isShowBottomAppBar;
  final bool isShowBackButton;
  final bool isMainScreen;

  @override
  State<CustomScreenForm> createState() => _CustomScreenFormState();
}

class _CustomScreenFormState extends State<CustomScreenForm> {
  @override
  Widget build(BuildContext context) {
    return CustomSubmitScreenForm(
      isBackButtonVisible: widget.isShowBackButton,
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
      onItemSelection: (index) async {
        if (index == 3) {
          if (widget.isMainScreen) {
            await Navigator.pushNamed(context, RouteList.account);
            return false;
          } else {
            Navigator.popUntil(
              context,
              (route) => route.settings.name == RouteList.home,
            );
            return true;
            //   await Navigator.pushNamed(context, RouteList.account);
          }
        }
        return false;
      },
      items: <BottomBarItemData>[
        BottomBarItemData(
          icon: Assets.icHome,
          selectedIcon: Assets.icHome,
          label: 'Home',
        ),
        BottomBarItemData(
          icon: Assets.icHistory,
          selectedIcon: Assets.icHistory,
          label: 'History',
        ),
        BottomBarItemData(
          icon: Assets.icNotification,
          selectedIcon: Assets.icNotification,
          label: 'Notification',
        ),
        BottomBarItemData(
          icon: Assets.icAccount,
          selectedIcon: Assets.icAccount,
          label: 'Account',
        )
      ],
    );
  }
}
