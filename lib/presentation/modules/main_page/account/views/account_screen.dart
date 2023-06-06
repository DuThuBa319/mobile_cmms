import 'package:flutter/material.dart';

import '../../../../../common/utils/singletons.dart';
import '../../../../custom/custom_screen_form.dart';
import '../../../../extentions/extention.dart';
import '../../../../route/route_list.dart';
import '../../../../theme/app_text_theme.dart';
import '../../../../theme/shadow.dart';

part 'account.action.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final user = userDataData.getUser();
    return CustomScreenForm(
      title: 'Tài khoản',
      isShowBackButton: true,
      isShowBottomAppBar: true,
      isMainScreen: false,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black54)],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Thông tin tài khoản: ',
                      style: AppTextTheme.body3.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Tên đăng nhập: ${user?.id ?? '--'}',
                      style: AppTextTheme.body3.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Tên đầy đủ: ${user?.name ?? '--'}',
                      style: AppTextTheme.body3.copyWith(),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: logOut,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 48),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xff0001d37),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Text(
                    'Đăng xuất',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class AccountScreen extends StatefulWidget {
//   const AccountScreen({Key? key}) : super(key: key);

//   @override
//   State<AccountScreen> createState() => _AccountScreenState();
// }

// class _AccountScreenState extends StateBase<AccountScreen> {
//   final _refreshController = RefreshController(initialRefresh: true);

//   @override
//   AccountBloc get bloc => BlocProvider.of(context);

//   @override
//   Widget buildBase(BuildContext context) {
//     return BlocConsumer<AccountBloc, AccountState>(
//       listener: _blocListener,
//       builder: (context, state) {
//         return ScreenForm(
//           title: 'Tài khoản',
//           child: Container(
//             color: AppColor.scaffoldBackgroundColor,
//             child: Column(
//               children: [
//                 Expanded(
//                   child: SmartRefresherWrapper.build(
//                     controller: _refreshController,
//                     onRefresh: _onRefresh,
//                     child: ListView(
//                       padding: EdgeInsets.zero,
//                       children: [
//                         const SizedBox(height: 16),
//                         _buildUserInfo(state.viewModel.user),
//                         const SizedBox(height: 16),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Config.instance.appConfig.isProdBuild == true
//                     ? const SizedBox()
//                     : Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.all(8),
//                         child: Text(
//                           '''Build: ${ClientInfo.appVersionName} - ${ClientInfo.appVersionCode}''',
//                           style:
//                               const TextStyle(color: Colors.grey, fontSize: 12),
//                         ),
//                       )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildUserInfo(User? user) {
//     return InkWell(
//       onTap: gotoDetailScreen,
//       child: Container(
//         width: double.infinity,
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
//         child: Row(
//           children: [
//             CircleImageOutline(
//               diameter: 48,
//               image: user?.avatar ?? '',
//               isUrlImage: true,
//               borderColor: Colors.grey,
//               borderWidth: 1,
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     user?.name ?? '--',
//                     style: theme.textTheme.bodyLarge?.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     user?.email ?? '--',
//                     style: theme.textTheme.titleMedium,
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//     );
//   }

//   MenuItemView _buildMenuItem(
//     String title,
//     String icon,
//     ItemDivider divider,
//     Function() onTap, {
//     bool showChevronIcon = true,
//   }) {
//     return MenuItemView(
//       title: title,
//       icon: SvgPicture.asset(
//         icon,
//         height: 30,
//         width: 30,
//         fit: BoxFit.cover,
//       ),
//       color: Colors.white,
//       onTap: onTap,
//       divider: divider,
//       chevronSize: 20,
//       showChevronIcon: showChevronIcon,
//     );
//   }
// }
