import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../theme/theme_color.dart';
import 'custom_bottom_navigation_bar_v2.dart';

class CustomScreenForm extends StatefulWidget {
  const CustomScreenForm({super.key, this.child});
  final Widget? child;
  @override
  State<CustomScreenForm> createState() => _CustomScreenFormState();
}

class _CustomScreenFormState extends State<CustomScreenForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Title',
              style: TextStyle(fontSize: 22),
            ),
            backgroundColor: AppColor.blue001D37,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              )
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          drawer: const Drawer(),
          body: widget.child,
          //-----------------------//
          bottomNavigationBar: BottomAppBar(
            child: CustomBottomNavigationBar(
              selectedIdx: null,
              onItemSelection: null,
              items: <BottomBarItemData>[
                BottomBarItemData(
                  icon: Assets.icHome,
                  label: 'Home',
                  selectedIcon: 'Home',
                  isOver: false,
                ),
                BottomBarItemData(
                  icon: Assets.icHistory,
                  label: 'History',
                  selectedIcon: 'Home',
                  isOver: false,
                ),
                BottomBarItemData(
                  icon: Assets.icNotification,
                  label: 'Notification',
                  selectedIcon: 'Home',
                  isOver: false,
                ),
                BottomBarItemData(
                  icon: Assets.icAccount,
                  label: 'Account',
                  selectedIcon: 'Home',
                  isOver: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
