import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:furniture/bottomnavbar.dart';
import 'package:furniture/common/newtextformfield.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Editscreen extends StatefulWidget {
  const Editscreen({super.key});

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  String? token;
  TextEditingController nameControll = TextEditingController();
  Future<void> login(String name) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var data;
      data = prefs.getString('token');
      http.Response response = await http.put(
        Uri.parse(
            'https://typescript-al0m.onrender.com/api/user/update-profile'),
        headers: {
          'content-type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $data',
        },
        body: jsonEncode({
          'name': name,
        }),
      );
      log(response.statusCode.toString());
      log("body ${response.body}");
      if (response.statusCode == 200) {
        log('profile updated successfully');
      } else {
        log('fail');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          NewTextFormfield(
              yourhinttext: 'update',
              yourlabletext: 'update',
              controller: nameControll),
          ElevatedButton(
              onPressed: () => Get.to(BottomNavigation()),
              child: Text('update'))
        ],
      ),
    );
  }
}
