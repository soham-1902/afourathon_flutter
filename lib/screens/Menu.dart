import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:afourathon_flutter/screens/Driver/DriverPage.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 40,
            left: 20,
            right: 20,
            ),
            child: Column(
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
                SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'ClashDisplay',
                        color: Color(0xFF4F200D),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(DriverPage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Drivers',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat-Regular',
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.orange,
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(20, 20, 20, 0.6),
                ),
                SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    //Get.to(() => Vendors());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cabs',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat-Regular',
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.orange,
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(20, 20, 20, 0.6),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
