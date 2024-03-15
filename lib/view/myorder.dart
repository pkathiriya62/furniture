import 'package:flutter/material.dart';
import 'package:furniture/view/order_tabbar.dart';
// import 'package:furniture/view/order_tabbar.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Order',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins.toString(),
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
          centerTitle: true,
          bottom: TabBar(
            unselectedLabelColor: Color(0xff909090),
            labelColor: Color(0xff242424),
            dividerHeight: 0,
            indicatorColor: Color(0xff242424),
            indicatorPadding: EdgeInsets.only(right: 15, left: 15),
            // indicator: BoxDecoration(shape: BoxShape.rectangle),
            tabs: <Widget>[
              Tab(
                icon: Text(
                  'Delivered',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins.toString(), fontSize: 18),
                ),
              ),
              Tab(
                icon: Text(
                  'Processing',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins.toString(), fontSize: 18),
                ),
              ),
              Tab(
                icon: Text(
                  'Canceled',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins.toString(), fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Delivered(),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
