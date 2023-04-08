part of 'maintenace_request_screen_view.dart';

extension MaintenanceRequestViewAction on _MaintenanceRequestViewState {
  void equipmentChanged(dynamic value) {
    if (value == 'Khuôn ép') {
      setState(() {
        moldSelected = true;
      });
    }
  }

  Future<ImageSource> selectSource() async {
    ImageSource source;
    final completer = Completer<ImageSource>();
    await showModalBottomSheet<ImageSource>(
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
                  Navigator.of(context).pop(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_camera,
                ),
                title: const Text(
                  'Camera',
                  style: TextStyle(),
                ),
                onTap: () {
                  Navigator.of(context).pop(ImageSource.camera);
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
    ImageSource source;
    source = await selectSource();
    await selectFile(source);
  }

  Future<void> selectFile(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    if (pickedFile != null) {
      fileName = pickedFile.name;
      file = File(pickedFile.path);
      imageFiles.add(File(pickedFile.path));
      imageCount = imageFiles.length;
      print('Image File $file');
      setState(() {});
    }
  }

  void editPicker(BuildContext context, int index) {
    showModalBottomSheet(
      //backgroundColor: Colors.transparent,
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
                  Icons.replay,
                ),
                title: const Text(
                  'Replace',
                  style: TextStyle(),
                ),
                onTap: () {
                  replaceFile(ImageSource.gallery, index);
                  Navigator.of(context).pop();
                },
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
                  deleteImage(index);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void deleteImage(int index) {
    imageFiles.removeAt(index);
    imageCount = imageFiles.length;
    setState(() {});
  }

  Future<void> replaceFile(ImageSource source, int index) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      fileName = pickedFile.name;
      file = File(pickedFile.path);
      imageFiles[index] = File(pickedFile.path);

      setState(() {});
    }
  }

  Future<void> _upLoadFile() async {
    for (final image in imageFiles) {
      final result = await FirebaseStorageService.uploadFile(file: image);
      uploadResults.add(result!);
    }
  }

  Future record() async {
    //  if (!isRecorderReady) return;

    await recorder.startRecorder(toFile: 'audio.aac', codec: Codec.aacADTS);
  }

  Future stop() async {
    //  if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);
    print('Recorded audio:$audioFile');

    // final result = await FirebaseStorageService.uploadFile(
    //   file: audioFile,
    //   type: 'audio/mpeg',
    // );
    // uploadResults.add(result!);
  }

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
                          await stop();
                          setState(() {});
                        } else {
                          await record();

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

                      String twoDigits(int n) => n.toString().padLeft(2, '0');

                      final twoDigitMinutes =
                          twoDigits(duration.inMinutes.remainder(60));
                      final twoDigitSeconds =
                          twoDigits(duration.inSeconds.remainder(60));
                      totalDuration = duration;
                      return Text(
                        '$twoDigitMinutes:$twoDigitSeconds',
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
}
