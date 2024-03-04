import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture/common/Appcolor.dart';
import 'package:furniture/common/Appimage.dart';
import 'package:furniture/common/newtextformfield.dart';
import 'package:furniture/view/loginscreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../Common/button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController nameControll = TextEditingController();
  Future<void> login(String email, String password, String name) async {
    log(email);
    log(password);
    log(name);
    try {
      http.Response response = await http.post(
        Uri.parse('https://typescript-al0m.onrender.com/api/user/signUp'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': password,
        }),
      );

      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        // var data = jsonDecode(response.body);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LogInScreen()),
            (route) => false);
        // log(data['messge']);
        log("User sing in");
      } else {
        log('user already created');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black26,
                      height: 1.h,
                      width: 50.h,
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Image.asset(
                    AppImage.Loginscreenimg,
                    scale: 3,
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black26,
                      height: 1.h,
                      width: 50.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'WELCOME',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins.toString(),
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Container(
                  height: 490.h,
                  width: 327.w,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 8),
                      color: AppColor.boxshadowcolor,
                      blurRadius: 40.0,
                    ),
                  ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 50, bottom: 10),
                        child: NewTextFormfield(
                          controller: nameControll,
                          yourhinttext: 'Enter Your Name',
                          yourlabletext: 'Name',
                          iconwidget: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: NewTextFormfield(
                          controller: emailController,
                          yourhinttext: 'Enter Your Email',
                          yourlabletext: 'Email',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: NewTextFormfield(
                          controller: password,
                          yourhinttext: 'Enter Your Password',
                          yourlabletext: 'Password',
                          iconwidget: const Icon(
                            Icons.remove_red_eye,
                            size: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: NewTextFormfield(
                          controller: cpassword,
                          yourhinttext: 'Confirm Your Password',
                          yourlabletext: 'Confirm',
                          iconwidget: const Icon(
                            Icons.remove_red_eye,
                            size: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GlobleButton(
                          onTap: () {
                            login(emailController.text, password.text,
                                nameControll.text);
                          },
                          button: 'Sign in',
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have account?',
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: GoogleFonts.inter.toString(),
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(LogInScreen()),
                            child: Text(
                              ' Sign up',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.inter.toString(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
