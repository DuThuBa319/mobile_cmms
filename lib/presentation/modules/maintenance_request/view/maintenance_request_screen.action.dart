part of 'maintenace_request_screen_view.dart';

extension MaintenanceRequestViewAction on _MaintenanceRequestViewState {
  void equipmentChanged(dynamic value) {
    if (value == 'Khuôn ép') {
      setState(() {
        moldSelected = true;
      });
    }
  }

  void _showPicker(BuildContext context) {
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
                  Icons.photo_library,
                ),
                title: const Text(
                  'Gallery',
                  style: TextStyle(),
                ),
                onTap: () {
                  _selectFile(ImageSource.gallery);
                  Navigator.of(context).pop();
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
                  _selectFile(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectFile(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    if (pickedFile != null) {
      fileName = pickedFile.name;
      file = File(pickedFile.path);
      imageFiles.add(File(pickedFile.path));
      imageCount = imageFiles.length;

      setState(() {});
    }
  }

  Future<void> _upLoadFile() async {
    // final uploadPath = 'uploads/$fileName';

    // final uploadFile = file;

    // final ref = FirebaseStorage.instance.ref().child(uploadPath);
    // uploadTask = ref.putFile(uploadFile!);
    // final snapshot = await uploadTask!.whenComplete(() => null);
    // final urlDownload = await snapshot.ref.getDownloadURL();
    for (final image in imageFiles) {
      final result = await FirebaseStorageService.uploadFile(file: image);
      uploadResults.add(result!);
    }
  }
}
