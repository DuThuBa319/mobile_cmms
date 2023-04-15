part of 'audio_picker_widget.dart';

extension AudioPickerAction on _AudioListViewState {
  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    await recorder.openRecorder();
    // isRecorderReady = true;
    await recorder.setSubscriptionDuration(const Duration(milliseconds: 100));
  }

  void recordDialog() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(
              'Recording',
              style: Theme.of(context).textTheme.headline5,
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
                        recorder.isRecording ? Icons.stop : Icons.mic,
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
                          setState(() {});
                        } else {
                          await recorder.startRecorder(
                            toFile: 'audio.aac',
                            codec: Codec.aacADTS,
                          );

                          setState(() {});
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
