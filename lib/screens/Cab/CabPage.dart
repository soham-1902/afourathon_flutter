import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:afourathon_flutter/widgets/CabWidgets.dart';

class CabPage extends StatefulWidget {
  const CabPage({Key? key}) : super(key: key);

  @override
  State<CabPage> createState() => _CabPageState();
}

class _CabPageState extends State<CabPage> {
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
              CabCard(onPressed: () {}, cabNumber: 'MH06AB7778', cabModel: 'BMW', cabColour: 'Black', index: '1'),
              /*Expanded(
              child: Container(
                height: Constants.getScreenHeight(context) * 0.81,
                width: Constants.getScreenWidth(context) * 1,
                decoration: BoxDecoration(color: Colors.white),
                child: RefreshIndicator(
                  color: Colors.orange,
                  onRefresh: () => getExpensesData(),
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
                                onTap: () {
                                  Get.to(ExpenseDetails(
                                    itemId: snapshot.data[position]['_id'],
                                    itemName: snapshot.data[position]['title'],
                                    itemAmount: snapshot.data[position]
                                    ['amount']
                                        .toString(),
                                  ));
                                },
                                child: Card(
                                  elevation: 0.1,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(bottom: 12.0),
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
                                                  (position + 1).toString(),
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
                                                  snapshot.data[position]
                                                  ['title'],
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
                                                  "₹" +
                                                      snapshot.data[position]
                                                      ['amount']
                                                          .toString(),
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
            ),*/
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Get.to(CreateExpenses());
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
