import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';

part 'audio_picker_event.dart';
part 'audio_picker_state.dart';

@injectable
class AudioPickerBloc extends AppBlocBase<AudioPickerEvent, AudioPickerState> {
  AudioPickerBloc() : super(AudioPickerInitialState()) {
    on<StopRecordEvent>(_onStopRecord);
  }

  Future<void> _onStopRecord(
    StopRecordEvent event,
    Emitter<AudioPickerState> emit,
  ) async {
    emit(
      GetAudioState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final temp = await stopRecord(
        duration: event.audioDuration!,
        audioFiles: state.viewModel.audioFiles ?? [],
        recorder: event.recorder,
      );
      final newViewModel = state.viewModel.copyWith(audioFiles: temp);
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(status: BlocStatusState.failure));
    }
  }

  Future<List<AudioInfo>> stopRecord({
    required List<AudioInfo> audioFiles,
    Duration? duration,
    FlutterSoundRecorder? recorder,
  }) async {
    //  if (!isRecorderReady) return;
    final path = await recorder!.stopRecorder();
    final audioFile = File(path!);
    final fileName = 'Recording_00${audioFiles.length + 1}.mp3';
    final audioInfo =
        AudioInfo(duration: duration, name: fileName, file: audioFile);

    audioFiles.add(audioInfo);
    return audioFiles;
  }
}
