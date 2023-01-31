import 'package:json_annotation/json_annotation.dart';

import 'localization_model.dart';

part 'notification_onesignal_model.g.dart';

@JsonSerializable()
class NotificationModel {
  String? id;
  NotificationMetadata? data;
  LocalizationModel? contents;
  @JsonKey(name: 'subject_type')
  String? subjectType;
  @JsonKey(name: 'subject_id')
  String? subjectId;
  @JsonKey(name: 'send_after')
  DateTime? sendAfter;
  bool? read;

  NotificationModel({
    this.id,
    this.data,
    this.contents,
    this.subjectType,
    this.sendAfter,
    this.read,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

@JsonSerializable()
class NotificationMetadata {
  NotificationMetadata();

  factory NotificationMetadata.fromJson(Map<String, dynamic> json) =>
      _$NotificationMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationMetadataToJson(this);
}
