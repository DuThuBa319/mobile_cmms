part of 'add_material_bloc.dart';

@immutable
abstract class AddMaterialEvent {}

class GetMaterialInfoCodeEvent extends AddMaterialEvent {
  GetMaterialInfoCodeEvent({this.sku});
  final String? sku;
}

class GetMaterialInfoNameEvent extends AddMaterialEvent {
  GetMaterialInfoNameEvent({this.selectedCode});

  final String? selectedCode;
}

class ChangeStatusEvent extends AddMaterialEvent {
  ChangeStatusEvent({this.selectedStatus});
  final MaterialStatus? selectedStatus;
}

class CreateMaterialEvent extends AddMaterialEvent {
  CreateMaterialEvent({this.sku});
  final String? sku;
}
