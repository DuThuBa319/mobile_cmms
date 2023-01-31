import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/client_info.dart';
import '../../../../../common/config.dart';
import '../../../../../domain/entities/user.dart';
import '../../../../base/base.dart';
import '../../../../common_widget/circle_image.dart';
import '../../../../common_widget/forms/screen_form.dart';
import '../../../../common_widget/item_devider.dart';
import '../../../../common_widget/menu_item_view.dart';
import '../../../../common_widget/smart_refresher_wrapper.dart';
import '../../../../extentions/extention.dart';
import '../../../../route/route_list.dart';
import '../../../../theme/theme_color.dart';
import '../bloc/account_bloc.dart';

part 'account.action.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends StateBase<AccountScreen> {
  final _refreshController = RefreshController(initialRefresh: true);

  @override
  AccountBloc get bloc => BlocProvider.of(context);

  @override
  Widget buildBase(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: _blocListener,
      builder: (context, state) {
        return ScreenForm(
          title: 'Tài khoản',
          child: Container(
            color: AppColor.scaffoldBackgroundColor,
            child: Column(
              children: [
                Expanded(
                  child: SmartRefresherWrapper.build(
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        const SizedBox(height: 16),
                        _buildUserInfo(state.viewModel.user),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                Config.instance.appConfig.isProdBuild == true
                    ? const SizedBox()
                    : Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          '''Build: ${ClientInfo.appVersionName} - ${ClientInfo.appVersionCode}''',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserInfo(User? user) {
    return InkWell(
      onTap: gotoDetailScreen,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Row(
          children: [
            CircleImageOutline(
              diameter: 48,
              image: user?.avatar ?? '',
              isUrlImage: true,
              borderColor: Colors.grey,
              borderWidth: 1,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.name ?? '--',
                    style: theme.textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user?.email ?? '--',
                    style: theme.textTheme.subtitle1,
                  )
                ],
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  MenuItemView _buildMenuItem(
    String title,
    String icon,
    ItemDivider divider,
    Function() onTap, {
    bool showChevronIcon = true,
  }) {
    return MenuItemView(
      title: title,
      icon: SvgPicture.asset(
        icon,
        height: 30,
        width: 30,
        fit: BoxFit.cover,
      ),
      color: Colors.white,
      onTap: onTap,
      divider: divider,
      chevronSize: 20,
      showChevronIcon: showChevronIcon,
    );
  }
}
