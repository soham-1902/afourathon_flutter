import 'package:afourathon_flutter/backend/CabsBackend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:afourathon_flutter/backend/DriversBackend.dart';
import '../../widgets/CommonWidgets.dart';

class DriverDetails extends StatefulWidget {
  final String driverId;
  final String driverName;
  final String driverEmail;
  final String driverPhone;
  final String assignedCab;

  const DriverDetails({Key? key, required this.driverId, required this.driverName, required this.driverEmail, required this.driverPhone, required this.assignedCab}) : super(key: key);

  @override
  State<DriverDetails> createState() => _DriverDetailsState();
}

class _DriverDetailsState extends State<DriverDetails> {

  late TextEditingController driverNameTec;
  late TextEditingController driverEmailTec;
  late TextEditingController driverPhoneTec;
  late TextEditingController assignedCabTec;

  Future<dynamic>? allCabsData;
  Future<dynamic>? resultOfAssignCab;

  String _dropDownValue = "Select Cab";

  getAllCabs() async {
    CabsBackend cabsBackend = CabsBackend();

    var data = await cabsBackend.getAllCabs();
    bool? status = data['success'];
    if (status == true) {
      setState(() {
        allCabsData = Future<dynamic>.value(data['data']);
      });
    }
  }

  assignCab() async {
    DriversBackend driversBackend = DriversBackend();

    var data = await driversBackend.assignCabToDriver(widget.driverId, _dropDownValue);

    if (data['success'] == true) {
      Get.back();
      Get.snackbar('Success', data['message']);
    } else {
      Get.snackbar('Error', data['message']);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    driverNameTec = TextEditingController(text: widget.driverName);
    driverEmailTec = TextEditingController(text: widget.driverEmail);
    driverPhoneTec = TextEditingController(text: widget.driverPhone);
    assignedCabTec = TextEditingController(text: widget.assignedCab);

    getAllCabs();
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
                    'Driver details',
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
                            labelText: 'Driver Name',
                          ),
                          controller: driverNameTec,
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
                            labelText: 'Phone Number',
                          ),
                          controller: driverPhoneTec,
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
                            labelText: 'Email',
                          ),
                          controller: driverEmailTec,
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
                            labelText: 'Cab Assigned',
                          ),
                          controller: assignedCabTec,
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
                    future: allCabsData,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if(snapshot.hasData) {
                            List<dynamic> cabDataList = snapshot.data;

                            List<DropdownMenuItem<Object>> dropdownItems = cabDataList.map((item) {
                              return DropdownMenuItem<String>(
                                value: item['cabRegistrationNumber'],
                                child: Text(
                                  item['cabRegistrationNumber'],
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
                      await assignCab();
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

