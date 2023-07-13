import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afourathon_flutter/backend/DriversBackend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../widgets/CommonWidgets.dart';

class CreateDriver extends StatefulWidget {
  const CreateDriver({Key? key}) : super(key: key);

  @override
  State<CreateDriver> createState() => _CreateDriverState();
}

class _CreateDriverState extends State<CreateDriver> {
  createDriver() async {

    DriversBackend driversBackend = DriversBackend();
    var data = await driversBackend.createDriver(
      driverNameTec.text,
      driverEmailTec.text,
      driverPhoneTec.text
    );

    if (data['success'] == true) {
      Get.back();
      Get.snackbar(
          'Success!', data['message']
      );
    } else {
      Get.snackbar(
        'An unexpected error occurred!',
        data['message'],
      );
    }
  }

  TextEditingController driverNameTec = TextEditingController();
  TextEditingController driverEmailTec = TextEditingController();
  TextEditingController driverPhoneTec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 28,top: 45, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                      'assets/back.svg',
                      height: 48,
                      width: 48,
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(height:20,),
                  const BrownPageHeader(headerText: 'Create Driver'),
                  const SizedBox(height: 150),
                  OrangeTextField(thisTec: driverEmailTec, hintText: 'Driver email', textInputType: TextInputType.emailAddress,),
                  const SizedBox(height: 10),
                  OrangeTextField(thisTec: driverNameTec, hintText: 'Driver name', textInputType: TextInputType.name,),
                  const SizedBox(height: 10),
                  OrangeTextField(thisTec: driverPhoneTec, hintText: 'Driver phone', textInputType: TextInputType.phone,),
                ],
              ),
              MainOrangeButton(
                  initialTitle: 'Save',
                  onPressed: () {
                    createDriver();
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
