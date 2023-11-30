import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
static String routeName = 'splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, HomeScreen.routeName);
     });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1 ;
    final width = MediaQuery.of(context).size.width * 1 ;

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset('assets/images/splash_pic.jpg',
          fit: BoxFit.cover,
          width: width * 0.9,
          height: height * 0.5,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Text('TOP HEADLINES',style: GoogleFonts.anton(letterSpacing: 0.6, color: Colors.grey.shade700),),
          SizedBox(
            height: height * 0.04,
          ),SpinKitChasingDots(
            color: Colors.blue,
            size: 40,
          )
        ]
        ),
      ),
    );
  }
}