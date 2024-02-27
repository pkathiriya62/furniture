import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child: Text("Profile", style: TextStyle(fontSize: 20,fontFamily: GoogleFonts.poppins().toString()))),
      ),
      body: const Column(
        children: [
          Row(
            
          )
        ],
      ),
    );
  }
}
