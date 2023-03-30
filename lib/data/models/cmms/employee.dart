import 'package:json_annotation/json_annotation.dart';
part 'employee.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Employee {
  String? id;
  String? name;
  Employee({
    this.id,
    this.name,
  });
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
