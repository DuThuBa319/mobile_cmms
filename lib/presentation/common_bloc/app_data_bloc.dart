import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/client_info.dart';
import '../../common/constants/app_locale.dart';
import '../../common/utils.dart';
import '../../common/utils/singletons.dart';
import '../../domain/entities/app_data.dart';
import '../../presentation/theme/theme_data.dart';

class AppDataBloc extends Cubit<AppData?> {
  AppDataBloc() : super(null);

  Future<void> initial() async {
    if (!isInitialed) {
      ClientInfo.languageCode = 'vi';
      emit(
        AppData(
          appConfigData.getTheme(),
          Locale(ClientInfo.languageCode),
        ),
      );
    }
  }

  bool get isInitialed => state != null;

  /// --------------------- Theme ---------------------//
  void changeLightTheme() {
    emit(
      state?.copyWith(
        currentTheme: SupportedTheme.light,
      ),
    );
  }

  void changeDarkTheme() {
    emit(
      state?.copyWith(
        currentTheme: SupportedTheme.dark,
      ),
    );
  }

  /// ------------------- End Theme -------------------//

  /// -------------------- Locale --------------------//
  Future<bool> changeLocale(Locale locale) async {
    if (!AppLocale.isSupported(locale)) {
      LogUtils.w('locale $locale is not supported!');
      return false;
    }
    ClientInfo.languageCode = locale.languageCode;

    await appConfigData.saveLocalization(locale.languageCode);
    emit(state?.copyWith(locale: locale));
    return true;
  }

  /// ------------------- End Locale ------------------------//
}
