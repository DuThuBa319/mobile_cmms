import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../../../common_widget/check_box/check_box.dart';
import '../../../common_widget/export.dart';
import '../../../custom/custom_screen_form.dart';
import '../../../theme/theme_color.dart';
import '../bloc/get_detail_bloc/get_request_info_bloc.dart';

class SelectInfoScreen extends StatefulWidget {
  const SelectInfoScreen({super.key, this.title});
  final String? title;

  @override
  State<SelectInfoScreen> createState() => _SelectInfoScreenState();
}

class _SelectInfoScreenState extends StateBase<SelectInfoScreen> {
  List<String> tempCauses = [];
  @override
  GetRequestInfoBloc get bloc => BlocProvider.of(context);

  @override
  Widget buildBase(BuildContext context) {
    return BlocConsumer<GetRequestInfoBloc, GetRequestInfoState>(
      listener: (context, state) {
        if (state is ResponseCausesState &&
            state.status == BlocStatusState.success) {
          Navigator.pop(context, state.viewModel.listCausesSelected);
        }
      },
      builder: (context, state) {
        if (state is GetRequestInfoInitialState) {
          bloc.add(GetCausesEvent());
        }
        if (state is GetCausesState &&
            state.status == BlocStatusState.loading) {
          return const Loading();
        } else {
          final selected = List<bool>.generate(
            state.viewModel.causeEntities?.length ?? 0,
            (index) => false,
          );

          return CustomScreenForm(
            title: widget.title,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: state.viewModel.causeEntities?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration:
                              BoxDecoration(border: Border.all(width: 0.5)),
                          margin: const EdgeInsets.all(10),
                          child: CheckboxWithTitle(
                            title: state.viewModel.causeEntities?[index]
                                    .causeName ??
                                '--',
                            value: state.viewModel.isCauseSelected?[index],
                            onChanged: (p0) {
                              bloc.add(SelectCauseEvent(index: index));
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.blue0089D7,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 360,
                    height: 70,
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: TextButton(
                      onPressed: () {
                        bloc.add(ResponseCausesEvent());
                      },
                      child: Text(
                        'Lưu',
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
