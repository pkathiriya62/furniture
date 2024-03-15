import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTabBar extends StatefulWidget {
  const ProfileTabBar({super.key});

  @override
  State<ProfileTabBar> createState() => _ProfileTabBarState();
}


class _ProfileTabBarState extends State<ProfileTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20,),
            child: Container(

              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Order No238562312'),
                      Text('20/03/2020'),
                    ],
                  ),
                ],
              ),

              height: 160.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}