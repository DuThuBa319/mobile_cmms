part of 'image_picker_bloc.dart';

@immutable
abstract class ImagePickerEvent {}

class GetImageEvent extends ImagePickerEvent {
  GetImageEvent({this.source});
  ImageSource? source;
}

class DeleteImageEvent extends ImagePickerEvent {
  DeleteImageEvent({this.index});
  int? index;
}

class ReplaceImageEvent extends ImagePickerEvent {
  ReplaceImageEvent({this.source, this.index});
  ImageSource? source;
  int? index;
}
