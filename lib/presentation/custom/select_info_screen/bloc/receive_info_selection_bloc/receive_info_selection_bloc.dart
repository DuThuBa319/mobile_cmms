import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../../domain/entities/cmms/correction_entity.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';

part 'receive_info_selection_event.dart';
part 'receive_info_selection_state.dart';

@injectable
class ReceiveInfoSelectionBloc
    extends AppBlocBase<ReceiveInfoSelectionEvent, ReceiveInfoSelectionState> {
  ReceiveInfoSelectionBloc() : super(ReceiveInfoSelectionInitialState()) {
    on<ReceiveInfoInitialEvent>(_onReceiveInfoInitial);
    on<ReceiveCauseEvent>(_onReceiveCauses);
    on<ReceiveCorrectionEvent>(_onReceiveCorrections);
    on<ReceiveImageFileEvent>(_onReceiveImageFiles);
    on<ReceiveAudioFileEvent>(_onReceiveAudioFiles);
  }
  Future<void> _onReceiveInfoInitial(
    ReceiveInfoInitialEvent event,
    Emitter<ReceiveInfoSelectionState> emit,
  ) async {
    emit(
      LoadFileState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final newViewModel = state.viewModel.copyWith(
        listCauseSelected: event.listCauseSelected,
        listCorrectionSelected: event.listCorrectionSelected,
        audioFiles: event.audioFiles,
        imageFiles: event.imageFiles,
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

  Future<void> _onReceiveCauses(
    ReceiveCauseEvent event,
    Emitter<ReceiveInfoSelectionState> emit,
  ) async {
    emit(
      ReceiveCauseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final listCauseId = <String>[];
      if (event.listCauseEntity!.isNotEmpty) {
        for (final cause in event.listCauseEntity!) {
          listCauseId.add(cause.id!);
        }
      }

      final newViewModel = state.viewModel.copyWith(
        listCauseId: listCauseId,
        listCauseSelected: event.listCauseEntity,
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

  Future<void> _onReceiveCorrections(
    ReceiveCorrectionEvent event,
    Emitter<ReceiveInfoSelectionState> emit,
  ) async {
    emit(
      ReceiveCorrectionState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final listCorrectionId = <String>[];
      if (event.listCorrectionEntity!.isNotEmpty) {
        for (final correction in event.listCorrectionEntity!) {
          listCorrectionId.add(correction.id!);
        }
      }

      final newViewModel = state.viewModel.copyWith(
        listCorrectionId: listCorrectionId,
        listCorrectionSelected: event.listCorrectionEntity,
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

  Future<void> _onReceiveImageFiles(
    ReceiveImageFileEvent event,
    Emitter<ReceiveInfoSelectionState> emit,
  ) async {
    emit(
      ReceiveImageFileState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final newViewModel = state.viewModel.copyWith(
        imageFiles: event.imageFiles,
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

  Future<void> _onReceiveAudioFiles(
    ReceiveAudioFileEvent event,
    Emitter<ReceiveInfoSelectionState> emit,
  ) async {
    emit(
      ReceiveAudioFileState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final newViewModel = state.viewModel.copyWith(
        audioFiles: event.audioFiles,
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
