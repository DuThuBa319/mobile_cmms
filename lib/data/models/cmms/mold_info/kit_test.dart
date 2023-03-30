import 'package:json_annotation/json_annotation.dart';
part 'kit_test.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class KitTest {
  String? code;
  String? name;
  KitTest({
    this.code,
    this.name,
  });
  factory KitTest.fromJson(Map<String, dynamic> json) =>
      _$KitTestFromJson(json);

  Map<String, dynamic> toJson() => _$KitTestToJson(this);
}
