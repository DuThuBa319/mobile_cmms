import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/cmms/employee_entity.dart';
import '../working_time.dart';

part 'employee.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Employee {
  @JsonKey(name: 'personId')
  String? id;
  @JsonKey(name: 'personName')
  String? name;
  List<WorkingTime>? scheduleWorkingTimes;
  Employee({
    this.id,
    this.name,
    this.scheduleWorkingTimes,
  });
  List<EmployeeEntity> getListEmployeeEntity({
    required List<EmployeeEntity> list,
  }) {
    final result = EmployeeEntity(
      personId: id,
      personName: name,
    );
    list.add(result);

    return list;
  }

  EmployeeEntity getEmployeeEntity() {
    return EmployeeEntity(
      personId: id,
      personName: name,
    );
  }

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
