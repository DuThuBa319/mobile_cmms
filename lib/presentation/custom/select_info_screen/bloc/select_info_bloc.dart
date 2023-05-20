import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/entities/cmms/cause_entity.dart';

import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../usecase/select_info_usecase.dart';

part 'select_info_event.dart';
part 'select_info_state.dart';

@injectable
class SelectInfoBloc extends AppBlocBase<SelectInfoEvent, SelectInfoState> {
  final SelectInfoUsecase _usecase;
  SelectInfoBloc(this._usecase) : super(SelectInfoInitialState()) {
    on<GetCausesEvent>(_onGetCauses);

    on<SelectCauseEvent>(_onSelectCauses);
    on<ResponseCausesEvent>(_onResponseCauses);
  }

  Future<void> _onGetCauses(
    GetCausesEvent event,
    Emitter<SelectInfoState> emit,
  ) async {
    emit(
      GetInfoState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final responses = await _usecase.getListCauses();
      final temps = <int>[];
      if (event.selectedCause!.isNotEmpty) {
        for (var i = 0; i < responses!.length; i++) {
          for (final item in event.selectedCause!) {
            if (item.causeId == responses[i].causeId) {
              temps.add(i);
            }
          }
        }
      }

      final newViewModel = state.viewModel.copyWith(
        response: responses,
        isCauseSelected: temps.isEmpty
            ? List<bool>.generate(responses?.length ?? 0, (index) => false)
            : List<bool>.generate(responses?.length ?? 0, (index) {
                for (final temp in temps) {
                  if (temp == index) {
                    return true;
                  }
                }
                return false;
              }),
        listInfoSelected: [],
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(
        state.copyWith(
          viewModel: state.viewModel,
          status: BlocStatusState.failure,
        ),
      );
    }
  }

  Future<void> _onSelectCauses(
    SelectCauseEvent event,
    Emitter<SelectInfoState> emit,
  ) async {
    emit(
      GetInfoState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final listTemp = state.viewModel.isCauseSelected!;
      listTemp[event.index!] = !listTemp[event.index!];

      final newViewModel = state.viewModel.copyWith(
        isCauseSelected: listTemp,
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(
        state.copyWith(
          viewModel: state.viewModel,
          status: BlocStatusState.failure,
        ),
      );
    }
  }

  Future<void> _onResponseCauses(
    ResponseCausesEvent event,
    Emitter<SelectInfoState> emit,
  ) async {
    emit(
      ResponseCausesState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final listTemp = state.viewModel.isCauseSelected!;
      final responseCauses = <CauseEntity>[];
      for (var i = 0; i < listTemp.length; i++) {
        if (listTemp[i] == true) {
          responseCauses.add(state.viewModel.response![i]);
        }
      }
      final newViewModel = state.viewModel.copyWith(
        isCauseSelected: listTemp,
        listInfoSelected: responseCauses,
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(
        state.copyWith(
          viewModel: state.viewModel,
          status: BlocStatusState.failure,
        ),
      );
    }
  }
}
