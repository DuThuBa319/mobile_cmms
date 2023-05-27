import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../../domain/entities/cmms/correction_entity.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../../usecase/select_info_usecase.dart';
import '../../view/select_info_screen.dart';

part 'select_info_event.dart';
part 'select_info_state.dart';

@injectable
class SelectInfoBloc extends AppBlocBase<SelectInfoEvent, SelectInfoState> {
  final SelectInfoUsecase _usecase;
  SelectInfoBloc(this._usecase) : super(SelectInfoInitialState()) {
    on<GetInfosEvent>(_onGetCauses);

    on<InfoSelectedEvent>(_onSelectCauses);
    on<ResponseInfosEvent>(_onResponseCauses);
  }

  Future<void> _onGetCauses(
    GetInfosEvent event,
    Emitter<SelectInfoState> emit,
  ) async {
    emit(
      GetInfoState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      List<CauseEntity>? causeResponses = [];
      List<CorrectionEntity>? correctionResponses = [];
      List<dynamic>? responses;
      var newViewModel = state.viewModel;
      final temps = <int>[];
      if (event.infoType == InfoType.Cause) {
        causeResponses = await _usecase.getListCauses();
        responses = causeResponses;
        if (event.selectedCause!.isNotEmpty) {
          for (var i = 0; i < causeResponses!.length; i++) {
            for (final item in event.selectedCause!) {
              if (item.id == causeResponses[i].id) {
                temps.add(i);
              }
            }
          }
        }
      } else {
        correctionResponses = await _usecase.getListCorrections();
        responses = correctionResponses;
        final temps = <int>[];
        if (event.selectedCorrection!.isNotEmpty) {
          for (var i = 0; i < correctionResponses!.length; i++) {
            for (final item in event.selectedCorrection!) {
              if (item.id == correctionResponses[i].id) {
                temps.add(i);
              }
            }
          }
        }
      }

      newViewModel = state.viewModel.copyWith(
        causeResponse: causeResponses,
        correctionResponse: correctionResponses,
        listCauseSelected: [],
        listCorrectionSelected: [],
        infoResponse: responses,
        isInfoSelected: temps.isEmpty
            ? List<bool>.generate(responses?.length ?? 0, (index) => false)
            : List<bool>.generate(responses?.length ?? 0, (index) {
                for (final temp in temps) {
                  if (temp == index) {
                    return true;
                  }
                }
                return false;
              }),
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
    InfoSelectedEvent event,
    Emitter<SelectInfoState> emit,
  ) async {
    emit(
      GetInfoState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final listTemp = state.viewModel.isInfoSelected!;
      listTemp[event.index!] = !listTemp[event.index!];

      final newViewModel = state.viewModel.copyWith(
        isInfoSelected: listTemp,
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
    ResponseInfosEvent event,
    Emitter<SelectInfoState> emit,
  ) async {
    emit(
      ResponseInfosState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final listTemp = state.viewModel.isInfoSelected!;
      final responseCauses = <CauseEntity>[];
      final responseCorrections = <CorrectionEntity>[];
      if (event.infoType == InfoType.Correction) {
        for (var i = 0; i < listTemp.length; i++) {
          if (listTemp[i] == true) {
            responseCorrections.add(state.viewModel.correctionResponse![i]);
          }
        }
      }
      if (event.infoType == InfoType.Cause) {
        for (var i = 0; i < listTemp.length; i++) {
          if (listTemp[i] == true) {
            responseCauses.add(state.viewModel.causeResponse![i]);
          }
        }
      }

      final newViewModel = state.viewModel.copyWith(
        isInfoSelected: listTemp,
        listCauseSelected: responseCauses,
        listCorrectionSelected: responseCorrections,
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
