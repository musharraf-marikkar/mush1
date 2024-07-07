// ignore_for_file: non_constant_identifier_names, constant_identifier_names, file_names, avoid_print, depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pentacode/API/API_SystemInit.dart';

import '../configs/CommonFunctions.dart';
import '../configs/Constants.dart';

const String BASE_URL = 'http://34.124.213.153:8010/api/v1';

//System Init URLs
const String URL_GET_MEMBER_TOKEN = "";
const String URL_GET_SETTINGS = "";

//User Init URLs
const String URL_ValidateWEBUser = "/auth/authenticate";
const String URL_RequestOTP = "/register/otp-request";
const String URL_VerifyOTP = "/register/otp-verify";
const String URL_Logout = "/register/logout";
const String URL_CHANGE_PIN = "";
const String URL_GetUserDetails = "";
const String URL_PostUserDetails = "";
const String URL_ChangePassword = "";
const String URL_ForgotPasswordRestCode = "";
const String URL_ForgotPassword = "";

const int TIME_OUT_DURATION = 50000;

Map<String, String> headerDefault = {"Content-type": "application/json"};

class ApiClient {
  //Common GET Method
  static Future<dynamic> get(String url, {bool isUserApi = false}) async {
    try {
      String accessToken = isUserApi
          ? await GetSharedPref(Constants.KEY_MENU_ACCESSTOKEN)
          : await GetSharedPref(Constants.KEY_ACCESSTOKEN);

      Map<String, String> headerToken = {
        "Content-type": "application/json",
        "Token": accessToken,
      };

      var uri = Uri.parse(BASE_URL + url);

      http.Response response = await http
          .get(uri, headers: headerToken)
          .timeout(const Duration(milliseconds: TIME_OUT_DURATION));

      print(jsonDecode(response.body));
      //If Token Expire
      if (response.statusCode == 401) {
        await API_TokenRefresh(isUserApi);

        accessToken = isUserApi
            ? await GetSharedPref(Constants.KEY_MENU_ACCESSTOKEN)
            : await GetSharedPref(Constants.KEY_ACCESSTOKEN);
        headerToken = {
          "Content-type": "application/json",
          "Token": accessToken,
        };

        response = await http
            .get(uri, headers: headerToken)
            .timeout(const Duration(milliseconds: TIME_OUT_DURATION));
      }

      return _handleResponse(response);
    } on SocketException {
      // Handle SocketException
      throw ApiConnectionException('Please check your internet connection.');
    } on TimeoutException {
      // Handle TimeoutException
      throw ApiConnectionException(
          'Connection timeout. Please try again later.');
    } catch (e) {
      // Handle other exceptions
      print('An unexpected error occurred: $e');
      throw ApiConnectionException('An unexpected error occurred');
    }
  }

  //Common POST Method
  static Future<dynamic> post(String url, payloadObj,
      {bool isMenuApi = false}) async {
    try {
      String accessToken = isMenuApi
          ? await GetSharedPref(Constants.KEY_MENU_ACCESSTOKEN)
          : await GetSharedPref(Constants.KEY_ACCESSTOKEN);

      Map<String, String> headerToken = {
        "Content-type": "application/json",
        "Authorization": "Bearer $accessToken",
      };

      var uri = Uri.parse(BASE_URL + url);
      var payload = jsonEncode(payloadObj);
      print('PayLoad :  $payload');
      http.Response response = await http
          .post(uri, body: payload, headers: headerToken)
          .timeout(const Duration(milliseconds: TIME_OUT_DURATION));

      print(response.statusCode);
      print(response.body);

      //If Token Expire
      if (response.statusCode == 401) {
        await API_TokenRefresh(isMenuApi);

        accessToken = isMenuApi
            ? await GetSharedPref(Constants.KEY_MENU_ACCESSTOKEN)
            : await GetSharedPref(Constants.KEY_ACCESSTOKEN);
        headerToken = {
          "Content-type": "application/json",
          "Token": accessToken ?? '',
        };

        response = await http
            .get(uri, headers: headerToken)
            .timeout(const Duration(milliseconds: TIME_OUT_DURATION));
      }

      return _handleResponse(response);
    } on SocketException {
      // Handle SocketException
      throw ApiConnectionException('Please check your internet connection.');
    } on TimeoutException {
      // Handle TimeoutException
      throw ApiConnectionException(
          'Connection timeout. Please try again later.');
    } catch (e) {
      // Handle other exceptions
      print('An unexpected error occurred: $e');
      throw ApiConnectionException('An unexpected error occurred');
    }
  }

  //Common  POST WITHOUT TOKEN
  static Future<dynamic> postNoToken(String url, payloadObj) async {
    try {
      var uri = Uri.parse(BASE_URL + url);
      var payload = jsonEncode(payloadObj);

      http.Response response = await http
          .post(uri, body: payload, headers: headerDefault)
          .timeout(const Duration(milliseconds: TIME_OUT_DURATION));

      print(jsonDecode(response.body));

      return _handleResponse(response);
    } on SocketException {
      // Handle SocketException
      throw ApiConnectionException('Please check your internet connection.');
    } on TimeoutException {
      // Handle TimeoutException
      throw ApiConnectionException(
          'Connection timeout. Please try again later.');
    } catch (e) {
      // Handle other exceptions
      print('An unexpected error occurred: $e');
      throw ApiConnectionException('An unexpected error occurred');
    }
  }

  //Response Handler
  static dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body);
      case 400:
        return json.decode(response.body);
      // throw BadRequestException(response.body);
      case 401:
      case 403:
        return json.decode(response.body);
      // throw UnauthorisedException(response.body);
      case 404:
        return json.decode(response.body);
      //  throw (response.body);
      default:
        return json.decode(response.body);
      // throw ServerErrorException(
      //     'Error occurred while communicating with server with status code: ${response.statusCode}');
    }
  }
}

//Exceptions : can throw exceptions for various reasons
class BadRequestException implements Exception {
  final String message;
  BadRequestException(this.message);
}

class UnauthorisedException implements Exception {
  final String message;
  UnauthorisedException(this.message);
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);
}

class ServerErrorException implements Exception {
  final String message;
  ServerErrorException(this.message);
}

class ApiConnectionException implements Exception {
  final String message;
  ApiConnectionException(this.message);
}
