part of 'pick_gender_widget.dart';

class GenderPickProperties {
  int value;

  bool get isMale => value == Gender.male.index;
  bool get isFemale => value == Gender.female.index;
  bool get isOther => value == Gender.other.index;

  GenderPickProperties({this.value = 0});
}

class PickGenderController extends ValueNotifier<GenderPickProperties> {
  PickGenderController({GenderPickProperties? value})
      : super(value ?? GenderPickProperties());

  void setValue(int data) {
    value.value = data;
    notifyListeners();
  }

  void setValueFromString(String data) {
    switch (data) {
      case ServerGender.male:
        value.value = Gender.male.index;
        break;
      case ServerGender.female:
        value.value = Gender.female.index;
        break;
      case ServerGender.other:
        value.value = Gender.other.index;
        break;
    }

    notifyListeners();
  }

  int get selectedValue => value.value;

  String? get serverValue {
    if (value.value == Gender.male.index) {
      return ServerGender.male;
    }

    if (value.value == Gender.female.index) {
      return ServerGender.female;
    }

    if (value.value == Gender.other.index) {
      return ServerGender.other;
    }

    return '';
  }
}
