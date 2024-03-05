import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture/common/Appimage.dart';
import 'package:furniture/common/Apptext.dart';
import 'package:furniture/model/showproductmodel.dart';
import 'package:furniture/view/cartscreen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Productmodel>>? productdetail;
  String? token;
  @override

  // ignore: override_on_non_overriding_member
  Future<List<Productmodel>> getProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    log(token.toString());
    final Response = await http.get(
      Uri.parse(
          'https://typescript-al0m.onrender.com/api/user/product/showall-product'),
      headers: {'authorization': 'bearer $token'},
    );

    if (Response.statusCode == 200) {
      List<dynamic> data = json.decode(Response.body);
      return data.map((json) => Productmodel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0,
            mainAxisExtent: 300,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (BuildContext context, index) {
            return Stack(children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImage.gridviewimage[index],
                      scale: 2,
                      height: 220.h,
                    ),
                    Text(
                      AppText.homepagecomontxt[index],
                    ),
                    Text(
                      AppText.homepageprice[index],
                    ),
                  ],
                ),
               
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 17),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: InkWell(
                            onTap: () => Get.to(const CartScreen(
                              yourhinttext: '',
                              yourlabletext: '',
                            )),
                            child: const Icon(
                              Icons.shopping_bag,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]);
          },
        ),
      ),
    );
  }
}
