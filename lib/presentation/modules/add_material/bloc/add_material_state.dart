part of 'add_material_bloc.dart';

// ViewModel is used for store all properties which want to be stored, processed and updated

class _ViewModel {
  final String? sku;
  final String? selectedCode;
  final String? selectedMaterialInfoId;
  final String? name;
  final double? quantity;
  final List<String>? listCode;
  final List<MaterialInfoEntity>? listMaterialInfoEntity;
  final MaterialStatus? selectedStatus;
  final bool? isFinished;

  const _ViewModel({
    this.selectedCode,
    this.listCode,
    this.selectedMaterialInfoId,
    this.listMaterialInfoEntity,
    this.name,
    this.quantity,
    this.sku,
    this.selectedStatus,
    this.isFinished,
  });

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  _ViewModel copyWith({
    String? sku,
    String? selectedCode,
    String? name,
    double? quantity,
    List<String>? listCode,
    List<MaterialInfoEntity>? listMaterialInfoEntity,
    MaterialStatus? selectedStatus,
    bool? isFinished,
    String? selectedMaterialInfoId,
  }) {
    return _ViewModel(
      sku: sku ?? this.sku,
      selectedCode: selectedCode ?? this.selectedCode,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      listCode: listCode ?? this.listCode,
      listMaterialInfoEntity:
          listMaterialInfoEntity ?? this.listMaterialInfoEntity,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      isFinished: isFinished ?? this.isFinished,
      selectedMaterialInfoId:
          selectedMaterialInfoId ?? this.selectedMaterialInfoId,
    );
  }
}

// Abstract class
abstract class AddMaterialState {
  final _ViewModel viewModel;
  // Status of the state. Schedule "success" "failed" "loading"
  final BlocStatusState status;

  AddMaterialState(this.viewModel, {this.status = BlocStatusState.initial});

  // Using copyWith function to retains the before data and just "update some specific props" instead of "update all props"
  // "T" is generic class. "T" is a child class of AddMaterialState (abstract class)
  T copyWith<T extends AddMaterialState>({
    _ViewModel? viewModel,
    required BlocStatusState status,
  }) {
    return _factories[T == AddMaterialState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
      status,
    );
  }
}

class AddMaterialInitialState extends AddMaterialState {
  AddMaterialInitialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel);
}

class GetMaterialInfoCodeState extends AddMaterialState {
  GetMaterialInfoCodeState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class GetMaterialInfoNameState extends AddMaterialState {
  GetMaterialInfoNameState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class ChangeStatusState extends AddMaterialState {
  ChangeStatusState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

class CreateMaterialState extends AddMaterialState {
  CreateMaterialState({
    _ViewModel viewModel = const _ViewModel(),
    BlocStatusState status = BlocStatusState.initial,
  }) : super(viewModel, status: status);
}

final _factories = <
    Type,
    Function(
  _ViewModel viewModel,
  BlocStatusState status,
)>{
  AddMaterialInitialState: (viewModel, status) => AddMaterialInitialState(
        viewModel: viewModel,
        status: status,
      ),
  GetMaterialInfoCodeState: (viewModel, status) => GetMaterialInfoCodeState(
        viewModel: viewModel,
        status: status,
      ),
  GetMaterialInfoNameState: (viewModel, status) => GetMaterialInfoNameState(
        viewModel: viewModel,
        status: status,
      ),
  ChangeStatusState: (viewModel, status) => ChangeStatusState(
        viewModel: viewModel,
        status: status,
      ),
  CreateMaterialState: (viewModel, status) => CreateMaterialState(
        viewModel: viewModel,
        status: status,
      ),
};
