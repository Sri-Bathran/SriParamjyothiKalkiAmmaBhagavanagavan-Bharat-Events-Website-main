import '../constants/color_constant.dart';
//import '../screens/home_screen_before_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';
import 'home_screen_before_login.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogoutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar(""),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: <Widget>[
                headerImage(context, "assets/login.png"),
                const SizedBox(height: 20.0),
                centerHeadingWithSubTitle(
                    "Session Timeout", "You are using Multiple Devices"),
                const SizedBox(height: 10.0),
                const Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Text(
                      'This is likely because  you are  logged in with other device. Please re-login again.',
                      style: TextStyle(
                          color: mCardTitleColor, fontSize: 17, height: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                        color: bgColorPinkDark,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const HomeScreenBeforeLogin()),
                            (route) => false);
                      },
                      //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: const Text("Login Now",
                          style: TextStyle(color: Colors.white, fontSize: 16)),

                      //  color: Color(0xff0f194a),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
