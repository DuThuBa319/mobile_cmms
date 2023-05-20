import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
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
      // if (event.imageFiles != null) await upLoadFile(event.imageFiles!);
      // if (event.audioFiles != null) {
      //   await upLoadFile(event.audioFiles!, type: 'audio/mpeg');
      // }
      // final newViewModel = state.viewModel.copyWith(allFiles: temp);
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

  Future<void> upLoadFile(
    List<File> files, {
    String type = 'image/jpeg',
  }) async {
    CloudStorageResult? result;
    final uploadResults = <CloudStorageResult>[];
    for (var i = 0; i < files.length; i++) {
      if (type == 'image/jpeg') {
        final dir = (await getApplicationDocumentsDirectory()).path;
        //String dir = path.dirname(file.path);
        final newPath = path.join(
          dir,
          'image $i.jpg',
        );
        final f = await File(files[i].path).copy(newPath);
        result = await FirebaseStorageService.uploadFile(file: f, type: type);
      } else {
        result =
            await FirebaseStorageService.uploadFile(file: files[i], type: type);
      }

      uploadResults.add(result!);
    }
  }
}
