import 'package:afourathon_flutter/backend/CabsBackend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:afourathon_flutter/backend/DriversBackend.dart';
import '../../widgets/CommonWidgets.dart';

class CabDetails extends StatefulWidget {
  final String cabRegistrationNumber;
  final String cabModel;
  final String cabColour;
  final String isDriverAssigned;

  const CabDetails({Key? key, required this.cabRegistrationNumber, required this.cabModel, required this.cabColour, required this.isDriverAssigned}) : super(key: key);

  @override
  State<CabDetails> createState() => _CabDetailsState();
}

class _CabDetailsState extends State<CabDetails> {

  Future<dynamic>? allDriversData;
  Future<dynamic>? resultOfAssign;

  String _dropDownValue = "Select Driver";

  Map<String, String> driverPhoneAndId = {};

  getAllDrivers() async {
    DriversBackend cabsBackend = DriversBackend();

    var data = await cabsBackend.getAllDrivers();
    bool? status = data['success'];
    if (status == true) {
      setState(() {
        allDriversData = Future<dynamic>.value(data['data']);
      });
    }
  }

  assignDriver() async {
    CabsBackend cabsBackend = CabsBackend();

    var data = await cabsBackend.assignDriverToCab(driverPhoneAndId[_dropDownValue]!, widget.cabRegistrationNumber);

    if (data['success'] == true) {
      Get.back();
      Get.snackbar('Success', data['message']);
    } else {
      Get.snackbar('Error', data['message']);
    }
  }

  late TextEditingController cabRegistrationNumberTec;
  late TextEditingController cabModelTec;
  late TextEditingController cabColourTec;
  late TextEditingController isAssignedTec;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cabRegistrationNumberTec = TextEditingController(text: widget.cabRegistrationNumber);
    cabModelTec = TextEditingController(text: widget.cabModel);
    cabColourTec = TextEditingController(text: widget.cabColour);
    isAssignedTec = TextEditingController(text: widget.isDriverAssigned);

    getAllDrivers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      'assets/back.svg',
                    ),
                  ),
                  SizedBox(height:20,),
                  Text(
                    'Cab details',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4F200D)),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 8,
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Cab Registration Number',
                          ),
                          controller: cabRegistrationNumberTec,
                          style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Color.fromRGBO(20, 20, 20, 0.37),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 8,
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Cab Model',
                          ),
                          controller: cabModelTec,
                          style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Color.fromRGBO(20, 20, 20, 0.37),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 8,
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Cab Colour',
                          ),
                          controller: cabColourTec,
                          style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Color.fromRGBO(20, 20, 20, 0.37),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 8,
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Driver Assigned',
                          ),
                          controller: isAssignedTec,
                          style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Color.fromRGBO(20, 20, 20, 0.37),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  FutureBuilder(
                      future: allDriversData,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData) {
                          List<dynamic> driverDataList = snapshot.data;


                          List<DropdownMenuItem<Object>> dropdownItems = driverDataList.map((item) {

                            driverPhoneAndId[item['driverPhone']] = item['driverId'];

                            return DropdownMenuItem<String>(
                              value: item['driverPhone'],
                              child: Text(
                                item['driverPhone'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat-Regular',
                                ),
                              ),
                            );
                          }).toList();

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: SizedBox(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromRGBO(255, 132, 0, 0.08)),
                                child: DropdownButton(
                                  menuMaxHeight: 400,
                                  borderRadius: BorderRadius.circular(20),
                                  hint: _dropDownValue == null
                                      ? Text('Vendor Name')
                                      : Text(
                                    _dropDownValue,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat-Regular',
                                    ),
                                  ),
                                  isExpanded: true,
                                  iconSize: 30.0,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat-Regular',
                                      color: Colors.black),
                                  items: dropdownItems,
                                  onChanged: (val) {
                                    setState(
                                          () {
                                        _dropDownValue = val! as String;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      }
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: MainOrangeButton(
                    initialTitle: 'Save',
                    onPressed: () async {
                      await assignDriver();
                    },
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

