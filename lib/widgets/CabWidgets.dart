import 'package:flutter/material.dart';

class CabCard extends StatelessWidget {

  final Function? onPressed;
  final String cabNumber;
  final String cabModel;
  final String cabColour;
  final String index;

  const CabCard({Key? key, required this.onPressed, required this.cabNumber, required this.cabModel, required this.cabColour, required this.index}) : super(key: key);

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
              const EdgeInsets.symmetric(vertical: 12.0),
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
                            cabNumber,
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
                            cabModel + ' ' + cabColour,
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
