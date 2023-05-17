import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';

part 'audio_picker_event.dart';
part 'audio_picker_state.dart';

@injectable
class AudioPickerBloc extends AppBlocBase<AudioPickerEvent, AudioPickerState> {
  AudioPickerBloc() : super(AudioPickerInitialState()) {
    on<StartRecordEvent>(_onStartRecord);
    on<StopRecordEvent>(_onStopRecord);
    on<GetAudioEvent>(_onGetAudio);
    on<DeleteAudioEvent>(_onDeleteAudio);
  }
  Future<void> _onStartRecord(
    StartRecordEvent event,
    Emitter<AudioPickerState> emit,
  ) async {
    try {
      emit(
        StartRecordState(
          status: BlocStatusState.success,
          viewModel: state.viewModel,
        ),
      );
      await event.recorder!.startRecorder(
        toFile: 'audio.aac',
        codec: Codec.aacADTS,
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

  Future<void> _onGetAudio(
    GetAudioEvent event,
    Emitter<AudioPickerState> emit,
  ) async {
    emit(
      GetAudioState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final temp =
          await selectFile(audioFiles: state.viewModel.audioFiles ?? []);
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

  Future<void> _onDeleteAudio(
    DeleteAudioEvent event,
    Emitter<AudioPickerState> emit,
  ) async {
    emit(
      GetAudioState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final temp = state.viewModel.audioFiles ?? [];
      temp.removeAt(event.index!);

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
    final numberFormat = NumberFormat('000', 'en_US');
    final audioPath = await recorder!.stopRecorder();
    final audioFile = File(audioPath!);
    final fileName =
        'Recording_${numberFormat.format(audioFiles.length + 1)}.mp3';
    final dir = (await getApplicationDocumentsDirectory()).path;
    //String dir = path.dirname(file.path);
    final newPath = path.join(dir, 'audio ${audioFiles.length + 1}.mp3');
    final f = await File(audioFile.path).copy(newPath);
    final audioInfo = AudioInfo(duration: duration, name: fileName, file: f);

    audioFiles.add(audioInfo);

    return audioFiles;
  }

  Future<List<AudioInfo>?> selectFile({
    required List<AudioInfo> audioFiles,
  }) async {
    final _numberFormat = NumberFormat('00', 'en_US');
    final pickedFiles =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (pickedFiles != null) {
      for (final file in pickedFiles.files) {
        if (file.extension == 'mp3' || file.extension == 'm4a') {
          final audioFile = File(file.path!);
          final fileName = 'Recording_00${audioFiles.length + 1}.mp3';
          final dir = (await getApplicationDocumentsDirectory()).path;
          //String dir = path.dirname(file.path);
          final newPath = path.join(dir, 'audio ${audioFiles.length + 1}.mp3');
          final f = await File(audioFile.path).copy(newPath);
          final duration = await getFileDuration(newPath);
          final audioInfo =
              AudioInfo(duration: duration, name: fileName, file: f);

          audioFiles.add(audioInfo);
        }
      }

      return audioFiles;
    }
    return null;
  }

  Future<Duration> getFileDuration(String mediaPath) async {
    final mediaInfoSession = await FFprobeKit.getMediaInformation(mediaPath);
    final mediaInfo = mediaInfoSession.getMediaInformation()!;

    final duration = double.parse(mediaInfo.getDuration()!);
    int hour = 0, minute = 0, second = 0;
    if (duration > 3600) {
      hour = duration ~/ 3600;
      minute = (duration - hour * 3600) ~/ 60;
      second = (duration - hour * 3600 - minute * 60).toInt();
    }
    if (duration < 3600) {
      minute = duration ~/ 60;
      second = (duration - minute * 60).toInt();
    }
    final mediaDuration =
        Duration(hours: hour, minutes: minute, seconds: second);

    return mediaDuration;
  }
}
