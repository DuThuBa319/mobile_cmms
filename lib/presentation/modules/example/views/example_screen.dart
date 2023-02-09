import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/utils/singletons.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../../../common_widget/forms/submit_screen_form.dart';
import '../../../common_widget/loading.dart';
import '../../../common_widget/smart_refresher_wrapper.dart';
import '../../../theme/app_text_theme.dart';
import '../../../theme/theme_color.dart';
import '../bloc/example_bloc.dart';
import 'widgets/example_weather_cell.dart';

part 'example.action.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => _ExampleState();
}

class _ExampleState extends StateBase<ExampleScreen> {
  final _refreshController = RefreshController(initialRefresh: true);

  @override
  ExampleBloc get bloc => BlocProvider.of(context);

  @override
  Widget buildBase(BuildContext context) {
    return BlocConsumer<ExampleBloc, ExampleState>(
      listener: _blocListener,
      builder: (context, state) {
        final isLogin = userDataData.isLogin;
        final theme = Theme.of(context);
        return SubmitScreenForm(
          isBackButtonVisible: true,
          titleColor: Colors.white,
          title: 'Example Weather API Screen',
          isShowBottomButton: false,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Thời tiết từ ngày 01/01 đến 08/02',
                    style: theme.textTheme.headline5,
                  ),
                ),
                InkWell(
                  onTap: onGetWeather,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.blue03A1E4,
                    ),
                    child: Text(
                      'Lấy dữ liệu',
                      style: AppTextTheme.title4.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (state is ExampleGetWeatherState &&
                        state.status == BlocStatusState.loading) {
                      return const Expanded(
                        child: Center(
                          child: Loading(
                            brightness: Brightness.light,
                          ),
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.viewModel.weathers?.length ?? 0,
                        itemBuilder: (context, index) {
                          return ExampleWeatherCell(
                            weatherEntity: state.viewModel.weathers?[index],
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
