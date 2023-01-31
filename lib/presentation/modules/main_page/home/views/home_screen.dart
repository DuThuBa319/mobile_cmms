import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/utils/singletons.dart';
import '../../../../../generated/assets.dart';
import '../../../../base/base.dart';
import '../../../../common_widget/smart_refresher_wrapper.dart';
import '../bloc/home_bloc.dart';

part 'home.action.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends StateBase<HomeScreen> {
  final _refreshController = RefreshController(initialRefresh: true);

  @override
  HomeBloc get bloc => BlocProvider.of(context);

  @override
  Widget buildBase(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: _blocListener,
      builder: (context, state) {
        final isLogin = userDataData.isLogin;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(isLogin),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(bool isLogin) {
    const ratio = 428.0 / 130.0;
    return AspectRatio(
      aspectRatio: ratio,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                repeat: ImageRepeat.repeat,
                image: ExactAssetImage(Assets.bgHeader),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chào mừng đến với CHA CMMS',
                      style: textTheme.subtitle1?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Builder(
                      builder: (context) {
                        if (isLogin) {
                          final user = userDataData.getUser();
                          return Text(
                            user?.name ?? '',
                            style: textTheme.subtitle2?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(HomeState state) {
    final user = userDataData.getUser();
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(height: 24),

          SizedBox(height: 24),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Text(
          //     translate(context).recently_activity_title.toUpperCase(),
          //     style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
          //   ),
          // ),
          // const SizedBox(height: 8),
          // _buildListing(state),
        ],
      ),
    );
  }

  Widget _buildTabItem(
    String title,
    String icon,
    Function() onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
