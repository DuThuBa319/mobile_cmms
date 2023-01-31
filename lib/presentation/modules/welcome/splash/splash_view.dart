import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../common/config.dart';
import '../../../../generated/assets.dart';
import '../../../theme/theme_color.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    final status = await AppTrackingTransparency.requestTrackingAuthorization();
    // switch (status) {
    //   case TrackingStatus.notDetermined:
    //     await appConfigData.saveLocalization('notDetermined');
    //     break;
    //   case TrackingStatus.restricted:
    //     await appConfigData.saveLocalization('restricted');
    //     break;
    //   case TrackingStatus.denied:
    //     await appConfigData.saveLocalization('denied');
    //     break;
    //   case TrackingStatus.authorized:
    //     await appConfigData.saveLocalization('authorized');
    //     break;
    //   case TrackingStatus.notSupported:
    //     await appConfigData.saveLocalization('notSupported');
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Image.asset(
          Assets.bgHeader,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          color: Colors.transparent,
          child: Column(
            children: [
              const SizedBox(width: double.infinity),
              Expanded(
                child: Container(),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 74),
                //   child: Image.asset(ImageConstant.logoImage),
                // ),
              ),
              if (kDebugMode) const SizedBox(height: 8),
              if (kDebugMode)
                Text(
                  Config.instance.appConfig.envName,
                  style: theme.textTheme.subtitle1!.copyWith(
                    color: AppColor.primaryText,
                  ),
                ),
              const SizedBox(height: 24)
            ],
          ),
        ),
      ],
    );
  }

  Future tracking() async {
    // ignore: unused_local_variable
    final status = await AppTrackingTransparency.requestTrackingAuthorization();
  }
}
