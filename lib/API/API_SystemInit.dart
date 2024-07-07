//get_Token
// ignore_for_file: non_constant_identifier_names, avoid_print, file_names

import 'dart:convert';


import '../configs/CommonFunctions.dart';
import '../configs/Constants.dart';
import 'API_Client.dart';


//Token for Member related API
API_GetToken(String strUsername, String strPassword, Function callback) async {
  try {
    print('Getting Token..');

    Map<String, String>? data = {
      "UserName": strUsername,
      "Password": strPassword
    };
    var response = await ApiClient.postNoToken(
      URL_GET_MEMBER_TOKEN,
      data,
    ).catchError((onError) {
      print(onError.message.toString());

      callback(false, null, onError.message.toString());
    });

    if (response != null) {
      if (response['statusCode'] == 200) {
        callback(true, response,  response['Msg'].toString());
      } else {
        callback(false, response, response['Msg'].toString());
      }
    }
  } catch (e) {
    print('======== EXCEPTION =====> \n [API_SystemInit] - API_GetToken() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}

API_GetSettings( Function callback) async {
  try {
    print('Start Get Settings Check..');

 
    var response = await ApiClient.get(
      URL_GET_SETTINGS,
   
    ).catchError((onError) {
      print(onError.message.toString());

      callback(false, null, onError.message.toString());
    });

    if (response != null) {
      if (response['statusCode'] == 200) {
        callback(true, response,  response['Msg'].toString());
      } else {
        callback(false, response, response['Msg'].toString());
      }
    }
  } catch (e) {
    print('======== EXCEPTION =====> \n [API_SystemInit] - API_GetToken() $e ');
    callback(false, null, 'An unexpected error occurred');
  }
}

//Refresh  Access Token
API_TokenRefresh(bool isMenuToken) async {
  try {
    var strAccessToken = isMenuToken
        ? await GetSharedPref(Constants.KEY_MENU_ACCESSTOKEN)
        : await GetSharedPref(Constants.KEY_ACCESSTOKEN);
    var strRefreshToken = isMenuToken
        ? await GetSharedPref(Constants.KEY_MENU_REFRESHTOKEN)
        : await GetSharedPref(Constants.KEY_REFRESHTOKEN);

    Map<String, String>? data = {
      "AccessToken": strAccessToken,
      "RefreshToken": strRefreshToken
    };

    // String TokenUrl =
    //     isMenuToken ? URL_REFRESH_MENU_TOKEN : URL_REFRESH_MEMBER_TOKEN;

    var response = await ApiClient.postNoToken(
     "",
      data,
    ).catchError((onError) {
      print(onError.message.toString());
    });

    if (response != null) {
    

      await SetSharedPref(
          1,
          isMenuToken
              ? Constants.KEY_MENU_ACCESSTOKEN
              : Constants.KEY_ACCESSTOKEN,
          response["accessToken"]);
      await SetSharedPref(
          1,
          isMenuToken
              ? Constants.KEY_MENU_REFRESHTOKEN
              : Constants.KEY_REFRESHTOKEN,
          response["RefreshToken"]);
    }
  } catch (e) {
    // ShowDialog('Token Refresh Failed');
  }
}
