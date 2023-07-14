import 'package:flutter/material.dart';

class OrangeTextField extends StatelessWidget {
  final TextEditingController thisTec;
  final String hintText;
  final TextInputType textInputType;

  const OrangeTextField({Key? key, required this.thisTec, required this.hintText, required this.textInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        keyboardType: textInputType,
        controller: thisTec,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat-Regular',
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
              color: Color(0xFF000000),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
              color: Color(0xFF000000),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
              color: Color(0xFF000000),
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'Montserrat-Regular',
          ),
          filled: true,
          fillColor: Color.fromRGBO(255, 132, 0, 0.08),
        ),
      ),
    );
  }
}

class BrownPageHeader extends StatelessWidget {
  final String headerText;

  const BrownPageHeader({Key? key, required this.headerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 12),
        child: Text(
          headerText,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4F200D),
            fontFamily: 'ClashDisplay',
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

class Constants {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .height;
  }
}

class MainOrangeButton extends StatelessWidget {

  final String initialTitle;
  final Function? onPressed;

  const MainOrangeButton({Key? key, required this.initialTitle, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Constants.getScreenHeight(context) * 0.07,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFFFF8400),
        ),
        onPressed: () {
          onPressed!();
        },
        child: Text(
          initialTitle,
          style: const TextStyle(
            fontFamily: 'Montserrat-Regular',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

