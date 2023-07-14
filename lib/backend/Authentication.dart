import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authentication {

  var ipAdd = 'http://192.168.1.9:3000/api/v4/';

  login(String email, String password) async {
    Map getapiData = {};
    getapiData['email'] = email;
    getapiData['password'] = password;
    var loginData = await _performHttpRequest(
        'POST', 'auth/login', getapiData);
    return loginData;
  }

  register(String name, String email, String password, String phone, String cnfPassword) async {
    Map getapiData = {};
    getapiData['name'] = name;
    getapiData['email'] = email;
    getapiData['password'] = password;
    getapiData['phone'] = phone;
    getapiData['cnfPassword'] = cnfPassword;
    var loginData = await _performHttpRequest(
        'POST', 'auth/register', getapiData);
    return loginData;
  }

  _performHttpRequest(String apiReq, String endUrl, Map getapidata) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(apiReq, Uri.parse('$ipAdd$endUrl'));
    request.body = json.encode(getapidata);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var datafinal = await response.stream.bytesToString();
    var data = jsonDecode(datafinal);
    if (data['success'] == true) {
      return data;
    } else if (response.statusCode >= 400) {

      print('Bad data: $data');

      return data;
    }
  }

}