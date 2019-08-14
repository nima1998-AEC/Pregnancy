import 'package:pregnancy_app/Model/MotherPropoerties.dart';
import 'package:pregnancy_app/Source/LoadingFunctions.dart';

dynamic calculationBmi(String heightValue, String weightValue) {
  double _bmi = (double.parse(weightValue)) /
      (double.parse(heightValue) * double.parse(heightValue));
  String _bmiStatus;
  if (_bmi < 20)
    _bmiStatus = 'کسر وزن';
  else if (_bmi >= 20 && _bmi < 25)
    _bmiStatus = 'وزن نرمال';
  else if (_bmi >= 25 && _bmi < 27)
    _bmiStatus = 'اضافه وزن';
  else if (_bmi >= 27) _bmiStatus = 'چاق';

  return [_bmi.toStringAsFixed(2).toString(), _bmiStatus];
}

bool heightValidation(String heightValue) {
  bool _valid;
  if (heightValue.isNotEmpty) {
    _valid = true;
  } else {
    _valid = false;
  }
  return _valid;
}

bool weightValidation(String weightValue) {
  bool _valid;
  if (weightValue.isNotEmpty) {
    _valid = true;
  } else {
    _valid = false;
  }
  return _valid;
}

dynamic setProfileData() {
  MotherProperties _motherProperties;
  loadProfileData().then((motherProperties) {
    return _motherProperties;
  });
}

bool validation(String nameValue, String ageValue, String heightValue,
    String weightValue, String dateValue, String numberValue) {
  bool _valid;
  if (nameValue.isEmpty ||
      ageValue.isEmpty ||
      heightValue.isEmpty ||
      weightValue.isEmpty ||
      dateValue.isEmpty ||
      numberValue.isEmpty) {
    _valid = false;
  } else {
    _valid = true;
  }

  return _valid;
}
