import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture/common/Appcolor.dart';

class MySpipiingScreen extends StatefulWidget {
  const MySpipiingScreen({super.key});

  @override
  State<MySpipiingScreen> createState() => _MySpipiingScreenState();
}

class Shipping1 {
  String title;
  String title2;

  Shipping1({
    required this.title,
    required this.title2,
  });
}

class Shipping2 {
  String title3;
  String title4;

  Shipping2({
    required this.title3,
    required this.title4,
  });
}

List<Shipping1> shipping1 = [
  Shipping1(
    title: 'Full name',
    title2: 'Arlene McCoy',
  ),
  Shipping1(
    title: 'Address ',
    title2: '25 Robert Latouche Street',
  ),
  Shipping1(
    title: 'Zipcode (Postal Code)',
    title2: '324545',
  ),
];
List<Shipping2> shipping2 = [
  Shipping2(
    title3: 'Country',
    title4: 'USA',
  ),
  Shipping2(
    title3: 'City',
    title4: 'New York',
  ),
  Shipping2(
    title3: 'District',
    title4: 'Select District',
  ),
];

class _MySpipiingScreenState extends State<MySpipiingScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            ' Add Shipping address',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColor.blackcolor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColor.greycolor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColor.blackcolor)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColor.greycolor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Address',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColor.blackcolor)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColor.greycolor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Zipcode (Postal Code)',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColor.blackcolor)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColor.greycolor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                        labelText: 'Country',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColor.blackcolor)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColor.greycolor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                        labelText: 'City',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColor.blackcolor)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColor.greycolor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                      labelText: 'District',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColor.blackcolor),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 60.h,
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  // Get.to(PaymentScreen());
                },
                child: Text(
                  'save address',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
