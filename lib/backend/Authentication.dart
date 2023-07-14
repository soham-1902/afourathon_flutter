import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DriversBackend {

  var ipAdd = 'http://192.168.1.9:3000/api/v4/';

  login() async {
    Map getapiData = {};
    var driversData = await _performHttpRequest(
        'GET', 'auth/login', getapiData);
    return driversData;
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
      Fluttertoast.showToast(
          msg: "Something went wrong!\nPlease contact your admin",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      return {};
    }
  }

}