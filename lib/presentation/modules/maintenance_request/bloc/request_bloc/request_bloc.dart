import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../../common/services/firebase/firebase_storage_service.dart';
import '../../../../../common/utils/singletons.dart';
import '../../../../../data/models/cmms/cmms_enum.dart';
import '../../../../../data/models/cmms/post/create_request.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../../usecase/maintenance_request_usecase.dart';

part 'request_event.dart';
part 'request_state.dart';

@injectable
class RequestBloc extends AppBlocBase<RequestEvent, RequestState> {
  final MaintenanceRequestUsecase _usecase;
  RequestBloc(this._usecase) : super(RequestInitialState()) {
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
      final user = userDataData.getUser();
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
        equipmentCode: event.maintenanceObject == MaintenanceObject.equipment
            ? event.objectCode
            : null,
        maintenanceObject: event.maintenanceObject,
        requester: user!.id,
        status: event.requestStatus,
        responsiblePerson: event.responsiblePersonCode,
        submissionDate: DateTime.now().toUtc(),
        images: imageUrls,
        sounds: audioUrls,
        moldCode: event.maintenanceObject == MaintenanceObject.mold
            ? event.objectCode
            : null,
      );
      final isSuccess = await _usecase.createMaintenanceRequest(
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
      // final dir = (await getApplicationDocumentsDirectory()).path;

      // final newPath = path.join(
      //   dir,
      //   'image $i.jpg',
      // );
      // final f = await File(imageFiles[i].path).copy(newPath);
      result = await FirebaseStorageService.uploadFile(
        file: imageFiles[i],
        folder: '$folder',
      );
      imageUrl.add(result!.url!);

      uploadResults.add(result);
    }
    return imageUrl;
  }
}
