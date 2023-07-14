import 'package:afourathon_flutter/backend/CabsBackend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../widgets/CommonWidgets.dart';

class CreateCab extends StatefulWidget {
  const CreateCab({Key? key}) : super(key: key);

  @override
  State<CreateCab> createState() => _CreateCabState();
}

class _CreateCabState extends State<CreateCab> {
  createCab() async {
    CabsBackend cabsBackend = CabsBackend();
    var data = await cabsBackend.createCab(
        cabRegistrationNumberTec.text,
        cabModelTec.text,
        cabColourTec.text
    );

    if (data['success'] == true) {
      Get.back();
      Get.snackbar(
          'Success!', data['message']
      );
    } else {
      Get.snackbar(
        'Error!',
        data['message'],
      );
    }
  }

  TextEditingController cabRegistrationNumberTec = TextEditingController();
  TextEditingController cabModelTec = TextEditingController();
  TextEditingController cabColourTec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 28,top: 45, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(height: 100),
                  OrangeTextField(thisTec: cabRegistrationNumberTec, hintText: 'Registration Number', textInputType: TextInputType.text, obscureText: false,),
                  const SizedBox(height: 10),
                  OrangeTextField(thisTec: cabModelTec, hintText: 'Cab Model', textInputType: TextInputType.text, obscureText: false,),
                  const SizedBox(height: 10),
                  OrangeTextField(thisTec: cabColourTec, hintText: 'Cab Colour', textInputType: TextInputType.text, obscureText: false,),
                ],
              ),
              MainOrangeButton(
                  initialTitle: 'Save',
                  onPressed: () {
                    createCab();
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
