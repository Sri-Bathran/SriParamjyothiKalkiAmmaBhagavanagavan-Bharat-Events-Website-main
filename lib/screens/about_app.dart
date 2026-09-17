import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/color_constant.dart';
import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';

// ignore: must_be_immutable
class AboutApp extends StatefulWidget {
  String sourceFrom;
  AboutApp({super.key, required this.sourceFrom});

  @override
  // ignore: library_private_types_in_public_api
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutApp> {
  // PackageInfo packageInfo = await PackageInfo.fromPlatform();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pp = 'privacyPolicyInfo';
    var tou = 'TermsofUseInfo';
    var cp = 'CookiesPolicyInfo';
    if (widget.sourceFrom == 'login') {
      pp = 'privacyPolicy';
      tou = 'TermsofUse';
      cp = 'CookiesPolicy';
    }
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar(""),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              headerImage(context, "assets/about.png"),
              const SizedBox(height: 20.0),
              centerHeadingWithSubTitle("About App", "ONENESS  USA"),
              const SizedBox(height: 20),
              createContainer(
                  context,
                  Column(
                    children: [
                      buildSubHeading(context, 'About APP'),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Oneness USA offers courses taught by Sri Preethaji and Sri Krishnaji in the USA, Canada, and online. Steeped in ancient wisdom principles, profound mystic processes, and meditation practices, Oneness USA offerings set into motion a gentle shift that frees one to experience life and the world in beautiful states of consciousness.\nFor awakening and enlightenment, Oneness USA offers sacred journeys in India. When you experience powerful states of consciousness at Oneness USA, they become impressions on your brain and nervous system. They become your compass to live an enlightened life.",
                          style: TextStyle(
                              fontSize: 14.0, height: 1.6, letterSpacing: 0.5),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              createContainer(
                  context,
                  Column(
                    children: [
                      buildSubHeading(context, 'Important Links'),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () async {
                            context.goNamed(pp);
                          },
                          child: const Text('Privacy Policy - Oneness  USA',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  color: Colors.blue)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 20.0),
                        child: InkWell(
                          onTap: () async {
                            context.goNamed(tou);
                          },
                          child: const Text('Terms of Use - Oneness  USA',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  color: Colors.blue)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 20.0),
                        child: InkWell(
                          onTap: () async {
                            context.goNamed(cp);
                          },
                          child: const Text('Cookies Policy - Oneness USA',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  color: Colors.blue)),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
