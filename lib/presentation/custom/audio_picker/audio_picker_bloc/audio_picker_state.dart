part of 'audio_picker_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated
class AudioInfo {
  Duration? duration;
  String? name;
  File? file;
  AudioInfo({this.duration, this.file, this.name});
}

class _ViewModel {
  final List<AudioInfo>? audioFiles;

  const _ViewModel({
    this.audioFiles,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    List<AudioInfo>? audioFiles,
  }) {
    return _ViewModel(
      audioFiles: audioFiles ?? this.audioFiles,
    );
  }
}

// Abstract class
abstract class AudioPickerState {
  final _ViewModel viewModel;
  // Status of the state. Schedule "success" "failed" "loading"
  final BlocStatusState status;

  AudioPickerState(this.viewModel, {this.status = BlocStatusState.initial});

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of AudioPickerState (abstract class)
  T copyWith<T extends AudioPickerState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == AudioPickerState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class AudioPickerInitialState extends AudioPickerState {
  AudioPickerInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class StartRecordState extends AudioPickerState {
  StartRecordState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class GetAudioState extends AudioPickerState {
  GetAudioState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

final _factories = <
    Type,
    Function(
  _ViewModel viewModel,
  BlocStatusState status,
)>{
  AudioPickerInitialState: (viewModel, status) => AudioPickerInitialState(
        viewModel: viewModel,
        status: status,
      ),
  GetAudioState: (viewModel, status) => GetAudioState(
        viewModel: viewModel,
        status: status,
      ),
};
