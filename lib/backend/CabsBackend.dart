import 'package:http/http.dart' as http;
import 'dart:convert';

class CabsBackend {

  var ipAdd = 'http://192.168.1.9:3000/api/v4/';

  createCab(String cabRegistrationNumber, String cabModel, String cabColour) async {
    Map getapiData = {};
    getapiData['cabRegistrationNumber'] = cabRegistrationNumber;
    getapiData['cabModel'] = cabModel;
    getapiData['cabColour'] = cabColour;
    var cabData = await _performHttpRequest(
        'POST', 'cab/add_cab', getapiData
    );

    return cabData;
  }

  assignCabToDriver(String driverId, ) async {
    Map getapiData = {};
    var driverData = await _performHttpRequest(
        'PUT', 'driver/add_driver', getapiData
    );

    return driverData;
  }

  getAllCabs() async {
    Map getapiData = {};
    var cabsData = await _performHttpRequest(
        'GET', 'cab/get_all_cabs', getapiData);
    return cabsData;
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