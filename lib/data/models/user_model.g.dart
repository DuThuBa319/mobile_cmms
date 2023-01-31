// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      avatar: json['avatar'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      email: json['email'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('avatar', instance.avatar);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('email', instance.email);
  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('status', instance.status);
  writeNotNull('dob', instance.dob?.toIso8601String());
  return val;
}
