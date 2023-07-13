import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
  /*updateExpenseDetails() async {

    exp.Expenses myExp = exp.Expenses();
    var Data = await myExp.updateExpense(
      widget.itemId,
      titleController.text,
      amountController.text,
    );

    print('Expense Data $Data');
    if (Data['status'] == true) {
      print(Data['msg']);
      Get.to(() => Expenses());
      Get.snackbar(
          'Success!', 'Your details saved successfully'
      );
    } else {
      print(Data["status"]);
      Get.snackbar(
        'Error!',
        Data['msg'],
      );
    }
  }*/

  late TextEditingController driverNameTec;
  late TextEditingController driverEmailTec;
  late TextEditingController driverPhoneTec;
  late TextEditingController assignedCabTec;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    driverNameTec = TextEditingController(text: widget.driverName);
    driverEmailTec = TextEditingController(text: widget.driverEmail);
    driverPhoneTec = TextEditingController(text: widget.driverPhone);
    assignedCabTec = TextEditingController(text: widget.assignedCab);
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
                ],
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: MainOrangeButton(
                    initialTitle: 'Save',
                    onPressed: () async {

                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

