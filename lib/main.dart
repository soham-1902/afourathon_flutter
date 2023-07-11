import 'package:flutter/material.dart';
import 'package:afourathon_flutter/screens/Login.dart';
import 'package:get/get.dart';
import 'package:afourathon_flutter/services/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'ClashDisplay',
      ),
      color: Color(0xFFFA9F42),
      title: 'Afourathon App',
      initialRoute: '/login',
      getPages: appRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
