import 'package:flutter/material.dart';

class DriverDashboardCard extends StatelessWidget {
  final String driverEmail;
  final String driverName;
  final String driverPhone;

  const DriverDashboardCard({
    Key? key,
    required this.driverEmail,
    required this.driverName,
    required this.driverPhone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.orangeAccent,
                  size: 32,
                ),
                SizedBox(width: 8),
                Text(
                  driverName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '$driverEmail',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '$driverPhone',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


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
            const EdgeInsets.symmetric(vertical: 4.0),
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
