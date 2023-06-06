part of 'audio_picker_widget.dart';

extension AudioPickerAction on _AudioListViewState {
  void _blocListener(BuildContext context, AudioPickerState state) {
    if (state is GetAudioState && state.status == BlocStatusState.loading) {
      //  showToast('Đang lấy ghi âm');
    }
    if (state is GetAudioState && state.status == BlocStatusState.success) {
      audioInfos = state.viewModel.audioInfos!;
      //  showToast('Lấy hình ảnh thành công');
      final audioFiles = state.viewModel.audioInfos;
      final temp = <File>[];
      for (final file in audioFiles!) {
        temp.add(file.file!);
      }
      widget.receiveBloc!.add(ReceiveAudioFileEvent(audioFiles: temp));
    }
    if (state is LoadAudioState && state.status == BlocStatusState.success) {
      audioInfos = state.viewModel.audioInfos!;
      //  showToast('Lấy hình ảnh thành công');
      final audioFiles = state.viewModel.audioInfos;
    }
  }

  //----------------------------------//
  Future initRecorder() async {
    await [Permission.microphone].request();

    await recorder.openRecorder();
    // isRecorderReady = true;
    await recorder.setSubscriptionDuration(const Duration(milliseconds: 100));
  }

//-------------------------
  Future<String> selectSource() async {
    final completer = Completer<String>();
    await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                ),
                title: const Text(
                  'Gallery',
                  style: TextStyle(),
                ),
                onTap: () {
                  Navigator.of(context).pop('Gallery');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.mic,
                ),
                title: const Text(
                  'Micro',
                  style: TextStyle(),
                ),
                onTap: () {
                  Navigator.of(context).pop('New Record');
                },
              ),
            ],
          ),
        );
      },
    ).then(completer.complete);
    return completer.future;
  }

  Future<void> showPicker(BuildContext context) async {
    final source = await selectSource();
    if (source == 'Gallery') {
      widget.bloc!.add(GetAudioEvent());
    }
    if (source == 'New Record') {
      recordDialog();
    }
  }

  void editPicker(BuildContext context, int index) {
    showModalBottomSheet(
      //backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: const Icon(
                  Icons.delete,
                ),
                title: const Text(
                  'Delete',
                  style: TextStyle(),
                ),
                onTap: () {
                  widget.bloc?.add(DeleteAudioEvent(index: index));
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

//---------------------
  void recordDialog() {
    showDialog(
      context: context,
      builder: (context) => BlocBuilder<AudioPickerBloc, AudioPickerState>(
        bloc: widget.bloc,
        builder: (context, setState) {
          return AlertDialog(
            title: Text(
              'Recording',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            content: Container(
              width: 150,
              height: 150,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.blue0089D7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Icon(
                        widget.bloc!.state is StartRecordState &&
                                widget.bloc!.state.status ==
                                    BlocStatusState.success
                            ? Icons.stop
                            : Icons.mic,
                        color: AppColor.blue0089D7,
                        size: 50,
                      ),
                      onPressed: () async {
                        if (recorder.isRecording) {
                          widget.bloc?.add(
                            StopRecordEvent(
                              audioDuration: audioDuration,
                              recorder: recorder,
                            ),
                          );
                        } else {
                          widget.bloc
                              ?.add(StartRecordEvent(recorder: recorder));
                          // await recorder.startRecorder(
                          //   toFile: 'audio.aac',
                          //   codec: Codec.aacADTS,
                          // );
                          // setState(() {});
                        }
                      },
                    ),
                  ),
                  StreamBuilder<RecordingDisposition>(
                    builder: (context, snapshot) {
                      final duration = snapshot.hasData
                          ? snapshot.data!.duration
                          : Duration.zero;

                      return Text(
                        displayTime(duration),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                    stream: recorder.onProgress,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Exit'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ),
    );
  }

  String displayTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitHours = twoDigits(duration.inHours.remainder(60));
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    audioDuration = duration;
    return '$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds';
  }
}
