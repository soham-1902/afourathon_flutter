import 'package:afourathon_flutter/backend/DriversBackend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:afourathon_flutter/widgets/DriverWidgets.dart';

import '../../widgets/CommonWidgets.dart';
import 'CreateDriver.dart';
import 'DriverDetails.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({Key? key}) : super(key: key);

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {

  Future<dynamic>? result = null;

  getDriversData() async {
    DriversBackend driversBackend = DriversBackend();

    var data = await driversBackend.getAllDrivers();
    bool? status = data['success'];
    if (status == true) {
      setState(() {
        result = Future<dynamic>.value(data['data']);
      });
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDriversData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const CreateDriver());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(255, 132, 0, 1),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 30,
              left: 22,
              right: 22
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  'assets/back.svg',
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: Text(
                      'Drivers',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'ClashDisplay',
                        color: Color(0xFF4F200D),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 132, 0, 0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.search,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat-Regular',
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
              child: Container(
                height: Constants.getScreenHeight(context) * 0.81,
                width: Constants.getScreenWidth(context) * 1,
                decoration: BoxDecoration(color: Colors.white),
                child: RefreshIndicator(
                  color: Colors.orange,
                  onRefresh: () => getDriversData(),
                  child: FutureBuilder(
                      future: result,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data != null &&
                            snapshot.data!.isNotEmpty) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, position) {
                              return GestureDetector(
                                onTap: () {},
                                child: DriverCard(onPressed: () {

                                  Get.to(DriverDetails(
                                    driverId: snapshot.data[position]['driverId'],
                                    driverName: snapshot.data[position]['driverName'],
                                    driverPhone: snapshot.data[position]['driverPhone'],
                                    driverEmail: snapshot.data[position]['driverEmail'],
                                    assignedCab: snapshot.data[position]['cabRegistrationNumber'] ?? 'Cab not assigned',
                                  ));

                                }, driverName: snapshot.data[position]['driverName'], driverNumber: snapshot.data[position]['driverPhone'], index: (position+1).toString()),
                              );
                            },
                          );
                        } else if (snapshot.hasData &&
                            snapshot.data.length == 0) {
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(height: 50,),
                                SvgPicture.asset('assets/empty.svg'),
                                Text('Empty ! Create an expense')
                              ],
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
