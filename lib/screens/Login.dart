import 'package:flutter/material.dart';
import 'package:afourathon_flutter/widgets/CommonWidgets.dart';
import 'package:afourathon_flutter/screens/Home.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController nameTec = TextEditingController();
  TextEditingController emailTec = TextEditingController();

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
                    BrownPageHeader(headerText: 'Login'),
                    SizedBox(height: 150),
                    Column(
                        children: [
                          OrangeTextField(thisTec: nameTec, hintText: 'Name'),
                          SizedBox(height: 10),
                          OrangeTextField(thisTec: emailTec, hintText: 'Email'),
                        ]
                    ),
                  ]
                ),
                MainOrangeButton(
                    initialTitle: 'Next', onPressed: () {
                    Get.to(Home());
                  }
                ),
              ]
          ),
        ),
      ),
    );
  }
}

