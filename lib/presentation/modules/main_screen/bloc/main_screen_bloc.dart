import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/cmms/maintenance_response_entity.dart';

import '../../../base/base.dart';
import '../../../base/state_base/bloc_status_state.dart';
import '../repository/main_screen_repository.dart';
import '../usecase/main_screen_usecase.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

@injectable
class MainScreenBloc extends AppBlocBase<MainScreenEvent, MainScreenState> {
  final MainScreenUsecase _usecase;
  final MainScreenRepository _repository;

  MainScreenBloc(this._usecase, this._repository)
      : super(MainScreenInitialState()) {
    on<GetListMaintenanceResponsesEvent>(_onGetListMaintenanceResponses);
  }

  Future<void> _onGetListMaintenanceResponses(
    GetListMaintenanceResponsesEvent event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(
      MainScreenGetResponseState(
        status: BlocStatusState.loading,
        viewModel: state.viewModel,
      ),
    );
    try {
      final response = await _usecase.getListMaintenanceResponse();
      final newViewModel = state.viewModel.copyWith(responses: response);
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
