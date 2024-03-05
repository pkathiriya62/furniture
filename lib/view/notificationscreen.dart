import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key});

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        children: [
          Center(child: Text('Notification',style: TextStyle(fontSize: 16.h,fontFamily: GoogleFonts.poppins.toString(),fontWeight: FontWeight.w600),)),
        ],
      ),
    );
  }
}