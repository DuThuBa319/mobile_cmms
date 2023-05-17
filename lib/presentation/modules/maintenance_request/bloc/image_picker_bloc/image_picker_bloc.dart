import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

@injectable
class ImagePickerBloc extends AppBlocBase<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitialState()) {
    on<GetImageEvent>(_onGetImage);
    on<DeleteImageEvent>(_onDeleteImage);
    on<ReplaceImageEvent>(_onReplaceImage);
  }

  Future<void> _onGetImage(
    GetImageEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    emit(
      GetImageState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final temp = state.viewModel.imageFiles ?? <File>[];
      final imageFile = await selectFile(event.source ?? ImageSource.gallery);
      temp.addAll(imageFile!);
      final newViewModel = state.viewModel.copyWith(imageFiles: temp);
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(status: BlocStatusState.failure));
    }
  }

  Future<void> _onDeleteImage(
    DeleteImageEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    emit(
      GetImageState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final temp = state.viewModel.imageFiles ?? <File>[];
      temp.removeAt(event.index!);

      final newViewModel = state.viewModel.copyWith(imageFiles: temp);
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(status: BlocStatusState.failure));
    }
  }

  Future<void> _onReplaceImage(
    ReplaceImageEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    emit(
      GetImageState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final temp = state.viewModel.imageFiles ?? <File>[];
      temp[event.index!] = await replaceFile(
        source: event.source!,
        oldFile: temp[event.index!],
      );

      final newViewModel = state.viewModel.copyWith(imageFiles: temp);
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(status: BlocStatusState.failure));
    }
  }
}

Future<List<File>?> selectFile(ImageSource source) async {
  final files = <File>[];
  if (source == ImageSource.camera) {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    if (pickedFile != null) {
      files.add(File(pickedFile.path));
      return files;
    }
  }
  if (source == ImageSource.gallery) {
    final pickedFiles =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    for (final file in pickedFiles!.files) {
      if (file.extension == 'jpg' || file.extension == 'png') {
        files.add(File(file.path!));
      }
    }
    return files;
  }
  return null;
}

Future<File> replaceFile({
  required ImageSource source,
  required File oldFile,
}) async {
  final pickedFile = await ImagePicker().pickImage(
    source: source,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return oldFile;
}
