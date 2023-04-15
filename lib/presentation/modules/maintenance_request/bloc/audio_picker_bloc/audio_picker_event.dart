part of 'audio_picker_bloc.dart';

@immutable
abstract class AudioPickerEvent {}

class StopRecordEvent extends AudioPickerEvent {
  StopRecordEvent({this.audioDuration, this.recorder});
  Duration? audioDuration;
  FlutterSoundRecorder? recorder;
}
