import 'package:afourathon_flutter/widgets/DriverWidgets.dart';
import 'package:flutter/material.dart';
import 'package:afourathon_flutter/screens/Menu.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:afourathon_flutter/backend/DriversBackend.dart';

class Home extends StatefulWidget {
  final String userName;

  const Home({Key? key, required this.userName}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.209),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 132, 0, 1),
                Color.fromRGBO(255, 217, 61, 1),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi,  User 👋',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Afourathon',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat-Regular',
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.to(Menu());
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 48,
                    width: 358,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.center,
                            enabled: false,
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              hintText: '🎊 Manage Cabs Seamlessly 🎊',
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
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            bool exit = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Exit Confirmation'),
                content: const Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
            );

            return exit;
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 0, 20),
            child: SingleChildScrollView(
              reverse: true,
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Drivers 🙋‍♂️',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'ClashDisplay',
                          color: Color(0xFF4F200D),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  FutureBuilder(
                    future: result,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
                          return Container(
                            height: 130,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, position) {
                                return DriverDashboardCard(
                                    driverEmail: snapshot.data[position]['driverEmail'],
                                    driverName: snapshot.data[position]['driverName'],
                                    driverPhone: snapshot.data[position]['driverPhone']
                                );
                              },
                            ),
                          );
                        } else if(!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Center(
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/empty.svg'),
                              Text('Empty ! Create a purchase order')
                            ],
                          ),
                        );
                      }
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(
                        'Cabs 🚕',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'ClashDisplay',
                          color: Color(0xFF4F200D),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
