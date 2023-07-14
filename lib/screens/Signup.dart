import 'package:afourathon_flutter/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:afourathon_flutter/widgets/CommonWidgets.dart';
import 'package:afourathon_flutter/screens/Home.dart';
import 'package:get/get.dart';

import '../backend/Authentication.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameTec = TextEditingController();
  TextEditingController emailTec = TextEditingController();
  TextEditingController phoneTec = TextEditingController();
  TextEditingController passTec = TextEditingController();
  TextEditingController confirmPassTec = TextEditingController();

  registerUser() async {
    Authentication authentication = Authentication();
    var data = await authentication.register(
      nameTec.text,
      emailTec.text,
      passTec.text,
      phoneTec.text,
      confirmPassTec.text,
    );

    if (data['success'] == true) {
      Get.off(const Login());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    children: [
                      BrownPageHeader(headerText: 'Sign Up'),
                      SizedBox(height: 150),
                      Column(
                          children: [
                            OrangeTextField(thisTec: nameTec, hintText: 'Name', obscureText: false, textInputType: TextInputType.name),
                            SizedBox(height: 10),
                            OrangeTextField(thisTec: emailTec, hintText: 'Email', obscureText: false, textInputType: TextInputType.emailAddress),
                            SizedBox(height: 10),
                            OrangeTextField(thisTec: phoneTec, hintText: 'Phone', obscureText: false, textInputType: TextInputType.phone),
                            SizedBox(height: 10),
                            OrangeTextField(thisTec: passTec, hintText: 'Password', obscureText: true, textInputType: TextInputType.text),
                            SizedBox(height: 10),
                            OrangeTextField(thisTec: confirmPassTec, hintText: 'Confirm Password', obscureText: true, textInputType: TextInputType.text),
                            SizedBox(height: 10,),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already have an account? ',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat-Regular',
                                      fontSize: 16,
                                      color: Color.fromARGB(191, 0, 0, 0),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.off(() => Login(),
                                          duration: Duration(milliseconds: 500),
                                          transition: Transition.circularReveal);
                                    },
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat-Regular',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),
                    ]
                ),
                MainOrangeButton(
                    initialTitle: 'Register', onPressed: () async {
                      registerUser();
                    }
                ),
              ]
          ),
        ),
      ),
    );
  }
}