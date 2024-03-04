import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture/bottomnavbar.dart';
import 'package:furniture/common/Appcolor.dart';
import 'package:furniture/common/Appimage.dart';
import 'package:furniture/view/checkoutscreen.dart';
// import 'package:furniture/view/productscreen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Common/button.dart';

class CartScreen extends StatefulWidget {
  final String yourhinttext;
  final String yourlabletext;

  const CartScreen({
    super.key,
    required this.yourhinttext,
    required this.yourlabletext,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My cart'),
        titleSpacing: 100,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BottomNavigation(),
                ),
              );
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 130,
                  decoration: const BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Colors.black26,
                      width: 0.7,
                    ),
                  )),
                  child: Row(
                    children: [
                      Container(
                        width: 90,
                        child: Image.asset(
                          AppImage.cartscrnimg[index],
                          scale: 2,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  const Text(
                                    "Minimal Stand",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const Text(
                                    "\$ 25.00",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 25.h,
                                        width: 25.h,
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Icon(Icons.add),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      const Text(
                                        '01',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        height: 25.h,
                                        width: 25.h,
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Icon(Icons.remove),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  const Icon(Icons.highlight_remove_outlined),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50.h,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(0.1),
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: AppColor.primarycolor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  hintText: widget.yourhinttext,
                  labelText: widget.yourlabletext,
                ),
                onSaved: (String? value) {},
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    fontFamily: GoogleFonts.inter.toString(),
                    color: Colors.black54,
                  ),
                ),
                Text(
                  '\$ 95.00',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    fontFamily: GoogleFonts.inter.toString(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GlobleButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChackOutScreen(),
                  ),
                );
              },
              button: 'Check out',
            ),
          ),
        ],
      ),
    );
  }
}
