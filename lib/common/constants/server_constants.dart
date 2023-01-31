part of '../constants.dart';

class ServerGender {
  static const String male = 'male';
  static const String female = 'female';
  static const String other = 'other';
}

class ServerErrorCode {
  static const String invalidToken = 'invalid_token';
  static const String userNotFound = 'user_not_found';
}

enum Gender {
  @JsonValue(ServerGender.male)
  male,
  @JsonValue(ServerGender.female)
  female,
  @JsonValue(ServerGender.other)
  other,
}
