import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:furniture/model/getprofilemodel.dart';
import 'package:furniture/view/editscreen.dart';
import 'package:furniture/view/loginscreen.dart';
import 'package:furniture/view/myorder.dart';
import 'package:furniture/view/myreview.dart';
import 'package:furniture/view/paymentmethod.dart';
import 'package:furniture/view/setting.dart';
import 'package:furniture/view/shippingaddress.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class AppText {
  static List<String> profiletext = [
    "My orders",
    "Shipping Addresses",
    "Payment Method",
    "My reviews",
    "Setting",
  ];

  static List<String> profilesubtext = [
    "Already have 10 orders",
    "03 Addresses",
    "You have 2 cards",
    "Reviews for 5 items",
    "Notification, Password, FAQ, Contact",
  ];
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<GetProfile>? futureProfile;
  String? Token;
  String? name;
  @override
  void initState() {
    futureProfile = fetchProfile();
    super.initState();
  }

  _getRequests() async {
    setState(() {});
  }

  Future DeleteProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.getString('token', data['token']);
    Token = prefs.getString('token');
    log(Token.toString());
    final response = await http.delete(
      Uri.parse("https://typescript-al0m.onrender.com/api/user/delete-profile"),
      headers: {
        'content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $Token"
      },
    );
    if (response.statusCode == 200) {
      log(response.body);
      log("delete successfully");
      prefs.remove("token");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const LogInScreen()), (route) => false);
    } else {
      throw Exception('failed to load employees');
    }
  }

  Future<GetProfile> fetchProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Token = prefs.getString('token');

    log(Token.toString());
    final response = await http.get(
      Uri.parse('https://typescript-al0m.onrender.com/api/user/get-profile'),
      headers: {'Authorization': 'Bearer $Token'},
    );
    final data = jsonDecode(response.body);
    name = data['name'];
    log(name.toString());
    if (response.statusCode == 200) {
      log(response.body);
      return GetProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Delete profile'),
              content: const Text('Do you want to delete this profile?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    DeleteProduct();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.delete),
          ),
        ),
        actions: [
          InkWell(
            onTap: () => Get.to(const Editscreen()),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.edit),
            ),
          ),
        ],
        title: const Center(child: Text('Profile')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            FutureBuilder<GetProfile>(
                future: futureProfile,
                builder: (context, snapshot) {
                  return Row(
                    children: [
                      Image.asset(
                        'assets/image/avatar.png',
                        scale: 3,
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data?.name.toString() ?? "",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            snapshot.data?.email.toString() ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
            SizedBox(
              height: 20.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    child: InkWell(
                      onTap: () {
                          index == 0
                              ? Get.to(OrderScreen())
                              : index == 1
                                  ? Get.to(ShippingScreen())
                                  : index == 2
                                      ? Get.to(PaymentScreen())
                                      : index == 3
                                          ? Get.to(Myreview())
                                          : index == 4
                                              ? Get.to(Settingscreen())
                                              : null;
                        },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppText.profiletext[index],
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontFamily: GoogleFonts.poppins.toString(),
                                    ),
                                  ),
                                  Text(
                                    AppText.profilesubtext[index],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontFamily: GoogleFonts.poppins.toString(),
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                        height: 80.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

}
