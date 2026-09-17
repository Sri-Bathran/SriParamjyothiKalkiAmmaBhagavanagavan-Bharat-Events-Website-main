import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';

class CookiesPolicy extends StatefulWidget {
  const CookiesPolicy({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CookiesPolicyScreenState createState() => _CookiesPolicyScreenState();
}

class _CookiesPolicyScreenState extends State<CookiesPolicy> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar("Cookies Policy"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              createContainer(
                  context,
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last updated: 17-10-2023",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "At Oneness USA CANADA, we care about the privacy of your data and are committed to protecting it. This Privacy Notice (“Notice”) is here to help you to understand how your personal data processed and what happens to it when you’re using Oneness USA CANADA Website / APP located at  (“Website”).",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "1. Who we are?",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We are OWA Holdings, Inc. with the 40 E Main St 1154, Newark, Delaware 19711-4639, United States and we are a data controller for the data processing related to the use of the Website. In this document, we will refer to ourselves as “Oneness USA CANADA”, “we” or “us”. You may contact us via email at <legal@ekam.org> in case you have any questions in relation to your personal data. ",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "2. What kinds of data we process? ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "Generally, you may browse the Website without providing us with your personal data. However, if you want to use all features of the Website, we will ask you to provide some of your personal data. Keep in mind, when you access our Website we will automatically receive certain technical data, which does not constitute personal until you provide us additional data about yourself.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "2.1 Automatically collected data.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We need this data to operate, maintain and improve our Website and Services. Such data includes:\nTechnical data: device type, device OS, mobile service carrier, device ID, location, browser language, demographics.\nUsage data: screens opened, features used, content viewed, areas of Site visited.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "2.2 Data you give us.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "If you want to use all Website features you will need to provide some personal data. Such data includes: \nContact data: Phone number, email address, name, city, state, country.\nCourse registration data: Name, email, gender, country. ",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "3. Why do we use your data?\n3.1. Provide you with access to the Website.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "When it comes to the processing of your personal data we have two main purposes of doing so. The first one is providing you with access to our Website so that you can browse its pages and see what is displaced in it. The second one is providing you the features of our Site, such as register to one of our courses, or contact us etc. When we process your personal data for the purposes described above we rely on the performance of a contract as a legal ground for the processing. ",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "3.2 Improve our Website.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We may use some of your personal data to improve our Website, to make analysis including anonymization and aggregation of personal data, to develop new products, to enforce our Terms & Conditions. We rely on legitimate interest as a legal ground for processing, when we use your data for processing activities which does not override your rights and freedoms. ",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
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
