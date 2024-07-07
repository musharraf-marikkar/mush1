//Dinuranga - 22/12/08 -  Table cross axisCount
// ignore_for_file: non_constant_identifier_names, avoid_print, file_names, depend_on_referenced_packages

import 'package:shared_preferences/shared_preferences.dart';
import 'common_Exports.dart';

getCrossAxisCount(BuildContext context) {
  int width = MediaQuery.of(context).size.width.round();
  print(width);
  if (width < 500) {
    return 2;
  } else if (width >= 500 && width < 700) {
    return 3;
  } else if (width >= 700 && width < 900) {
    return 4;
  } else if (width >= 900) {
    return 5;
  }
}

// Get Shared Pref Values
dynamic GetSharedPref(String key) async {
  try {
    final pref = await SharedPreferences.getInstance();
    return pref.get(key) ?? '';
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [CommonFunctions] - GetSharedPref() $e ');
  }
}

// Set Shared Pref Values
dynamic SetSharedPref(int Type, dynKeyName, dynValue) async {
  final pref = await SharedPreferences.getInstance();
  try {
    switch (Type) {
      case 1: //set String
        pref.setString(dynKeyName, dynValue);
        break;
      case 2: //set int
        pref.setInt(dynKeyName, dynValue);
        break;
      case 3: //set bool
        pref.setBool(dynKeyName, dynValue);
    }
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [CommonFunctions] - SetSharedPref() $e ');
  }

  return;
}

dynamic RemoveSharedPref(String key) async {
  try {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [CommonFunctions] - RemoveSharedPref() $e ');
  }
}
