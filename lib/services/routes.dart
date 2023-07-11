import 'package:afourathon_flutter/screens/Login.dart';
import 'package:get/get.dart';

appRoutes() => [
  GetPage(
    name: '/login',
    page: () => Login(),
  ),
];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
