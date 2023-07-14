import 'package:afourathon_flutter/screens/Cab/CabDetails.dart';
import 'package:afourathon_flutter/screens/Cab/CreateCab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:afourathon_flutter/widgets/CabWidgets.dart';

import '../../backend/CabsBackend.dart';
import '../../widgets/CommonWidgets.dart';

class CabPage extends StatefulWidget {
  const CabPage({Key? key}) : super(key: key);

  @override
  State<CabPage> createState() => _CabPageState();
}

class _CabPageState extends State<CabPage> {
  Future<dynamic>? result2 = null;

  getCabsData() async {
    CabsBackend cabsBackend = CabsBackend();

    var data = await cabsBackend.getAllCabs();
    bool? status = data['success'];
    if (status == true) {
      setState(() {
        result2 = Future<dynamic>.value(data['data']);
      });
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCabsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Cabs',
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
                    onRefresh: () => getCabsData(),
                    child: FutureBuilder(
                        future: result2,
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
                                  child: CabCard(onPressed: () {

                                    Get.to(CabDetails(cabRegistrationNumber: snapshot.data[position]['cabRegistrationNumber'], cabModel: snapshot.data[position]['cabModel'], cabColour: snapshot.data[position]['cabColour'], isDriverAssigned: snapshot.data[position]['isAssigned'] ? 'Yes' : 'No'));

                                  },
                                    index: (position+1).toString(),
                                    cabNumber: snapshot.data[position]['cabRegistrationNumber'],
                                    cabModel: snapshot.data[position]['cabModel'],
                                    cabColour: snapshot.data[position]['cabColour'],
                                  ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const CreateCab());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(255, 132, 0, 1),
      ),
    );
  }
}
