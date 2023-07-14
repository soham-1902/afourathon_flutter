import 'package:flutter/material.dart';

class DriverCard extends StatelessWidget {
  final Function? onPressed;
  final String driverName;
  final String driverNumber;
  final String index;

  const DriverCard({Key? key, required this.onPressed, required this.driverName, required this.driverNumber, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          onPressed!();
        },
        child: Card(
          elevation: 0.5,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
              CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(
                            255, 132, 0, 0.08),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          index,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(
                                255, 132, 0, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily:
                            'Montserrat-Regular',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          driverName,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                            'Montserrat-Regular',
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          driverNumber,
                          style: TextStyle(
                              fontFamily:
                              'Montserrat-Regular',
                              fontSize: 10,
                              fontWeight:
                              FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 16,
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
