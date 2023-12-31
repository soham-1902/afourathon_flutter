import 'package:http/http.dart' as http;
import 'dart:convert';

class DriversBackend {

  var ipAdd = 'http://192.168.1.9:3000/api/v4/';

  createDriver(String driverName, String driverEmail, String driverPhone) async {
    Map getapiData = {};
    getapiData['driverName'] = driverName;
    getapiData['driverEmail'] = driverEmail;
    getapiData['driverPhone'] = driverPhone;
    var driverData = await _performHttpRequest(
        'POST', 'driver/add_driver', getapiData
    );

    return driverData;
  }

  assignCabToDriver(String driverId, String assignedCab) async {
    Map getapiData = {};
    var driverData = await _performHttpRequest(
        'PUT', 'driver/assign_cab/$driverId/$assignedCab', getapiData
    );

    return driverData;
  }


  getAllDrivers() async {
    Map getapiData = {};
    var driversData = await _performHttpRequest(
        'GET', 'driver/get_all_drivers', getapiData);
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
      return data;
    }
  }

}