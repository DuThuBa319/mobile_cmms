import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../common/utils/singletons.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../../../common_widget/forms/submit_screen_form.dart';
import '../../../common_widget/loading.dart';
import '../../../common_widget/smart_refresher_wrapper.dart';
import '../../../theme/app_text_theme.dart';
import '../../../theme/theme_color.dart';
import '../bloc/example_temp_humid_bloc.dart';
import 'widgets/example_weather_cell.dart';

part 'example_temp_humid.action.dart';

class ExampleTempHumidScreen extends StatefulWidget {
  const ExampleTempHumidScreen({Key? key}) : super(key: key);

  @override
  State<ExampleTempHumidScreen> createState() => _ExampleTempHumidState();
}

class _ExampleTempHumidState extends StateBase<ExampleTempHumidScreen> {
  final _refreshController = RefreshController(initialRefresh: true);
  TextEditingController longtitude = TextEditingController();
  TextEditingController latitude = TextEditingController();
  DateTime date = DateTime.now();

  String strStartDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  @override
  ExampleTempHumidBloc get bloc => BlocProvider.of(context);

  @override
  Widget buildBase(BuildContext context) {
    return BlocConsumer<ExampleTempHumidBloc, ExampleTempHumidState>(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Thời tiết ngày ',
                        style: theme.textTheme.headline5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        decoration:
                            BoxDecoration(border: Border.all(width: 1.0)),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$strStartDate',
                              style: theme.textTheme.headline5,
                            ),
                            InkWell(
                              onTap: selectedDate,
                              child: const Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 100,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              // inputFormatters: <TextInputFormatter>[
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
                              controller: latitude,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                    fontSize: 14,
                                  ),
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Nhập vĩ độ',
                                hintText: '16.125',
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              // inputFormatters: <TextInputFormatter>[
                              //   FilteringTextInputFormatter.digitsOnly,
                              // ],
                              controller: longtitude,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                    fontSize: 14,
                                  ),
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Nhập kinh độ',
                                hintText: '108.125',
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: onGetTemperatureHourly,
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
                    if (state is ExampleGetTemperatureState &&
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
                            temperatureEntity: state.viewModel.weathers?[index],
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
