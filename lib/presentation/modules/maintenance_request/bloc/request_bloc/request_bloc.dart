import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../../../../common/services/firebase/firebase_storage_service.dart';
import '../../../../../data/models/cmms/cmms_enum.dart';
import '../../../../../data/models/cmms/post/create_request.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../../repository/maintenance_request_repository.dart';

part 'request_event.dart';
part 'request_state.dart';

@injectable
class RequestBloc extends AppBlocBase<RequestEvent, RequestState> {
  final MaintenanceRequestRepository _repository;
  RequestBloc(this._repository) : super(RequestInitialState()) {
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
      final date =
          DateFormat('HH:mm dd-MM-yyyy').format(DateTime.now().toUtc());
      final imageUrls = await upLoadImageFile(
        imageFiles: event.imageFiles!,
        folder: 'Maintenance Request/$date/images',
      );
      final audioUrls = await upLoadAudioFile(
        audioFiles: event.audioFiles!,
        folder: 'Maintenance Request/$date/audios',
      );
      final request = CreateRequest(
        problem: event.problem,
        requestedPriority: event.priority,
        requestedCompletionDate: event.requestedCompletionDate!.toUtc(),
        type: event.type,
        equipmentCode: event.equipmentCode,
        maintenanceObject: MaintenanceObject.equipment,
        requester: event.requestorCode,
        status: RequestStatus.submitted,
        responsiblePerson: event.requestorCode,
        submissionDate: DateTime.now().toUtc(),
        images: imageUrls,
        sounds: audioUrls,
      );
      final isSuccess = await _repository.createMaintenanceRequest(
        createRequest: request,
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: state.viewModel,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(status: BlocStatusState.failure));
    }
  }

  Future<List<String>> upLoadAudioFile({
    required List<File> audioFiles,
    required String folder,
  }) async {
    CloudStorageResult? result;
    final uploadResults = <CloudStorageResult>[];
    final audioUrls = <String>[];
    for (var i = 0; i < audioFiles.length; i++) {
      result = await FirebaseStorageService.uploadFile(
        file: audioFiles[i],
        type: 'audio/mpeg',
        folder: '$folder',
      );
      if (result != null) {
        uploadResults.add(result);
        audioUrls.add(result.url!);
      }
    }
    return audioUrls;
  }

  Future<List<String>> upLoadImageFile({
    required List<File> imageFiles,
    required String folder,
  }) async {
    CloudStorageResult? result;
    final uploadResults = <CloudStorageResult>[];
    final imageUrl = <String>[];
    for (var i = 0; i < imageFiles.length; i++) {
      final dir = (await getApplicationDocumentsDirectory()).path;
      //String dir = path.dirname(file.path);
      final newPath = path.join(
        dir,
        'image $i.jpg',
      );
      final f = await File(imageFiles[i].path).copy(newPath);
      result = await FirebaseStorageService.uploadFile(
        file: f,
        folder: '$folder',
      );
      imageUrl.add(result!.url!);

      uploadResults.add(result);
    }
    return imageUrl;
  }
}
