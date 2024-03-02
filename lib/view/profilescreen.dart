import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture/view/editscreen.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Editscreen()));
              },
              child: Text('Edit profile'))
        ],
        leading: ElevatedButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Delete profile'),
              content: const Text('Do you want to delete this profile'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete),
            ],
          ),
        ),
        title: Center(child: Text('Profile')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
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
                      'Kristin Watson',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'bruno203@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
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
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                      height: 80.h,
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
                }),
          ],
        ),
      ),
    );
  }
}
