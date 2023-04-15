import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../common/services/firebase/firebase_storage_service.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';

part 'request_event.dart';
part 'request_state.dart';

@injectable
class RequestBloc extends AppBlocBase<RequestEvent, RequestState> {
  RequestBloc() : super(RequestInitialState()) {
    on<MakeRequestEvent>(_onMakeRequest);
  }

  Future<void> _onMakeRequest(
    MakeRequestEvent event,
    Emitter<RequestState> emit,
  ) async {
    emit(
      MakeRequestState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      if (event.imageFiles != null) await upLoadFile(event.imageFiles!);
      if (event.audioFiles != null)
        await upLoadFile(event.audioFiles!, type: 'audio/mpeg');
      // final newViewModel = state.viewModel.copyWith(allFiles: temp);
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          //viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(status: BlocStatusState.failure));
    }
  }

  Future<void> upLoadFile(
    List<File> Files, {
    String type = 'image/jpeg',
  }) async {
    final uploadResults = <CloudStorageResult>[];
    for (final file in Files) {
      final result =
          await FirebaseStorageService.uploadFile(file: file, type: type);
      uploadResults.add(result!);
    }
  }
}
