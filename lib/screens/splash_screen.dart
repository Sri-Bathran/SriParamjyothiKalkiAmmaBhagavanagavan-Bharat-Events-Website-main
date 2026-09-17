import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import '../constants/style_constant.dart';
import '../providers/user_provider.dart';
import '../utilities/mobile_design_widget.dart';

//import 'home_screen_before_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _loadData(BuildContext context) async {
    //Provider.of<UserProvider>(context, listen: false).incrementCounter();
    Provider.of<UserProvider>(context, listen: false).getUserData();
  }

  bool isloggedin = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // UserModel loggedInUser = UserModel();
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        // ignore: use_build_context_synchronously
        context.go("/home");
      } else {
        // ignore: use_build_context_synchronously
        _loadData(context);
        // ignore: use_build_context_synchronously
        context.go("/dashboard");
      }
    });
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      checkAuthentification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ), // Sets the radius for rounded corners
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/splash_screen.jpeg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              Text(
                'Welcome To', // Display your text here
                style: TextStyle(
                  fontSize: 16, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight
                  color: const Color.fromARGB(255, 103, 103, 103), // Text color
                  letterSpacing: 2.0, // Optional: add letter spacing
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 5.0)),
              Text(
                'Kalki Bharat Events', // Display your text here
                style: splashScreenText,
              ),
              const Padding(padding: EdgeInsets.only(top: 80.0)),
              const CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 231, 116, 0),
                color: bgColorLightGold,
                strokeWidth: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
