// ignore_for_file: non_constant_identifier_names, avoid_print, file_names
import '../configs/CommonFunctions.dart';
import '../configs/Constants.dart';
import 'API_Client.dart';

//Done by Pabodha
API_LoginVerify(bool IsAutoLogin, String strUserName, String strPassword,
    Function callback) async {
  try {
    var loginVerification = URL_ValidateWEBUser;
    var response = await ApiClient.post(
            loginVerification, {"email": strUserName, "password": strPassword})
        .catchError((onError) {
      callback(false, null, onError.message.toString());
      print(onError.message.toString());
    });

    if (response != null) {
      if (response['statusCode'] == 'S1000') {
        if (response['statusDetails'].isNotEmpty) {
          callback(true, response, response['statusDetails'].toString());
        } else {
          callback(false, null, 'Data Not Available');
        }
      } else {
        callback(false, response, response['statusDetails'].toString());
      }
    }
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [API_UserInit] - API_LoginVerify() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}

API_Logout(Function callback) async {
  try {
    var response = await ApiClient.post(URL_Logout, {}).catchError((onError) {
      callback(false, null, onError.message.toString());
      print(onError.message.toString());
    });

    if (response != null) {
      if (response['statusCode'] == 'S1000') {
        if (response['statusDetails'].isNotEmpty) {
          callback(true, response, response['statusDetails'].toString());
        } else {
          callback(false, null, 'Data Not Available');
        }
      } else {
        callback(false, response, response['statusDetails'].toString());
      }
    }
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [API_UserInit] - API_LoginVerify() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}

API_RegisterUser(
    String firstName,
    String lastName,
    String email,
    String password,
    String mobileNumber,
    String dob,
    String gender,
    String role,
    Function callback) async {
  try {
    var requestOTP = URL_RequestOTP;
    var response = await ApiClient.post(requestOTP, {
      "firstname": firstName,
      "lastname": lastName,
      "email": email,
      "password": password,
      "mobileNumber": mobileNumber,
      "dateOfBirth": dob,
      "gender": gender.toUpperCase(),
      "role": role.toUpperCase(),
    }).catchError((onError) {
      callback(false, null, onError.message.toString());
      print(onError.message.toString());
    });

    if (response != null) {
      if (response['statusCode'] == 'S1000') {
        if (response['statusDetails'].isNotEmpty) {
          callback(true, response, response['statusDetails'].toString());
        } else {
          callback(false, null, 'Data Not Available');
        }
      } else {
        callback(false, response, response['statusDetails'].toString());
      }
    }
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [API_UserInit] - API_LoginVerify() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}

API_VerifyOTP(String email, String otp, Function callback) async {
  try {
    var response = await ApiClient.post(URL_VerifyOTP, {
      "email": email,
      "otp": otp,
    }).catchError((onError) {
      callback(false, null, onError.message.toString());
      print(onError.message.toString());
    });

    if (response != null) {
      if (response['statusCode'] == 'S1000') {
        if (response['statusDetails'].isNotEmpty) {
          callback(true, response, response['statusDetails'].toString());
        } else {
          callback(false, null, 'Data Not Available');
        }
      } else {
        callback(false, response, response['statusDetails'].toString());
      }
    }
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [API_UserInit] - API_LoginVerify() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}

API_GetUserDetails(Function callback) async {
  try {
    var MemberCode = await GetSharedPref(Constants.KEY_MEMBERCODE);
    var MemberId = await GetSharedPref(Constants.KEY_MEMBERID);

    var URL =
        "$URL_GetUserDetails?MemberCode=$MemberCode&MemberId=${MemberId.toString()}";
    var response = await ApiClient.get(URL);

    if (response != null) {
      if (response['statusCode'] == 200) {
        if (response['Data'] != null && response['Data'].isNotEmpty) {
          callback(true, response['Data'], response['Msg'].toString());
        } else {
          callback(false, null, 'Data Not Available');
        }
      } else {
        callback(false, null, response['Msg'].toString());
      }
    }
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [API_UserInit] - API_GetUserDetails() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}

API_UpdateUserDetails(
    Map<String, dynamic> payloadObj, Function callback) async {
  try {
    var response = await ApiClient.post(URL_PostUserDetails, payloadObj)
        .catchError((onError) {
      callback(false, null, onError.toString());
      print(onError.toString());
    });

    if (response != null) {
      if (response['statusCode'] == 200) {
        callback(true, [], response['Msg'].toString());
      } else {
        callback(false, response, response['Msg'].toString());
      }
    }
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [API_UserInit] - API_PostUserDetails() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}

API_ChangePassword(
    String strCurrentPassword, String strNewPassword, Function callback) async {
  try {
    var MemberCode = await GetSharedPref(Constants.KEY_MEMBERCODE);
    var MemberId = await GetSharedPref(Constants.KEY_MEMBERID);

    print('Changing Password..');

    var change_password =
        "$URL_ChangePassword?CurrentPassword=$strCurrentPassword&NewPassword=$strNewPassword&MemberCode=$MemberCode&MemberId=${MemberId.toString()}";

    var response = await ApiClient.get(change_password).catchError((onError) {
      print(onError.message.toString());
      callback(false, null, onError.message.toString());
    });

    if (response != null) {
      if (response['statusCode'] == 200) {
        if (response['Data'] != null || response['Data'].isNotEmpty) {
          callback(true, response['Data'], response['Msg'].toString());
        } else {
          callback(false, response['Data'], 'Data not available');
        }
      } else {
        callback(false, response, response['Msg'].toString());
      }
    }
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [API_UserInit] - API_ChangePassword() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}

//Done by Pabodha
API_ResetPin(String strCurrentPin, String strNewPin, Function callback) async {
  try {
    print('Changing Pin..');

    var MemberCode = await GetSharedPref(Constants.KEY_MEMBERCODE);
    var MemberId = await GetSharedPref(Constants.KEY_MEMBERID);

    var url =
        "$URL_CHANGE_PIN?Password=$strCurrentPin&NewPin=$strNewPin&MemberCode=$MemberCode&MemberId=${MemberId.toString()}";

    var response = await ApiClient.get(url).catchError((onError) {
      print(onError.message.toString());

      callback(false, null, onError.message.toString());
    });

    if (response != null) {
      if (response['statusCode'] == 200) {
        if (response['Data'] != null || response['Data'].isNotEmpty) {
          callback(true, response['Data'], response['Msg'].toString());
        } else {
          callback(false, null, 'Data Not Available');
        }
      } else {
        callback(false, response, response['Msg'].toString());
      }
    }
  } catch (e) {
    print('======== EXCEPTION =====> \n [API_UserInit] - API_ResetPin() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}

//Done by Pabodha
API_ForgotPasswordRequestCode(
    String strUserName, String strCurrentPin, Function callback) async {
  try {
    var requestCode =
        "$URL_ForgotPasswordRestCode?Pin=$strCurrentPin&MemberCode=$strUserName&MemberId=0";
    var response = await ApiClient.get(requestCode).catchError((onError) {
      print(onError.message.toString());
      callback(false, null, onError.message.toString());
    });

    if (response != null) {
      if (response['statusCode'] == 200) {
        callback(true, response['Data'], response['Msg'].toString());
      } else {
        callback(false, response, response['Msg'].toString());
      }
    }
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [API_UserInit] - API_ForgotPasswordRequestCode() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}

//Done by Randima
API_ForgotPasswordReset(String strUserName, String strResetCode,
    String strNewPassword, Function callback) async {
  try {
    var forgotPassword =
        "$URL_ForgotPassword?MemberCode=$strUserName&resetCode=$strResetCode&Pin=0&NewPassword=$strNewPassword";
    var response = await ApiClient.get(forgotPassword).catchError((onError) {
      callback(false, null, onError.message.toString());
      print(onError.message.toString());
    });

    if (response != null) {
      if (response['statusCode'] == 200) {
        if (response['Data'] != null || response['Data'].isNotEmpty) {
          callback(true, response['Data'], response['Msg'].toString());
        } else {
          callback(false, null, 'Data Not Available');
        }
      } else {
        callback(false, response, response['Msg'].toString());
      }
    }
  } catch (e) {
    print(
        '======== EXCEPTION =====> \n [API_UserInit] - API_ForgotPasswordReset() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}
