import 'package:flutter/material.dart';
import 'package:kbevents/screens/login.dart';

import '../constants/color_constant.dart';
import '../constants/style_constant.dart';
import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';
import 'login_phone.dart';

class HomeScreenBeforeLogin extends StatefulWidget {
  const HomeScreenBeforeLogin({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<HomeScreenBeforeLogin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: AppBar(backgroundColor: bgColorPinkDark, toolbarHeight: 1.0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              headerImage(context, "assets/login_home.jpeg"),
              const SizedBox(height: 20.0),
              centerHeadingWithSubTitle("Welcome To Kalki Bharat Events", ""),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      margin: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 30,
                        right: 30,
                      ),
                      elevation: 40,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPhoneScreen(),
                            ),
                          );
                        },
                        child: Ink(
                          color: const Color.fromARGB(255, 11, 70, 107),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              18.0,
                              13.0,
                              18.0,
                              13.0,
                            ),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.phone, color: Colors.white),
                                SizedBox(width: 12),
                                Text(
                                  'Sign In With Phone Number',
                                  style: mAppBarStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Card(
                      margin: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 30,
                        right: 30,
                      ),
                      elevation: 20,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Ink(
                          color: const Color.fromARGB(255, 72, 33, 149),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              40.0,
                              13.0,
                              40.0,
                              13.0,
                            ),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.email, color: Colors.white),
                                SizedBox(width: 12),
                                Text(
                                  'Sign In With Email ID',
                                  style: mAppBarStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
