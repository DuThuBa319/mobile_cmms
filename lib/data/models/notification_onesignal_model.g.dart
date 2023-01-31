// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_onesignal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as String?,
      data: json['data'] == null
          ? null
          : NotificationMetadata.fromJson(json['data'] as Map<String, dynamic>),
      contents: json['contents'] == null
          ? null
          : LocalizationModel.fromJson(
              json['contents'] as Map<String, dynamic>),
      subjectType: json['subject_type'] as String?,
      sendAfter: json['send_after'] == null
          ? null
          : DateTime.parse(json['send_after'] as String),
      read: json['read'] as bool?,
    )..subjectId = json['subject_id'] as String?;

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('data', instance.data?.toJson());
  writeNotNull('contents', instance.contents?.toJson());
  writeNotNull('subject_type', instance.subjectType);
  writeNotNull('subject_id', instance.subjectId);
  writeNotNull('send_after', instance.sendAfter?.toIso8601String());
  writeNotNull('read', instance.read);
  return val;
}

NotificationMetadata _$NotificationMetadataFromJson(
        Map<String, dynamic> json) =>
    NotificationMetadata();

Map<String, dynamic> _$NotificationMetadataToJson(
        NotificationMetadata instance) =>
    <String, dynamic>{};
