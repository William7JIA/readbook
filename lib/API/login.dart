import 'dart:convert';
import 'dart:io';

import 'package:argon_flutter/models/User.dart';
import 'package:argon_flutter/models/catchLogin.dart';
import 'package:http/http.dart' as http;

var _baseApiUrl =
    Uri.parse('https://restfull-tokobuku.herokuapp.com/API/auth/');
var header = {'authorization': 'naklupak123'};

Future<ApiResponse> authenticateUser(String username, String password) async {
  ApiResponse _apiResponse = new ApiResponse();

  try {
    final response = await http.post(_baseApiUrl, body: {
      'username': username,
      'password': password,
    });

    switch (response.statusCode) {
      case 200:
        _apiResponse.Data = User.fromJson(json.decode(response.body));
        break;
      case 401:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return _apiResponse;
}
