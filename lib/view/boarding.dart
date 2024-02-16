import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture/common/Appimage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Common/button.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImage.Logo), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Text(
                    'MAKE YOUR \nHOME BEAUTIFUL',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: GoogleFonts.poppins().toString(),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'The best simple place where you \ndiscover most wonderful furniture and \nmake your home beautiful',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.poppins.toString(),
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: GlobleButton(
                  onTap: () {},
                  button: 'Get Started',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
