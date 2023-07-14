import 'package:afourathon_flutter/screens/Login.dart';
import 'package:get/get.dart';

import '../screens/Home.dart';

appRoutes() => [
  GetPage(
    name: '/login',
    page: () => Login(),
  ),
  GetPage(
    name: '/dashboard',
    page: () => Home(userName: 'User',),
  ),
];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
