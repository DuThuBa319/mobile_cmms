// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['personId'] as String?,
      name: json['personName'] as String?,
      scheduleWorkingTimes: (json['scheduleWorkingTimes'] as List<dynamic>?)
          ?.map((e) => WorkingTime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('personId', instance.id);
  writeNotNull('personName', instance.name);
  writeNotNull('scheduleWorkingTimes',
      instance.scheduleWorkingTimes?.map((e) => e.toJson()).toList());
  return val;
}
