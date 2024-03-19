import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture/bottomnavbar.dart';
import 'package:furniture/view/loginscreen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  String token = "";
  Future<void> gettoken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token").toString();
    print("token ${token}");
  }

  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            //  //ignore: unnecessary_null_comparison
            // home: token != null
            //     ? const OrderScreen()
            //     : const LogInScreen(),

            home:
                // ignore: unnecessary_null_comparison
                token != null ? const BottomNavigation() : const LogInScreen(),
          );
        });
  }
}
