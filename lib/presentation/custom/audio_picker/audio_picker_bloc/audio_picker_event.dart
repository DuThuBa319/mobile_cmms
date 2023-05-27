part of 'audio_picker_bloc.dart';

@immutable
abstract class AudioPickerEvent {}

class StartRecordEvent extends AudioPickerEvent {
  StartRecordEvent({this.recorder});

  FlutterSoundRecorder? recorder;
}

class StopRecordEvent extends AudioPickerEvent {
  StopRecordEvent({this.audioDuration, this.recorder});
  Duration? audioDuration;
  FlutterSoundRecorder? recorder;
}

class GetAudioEvent extends AudioPickerEvent {
  GetAudioEvent();
}

class DeleteAudioEvent extends AudioPickerEvent {
  DeleteAudioEvent({this.index});

  int? index;
}

class LoadAudioEvent extends AudioPickerEvent {
  LoadAudioEvent({this.audioFiles});
  final List<File>? audioFiles;
}
