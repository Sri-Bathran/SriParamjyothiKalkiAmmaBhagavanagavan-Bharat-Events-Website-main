import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicy> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar("Privacy Policy"),
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
                                "At Oneness USA CANADA (refered to as Oneness), we care about the privacy of your data and are committed to protecting it. This Privacy Notice (“Notice”) is here to help you to understand how your personal data processed and what happens to it when you’re using Oneness USA CANADA Website located at <Web Address> (“Website”) or its iOS or Android App.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "What kinds of data we process?",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 3),
                              Text(
                                "Generally, you may browse the Website without providing us with your personal data. However, if you want to use all features of the Website, we will ask you to provide some of your personal data. Keep in mind, when you access our Website we will automatically receive certain technical data, which does not constitute personal until you provide us additional data about yourself.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "2.1. Automatically collected data.",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We need this data to operate, maintain and improve our Website and Services. Such data includes:\nTechnical data: device type, device OS, mobile service carrier, device ID, location, browser language, demographics.Usage data: screens opened, features used, content viewed, areas of Site visited.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "2.2. Data you give us.",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "If you want to use all Website features you will need to provide some personal data. Such data includes:Contact data: Phone number, email address, name, city, state, country.Course registration data: Name, email, gender, country.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Why do we use your data?\n3.1. Provide you with access to the Website / App.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "When it comes to the processing of your personal data we have two main purposes of doing so. The first one is providing you with access to our Website / App so that you can browse its pages and see what is displaced in it. The second one is providing you the features of our Site / App, such as register to one of our courses, or contact us etc. When we process your personal data for the purposes described above we rely on the performance of a contract as a legal ground for the processing.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "3.2. Improve our Website. ",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We may use some of your personal data to improve our Website, to make analysis including anonymization and aggregation of personal data, to develop new products, to enforce our Terms & Conditions. We rely on legitimate interest as a legal ground for processing, when we use your data for processing activities which does not override your rights and freedoms.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "3.3. Marketing. ",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "In case you provide us with your consent, we will use your data for direct marketing purposes. If we use consent as a legal basis for processing, you will have a choice to opt-out from any processing activity. You may withdraw your consent at any time by sending us an email to us at <legal@ekam.org>",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "3.4. To comply with our legal obligations.",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "Legislation may require us to process some of your personal data. If it does we will process it to comply with our legal obligations.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Do we use cookies?",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "A cookie is a piece of data stored on the user’s hard drive containing information about the user. Usually, we use cookies for analytical purposes.\nIf you do want to manage cookies, here is an instruction on how to do it. The links below provide information about cookie settings for the browsers:\nInternet Explorer\nFirefox\nMicrosoft Edge\nChrome\nSafari\nAlso, you can opt-out by visiting the Network Advertising Initiative Opt Out page.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "How do we share and disclose data?",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We may share your personal data under the following conditions:",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "5.1. Safety, Legal purposes, and Law enforcement.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We will disclose your personal data to third parties to the extent necessary to:\ncomply with a government request, a court order or applicable law;defend ourselves against third-party claims;assist in fraud prevention or investigation",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "5.2. Business transfers.",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We will not sell your personal data to any company or organization. However, we may transfer your personal data to a successor entity. In such event, we will notify you before your personal data is transferred and becomes subject to a different privacy statement.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "5.3. With your consent.",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "In cases where you have provided your consent, we may share your personal data, as described at the time of consent.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "5.4. Service providers.",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We use third-party service providers. We may share a limited amount of personal data with them. We make sure our contracts use appropriate technical and operational safeguards.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "How do we handle your data?\n6.1.Security.",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We provide industry-standard physical, electronic, and procedural safeguards to protect personal data we process and maintain. For example, data which we receive is available only to authorized employees, also we use encryption to make sure your personal data is protected. If you have a reason to believe that your interaction with our Website is no longer secure, please immediately notify us by contacting us in writing at <info@ekam.org>",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "6.2. Retention of your personal data.",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We retain your personal data for as long as necessary to fulfil the purposes described in this Notice. Usually, the retention period of your personal data does not exceed 12 months. Please note, we may keep some data for our backups and to comply with our legal obligations.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "How can you manage your personal data?",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "If you would like to access, review, update, rectify, and delete any personal information we hold about you, or exercise any other of your rights such as a right to object or restrict processing and a right to data portability, you can email us to info@ekam.org. In case you are unhappy with how we handle your data, you have a right to lodge a complaint with a supervisory authority.",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Policy towards minors",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "We do not knowingly process personal data from anyone under the age of 16. If you are under 16, please do not attempt to send any personal data to us. If we learn that we have collected personal data from a child, we will delete that information as quickly as possible. If you believe that a child has disclosed data to us, please contact us at info@ekam.org",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "How do we update this notice?",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    height: 1.6,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "Applicable law and our practices change over time. If we decide to update our Privacy Notice, we will post the changes on our Website. If we materially change the way in which we process your personal data, we will notify you prior to implement any changes,  where legally required we will request your consent. We strongly encourage you to read our Privacy Notice and keep yourself informed of our practices.",
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
