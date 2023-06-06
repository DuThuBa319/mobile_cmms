import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/cmms/cmms_enum.dart';
import '../../../../data/models/cmms/post/create_material.dart';
import '../../../../domain/entities/cmms/material_info_entity.dart';
import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../usecase/add_material_usecase.dart';

part 'add_material_event.dart';
part 'add_material_state.dart';

@injectable
class AddMaterialBloc extends AppBlocBase<AddMaterialEvent, AddMaterialState> {
  final AddMaterialUsecase _usecase;

  AddMaterialBloc(this._usecase) : super(AddMaterialInitialState()) {
    on<GetMaterialInfoCodeEvent>(_onGetMaterialInfoCodeCode);
    on<GetMaterialInfoNameEvent>(_onGetMaterialInfoName);
    on<ChangeStatusEvent>(_onChangeStatus);
    on<CreateMaterialEvent>(_onCreateMaterial);
  }
  Future<void> _onGetMaterialInfoCodeCode(
    GetMaterialInfoCodeEvent event,
    Emitter<AddMaterialState> emit,
  ) async {
    emit(
      GetMaterialInfoCodeState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final responses = await _usecase.getListMaterialInfo();
      final listMaterialInfoCode = <String>[];

      if (responses != null) {
        for (final response in responses) {
          listMaterialInfoCode.add(response.code!);
        }
      }
      final newViewModel = state.viewModel.copyWith(
        sku: event.sku,
        listCode: listMaterialInfoCode,
        listMaterialInfoEntity: responses,
      );
      emit(
        GetMaterialInfoCodeState(
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

  Future<void> _onGetMaterialInfoName(
    GetMaterialInfoNameEvent event,
    Emitter<AddMaterialState> emit,
  ) async {
    emit(
      GetMaterialInfoNameState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      var newViewModel = state.viewModel;
      if (event.selectedCode == '<Chọn loại vật tư>') {
        newViewModel = state.viewModel.copyWith(
          name: '--',
          quantity: 0,
          selectedCode: '<Chọn loại vật tư>',
          isFinished: false,
        );
      } else {
        String? name = '--';
        double? quantity = 0;
        String? id = '--';
        for (var i = 0;
            i <= state.viewModel.listMaterialInfoEntity!.length;
            i++) {
          if (event.selectedCode ==
              state.viewModel.listMaterialInfoEntity?[i].code) {
            name = state.viewModel.listMaterialInfoEntity?[i].name;
            quantity =
                state.viewModel.listMaterialInfoEntity?[i].minimumQuantity;
            id = state.viewModel.listMaterialInfoEntity?[i].materialInforId;
            break;
          }
        }

        newViewModel = state.viewModel.copyWith(
          name: name,
          quantity: quantity,
          selectedCode: event.selectedCode,
          isFinished: state.viewModel.selectedStatus != null ? true : false,
          selectedMaterialInfoId: id,
        );
      }

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

  Future<void> _onChangeStatus(
    ChangeStatusEvent event,
    Emitter<AddMaterialState> emit,
  ) async {
    emit(
      ChangeStatusState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final newViewModel = state.viewModel.copyWith(
        selectedStatus: event.selectedStatus,
        isFinished: event.selectedStatus != null &&
                state.viewModel.selectedCode != '<Chọn loại vật tư>'
            ? true
            : false,
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

  Future<void> _onCreateMaterial(
    CreateMaterialEvent event,
    Emitter<AddMaterialState> emit,
  ) async {
    emit(
      CreateMaterialState(
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
      final material = CreateMaterial(
        materialInfor: state.viewModel.selectedMaterialInfoId,
        sku: state.viewModel.sku,
        status: state.viewModel.selectedStatus,
      );
      await _usecase.createMaterial(
        createMaterial: material,
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
}
