import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../common/services/firebase/firebase_storage_service.dart';
import '../../../../../data/models/cmms/cmms_enum.dart';
import '../../../../../data/models/cmms/put/update_response.dart';
import '../../../../../domain/entities/cmms/cause_entity.dart';
import '../../../../../domain/entities/cmms/correction_entity.dart';
import '../../../../../domain/entities/cmms/maintenance_response_entity.dart';
import '../../../../base/base.dart';
import '../../../../base/state_base/bloc_status_state.dart';
import '../../repository/response_repository.dart';
import '../../usecase/response_usecase.dart';

part 'repair_task_event.dart';
part 'repair_task_state.dart';

@injectable
class RepairTaskBloc extends AppBlocBase<RepairTaskEvent, RepairTaskState> {
  final ResponseUsecase _usecase;
  final ResponseRepository _repository;

  RepairTaskBloc(this._usecase, this._repository)
      : super(RepairTaskInitialState()) {
    on<GetMaintenanceResponseEvent>(_onGetMaintenanceResponses);
    on<StartTaskEvent>(_onStartTask);
    on<FinishTaskEvent>(_onFinishTask);
    on<ReceiveCauseIdEvent>(_onReceiveCauseIds);
    on<SaveChangeEvent>(_onSaveChange);
    on<ReceiveCorrectionIdEvent>(_onReceiveCorrectionIds);
    on<ReceiveListImageFileEvent>(_onReceiveImageFiles);
    on<ReceiveListAudioFileEvent>(_onReceiveAudioFiles);
    on<GetMaterialEvent>(_onGetMaterial);
  }

  Future<void> _onGetMaintenanceResponses(
    GetMaintenanceResponseEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      GetMaintenanceResponseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final listCausesSelected = <CauseEntity>[];
      final listCorrectionsSelected = <CorrectionEntity>[];
      final listCauseId = <String>[];
      final listCorrectionId = <String>[];
      final listImageFiles = <File>[];
      final listAudioFiles = <File>[];
      final materialList = <MaterialMenuItem>[];
      final listSku = <String>[];

      final responseEntity =
          await _usecase.getMaintenanceResponse(responseId: event.responseId);
      listCausesSelected.addAll(responseEntity!.causeEntities!);
      for (final cause in responseEntity.causeEntities!) {
        listCauseId.add(cause.id!);
      }
      listCorrectionsSelected.addAll(responseEntity.correctionEntities!);
      for (final correction in responseEntity.correctionEntities!) {
        listCorrectionId.add(correction.id!);
      }
      for (final materialEntity in responseEntity.materials!) {
        listSku.add(materialEntity.sku!);

        var isExisted = false;
        for (var i = 0; i < materialList.length; i++) {
          if (materialEntity.materialInfoEntity!.name == materialList[i].name) {
            isExisted = true;
            materialList[i].listSku.add(materialEntity.sku!);
          }
        }
        if (isExisted == false) {
          materialList.add(
            MaterialMenuItem(
              listSku: [materialEntity.sku!],
              name: materialEntity.materialInfoEntity!.name!,
            ),
          );
        }
      }

      final update = UpdateResponse().copyWith(
        actualFinishTime: responseEntity.actualFinishTime,
        actualStartTime: responseEntity.actualStartTime,
        status: responseEntity.status,
        updatedAt: responseEntity.updatedAt,
        cause: listCauseId,
        correction: listCorrectionId,
        images: responseEntity.images,
        sounds: responseEntity.sounds,
        materials: listSku,
        type: responseEntity.type,
      );

      for (final url in responseEntity.images!) {
        listImageFiles.add(await _saveImage(url: url, list: listImageFiles));
      }
      for (final url in responseEntity.sounds!) {
        listAudioFiles.add(await _saveAudio(url: url, list: listAudioFiles));
      }

      final newViewModel = state.viewModel.copyWith(
        responseEntity: responseEntity,
        updateResponse: update,
        listCausesSelected: listCausesSelected,
        listCorrectionsSelected: listCorrectionsSelected,
        isChanged: false,
        listCauseId: listCauseId,
        listCorrectionId: listCorrectionId,
        imageUrls: responseEntity.images,
        audioUrls: responseEntity.sounds,
        imageFiles: listImageFiles,
        audioFiles: listAudioFiles,
        imageCount: listImageFiles.length,
        soundCount: listAudioFiles.length,
        materialMenuItems: materialList,
        listSku: listSku,
      );
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

  Future<void> _onStartTask(
    StartTaskEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      UpdateMaintenanceResponseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final update = state.viewModel.updateResponse!.copyWith(
        actualStartTime: DateTime.now().toUtc(),
        status: MaintenanceStatus.inProgress,
        updatedAt: DateTime.now().toUtc(),
      );
      final newViewModel = state.viewModel.copyWith(
        updateResponse: update,
        isChanged: false,
      );
      await _repository.updateMaintenanceResponse(
        maintenanceResponseId: state.viewModel.responseEntity!.id!,
        updateResponse: update,
      );

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

  Future<void> _onFinishTask(
    FinishTaskEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      UpdateMaintenanceResponseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final update = state.viewModel.updateResponse!.copyWith(
        actualFinishTime: DateTime.now().toUtc(),
        status: MaintenanceStatus.completed,
        updatedAt: DateTime.now().toUtc(),
      );
      final newViewModel = state.viewModel.copyWith(
        updateResponse: update,
      );
      await _repository.updateMaintenanceResponse(
        maintenanceResponseId: state.viewModel.responseEntity!.id!,
        updateResponse: update,
      );
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

  Future<void> _onSaveChange(
    SaveChangeEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      UpdateMaintenanceResponseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final id = state.viewModel.responseEntity!.id!;
      final imageUrls = state.viewModel.imageUrls;
      imageUrls!.addAll(
        await upLoadImageFile(
          imageFiles: state.viewModel.imageFiles!,
          folder: 'Maintenance Response/$id/images',
          availableImage: state.viewModel.imageCount ?? 0,
        ),
      );
      final audioUrls = state.viewModel.audioUrls;
      audioUrls!.addAll(
        await upLoadAudioFile(
          audioFiles: state.viewModel.audioFiles!,
          folder: 'Maintenance Response/$id/audios',
          availableAudio: state.viewModel.soundCount ?? 0,
        ),
      );
      final update = state.viewModel.updateResponse!.copyWith(
        updatedAt: DateTime.now().toUtc(),
        cause: state.viewModel.listCauseId,
        correction: state.viewModel.listCorrectionId,
        images: imageUrls,
        sounds: audioUrls,
        materials: state.viewModel.listSku,
      );
      final newViewModel = state.viewModel.copyWith(
        updateResponse: update,
      );
      await _repository.updateMaintenanceResponse(
        maintenanceResponseId: id,
        updateResponse: update,
      );
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

  Future<void> _onReceiveCauseIds(
    ReceiveCauseIdEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      ReceiveInfosState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final newViewModel = state.viewModel.copyWith(
        listCauseId: event.listCauseId,
        isChanged: true,
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(
        state.copyWith(
          viewModel: state.viewModel,
          status: BlocStatusState.failure,
        ),
      );
    }
  }

  Future<void> _onReceiveCorrectionIds(
    ReceiveCorrectionIdEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      ReceiveInfosState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final newViewModel = state.viewModel.copyWith(
        listCorrectionId: event.listCorrectionId,
        isChanged: true,
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(
        state.copyWith(
          viewModel: state.viewModel,
          status: BlocStatusState.failure,
        ),
      );
    }
  }

  Future<void> _onReceiveImageFiles(
    ReceiveListImageFileEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      ReceiveInfosState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final newViewModel = state.viewModel.copyWith(
        imageFiles: event.imageFiles,
        isChanged: true,
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(
        state.copyWith(
          viewModel: state.viewModel,
          status: BlocStatusState.failure,
        ),
      );
    }
  }

  Future<void> _onReceiveAudioFiles(
    ReceiveListAudioFileEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      ReceiveInfosState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final newViewModel = state.viewModel.copyWith(
        audioFiles: event.audioFiles,
        isChanged: true,
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          viewModel: newViewModel,
        ),
      );
    } catch (exception) {
      emit(
        state.copyWith(
          viewModel: state.viewModel,
          status: BlocStatusState.failure,
        ),
      );
    }
  }

  Future<void> _onGetMaterial(
    GetMaterialEvent event,
    Emitter<RepairTaskState> emit,
  ) async {
    emit(
      GetMaterialState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final responseMaterial = await _usecase.getMaterialItem(sku: event.sku!);

      if (responseMaterial!.status != MaterialStatus.available) {
        emit(
          state.copyWith(
            status: BlocStatusState.failure,
            viewModel: state.viewModel,
          ),
        );
      } else {
        var isExisted = false;
        final materialList = state.viewModel.materialMenuItems;
        final listSku = state.viewModel.listSku;
        listSku?.add(event.sku!);
        for (var i = 0; i < materialList!.length; i++) {
          if (responseMaterial.materialInfoEntity!.name ==
              materialList[i].name) {
            isExisted = true;
            materialList[i].listSku.add(event.sku!);
            break;
          }
        }
        if (isExisted == false) {
          materialList.add(
            MaterialMenuItem(
              listSku: [event.sku!],
              name: responseMaterial.materialInfoEntity!.name!,
            ),
          );
        }
        final newViewModel = state.viewModel.copyWith(
          isChanged: true,
          materialMenuItems: materialList,
          listSku: listSku,
        );

        emit(
          state.copyWith(
            status: BlocStatusState.success,
            viewModel: newViewModel,
          ),
        );
      }
    } catch (exception) {
      emit(
        ReceiveInfosState(
          viewModel: state.viewModel,
          status: BlocStatusState.failure,
        ),
      );
    }
  }
}

Future<List<String>> upLoadAudioFile({
  required List<File> audioFiles,
  required String folder,
  required int availableAudio,
}) async {
  CloudStorageResult? result;
  final uploadResults = <CloudStorageResult>[];
  final audioUrls = <String>[];
  for (var i = 0; i < audioFiles.length; i++) {
    if (i >= availableAudio) {
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
  }
  return audioUrls;
}

Future<List<String>> upLoadImageFile({
  required List<File> imageFiles,
  required String folder,
  required int availableImage,
}) async {
  CloudStorageResult? result;
  final uploadResults = <CloudStorageResult>[];
  final imageUrl = <String>[];
  for (var i = 0; i < imageFiles.length; i++) {
    if (i >= availableImage) {
      // final dir = (await getApplicationDocumentsDirectory()).path;
      // //String dir = path.dirname(file.path);
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
  }
  return imageUrl;
}

Future<File> _saveImage({
  required String url,
  required List<File> list,
}) async {
  // Download image
  final response = await http.get(Uri.parse(url));

  // Get temporary directory
  final path = (await getTemporaryDirectory()).path;

  // Create an image name
  final filename = '$path/image ${list.length + 1}.png';

  // Save to filesystem
  final file = File(filename);
  return await file.writeAsBytes(response.bodyBytes);
}

Future<File> _saveAudio({required String url, required List<File> list}) async {
  final numberFormat = NumberFormat('000', 'en_US');
  // Download image
  final response = await http.get(Uri.parse(url));
  final path = (await getTemporaryDirectory()).path;

  // Create an image name
  final filename =
      '$path/Recording_${numberFormat.format(list.length + 1)}.mp3';
  final file = File(filename);
  return await file.writeAsBytes(response.bodyBytes);
}
