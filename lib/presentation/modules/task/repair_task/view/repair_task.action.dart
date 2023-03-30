part of 'repair_task_view.dart';

extension RepairTaskViewAction on _RepairTaskViewState {
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      _image = imageTemporary;
    });
  }
}
