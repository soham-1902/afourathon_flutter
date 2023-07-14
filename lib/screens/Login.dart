import 'package:afourathon_flutter/screens/Signup.dart';
import 'package:flutter/material.dart';
import 'package:afourathon_flutter/widgets/CommonWidgets.dart';
import 'package:afourathon_flutter/screens/Home.dart';
import 'package:get/get.dart';

import '../backend/Authentication.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailTec = TextEditingController();
  TextEditingController passwordTec = TextEditingController();

  performLogin() async {
    Authentication authentication = Authentication();
    var data = await authentication.login(
      emailTec.text,
      passwordTec.text,
    );

    if (data['success'] == true) {
      Get.off(
          Home(
            userName: (emailTec.text.substring(0, emailTec.text.indexOf('@'))
          ),
        )
      );
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
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const BrownPageHeader(headerText: 'Login'),
                    const SizedBox(height: 150),
                    Column(
                        children: [
                          OrangeTextField(thisTec: emailTec, hintText: 'Email', textInputType: TextInputType.emailAddress, obscureText: false,),
                          const SizedBox(height: 10),
                          OrangeTextField(thisTec: passwordTec, hintText: 'Password', textInputType: TextInputType.text, obscureText: true,),
                          SizedBox(height: 10,),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have an account! ',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Regular',
                                    fontSize: 16,
                                    color: Color.fromARGB(191, 0, 0, 0),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.off(() => Signup(),
                                        duration: Duration(milliseconds: 500),
                                        transition: Transition.circularReveal);
                                  },
                                  child: const Text(
                                    'Sign up',
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
                    initialTitle: 'Next', onPressed: () async {
                      await performLogin();
                  }
                ),
              ]
          ),
        ),
      ),
    );
  }
}
