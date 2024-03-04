import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture/bottomnavbar.dart';
import 'package:furniture/common/Appcolor.dart';
import 'package:furniture/common/button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Congratesscreen extends StatefulWidget {
  const Congratesscreen({super.key});

  @override
  State<Congratesscreen> createState() => _CongratesscreenState();
}

class _CongratesscreenState extends State<Congratesscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          children: [
            SizedBox(
              height: 124.h,
            ),
            Center(
              child: Text(
                'SUCCESS!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins.toString(),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Image.asset(
              'assets/image/Graphics.jpg',
              scale: 2.5,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Your order will be delivered soon.\nThank you for choosing our app!',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(),
                fontSize: 16.h,
                fontWeight: FontWeight.w400,
                color: AppColor.textcolor,
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            GlobleButton(
              onTap: () {},
              button: 'Track your orders',
            ),
            SizedBox(height: 20.h),
            GlobleButton(
              onTap: () => Get.to(BottomNavigation()),
              button: 'Back to home',
            ),
          ],
        ),
      ),
    );
  }
}
