part of 'request_bloc.dart';

@immutable
abstract class RequestEvent {}

class MakeRequestEvent extends RequestEvent {
  MakeRequestEvent({this.imageFiles, this.audioFiles});
  List<File>? imageFiles;
  List<File>? audioFiles;
}
