// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:go_router/go_router.dart';

import '../constants/color_constant.dart';
import '../constants/constants.dart';
import '../model/receipt_detail_model.dart';
import '../providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';

// ignore: must_be_immutable
class Receipts extends StatefulWidget {
  const Receipts({super.key});

  @override
  State<Receipts> createState() => _ContistantsState();
}

class _ContistantsState extends State<Receipts> {
  //late NativeAd _ad;
  //bool _isAdLoaded = false;

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
    final userData = context.watch<UserProvider>().loggedInUser;
    var streamQuery =
        FirebaseFirestore.instance
            .collection(Constants.users)
            .doc(userData.userId)
            .collection(Constants.userHomaPayments)
            //.where("paymentStatus", isEqualTo: "Approved")
            //.where("source", isEqualTo: "KBE")
            .snapshots();

    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar("Registered Payments"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              StreamBuilder<QuerySnapshot<Map<dynamic, dynamic>>>(
                stream: streamQuery,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  // final availableCoursesList =
                  //     CourseModel.fromMap(snapshot.data);
                  // List<CourseDetailModel>? ucCoursesList = [];
                  if ((snapshot.data!.docs.isEmpty)) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Builder(
                          builder: (context) {
                            return const Text("No Receipts Found.");
                          },
                        ),
                      ),
                    );
                  }
                  // print(snapshot.data!.docs.length);
                  var receiptsList = snapshot.data!.docs;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(), // new line
                      itemCount: receiptsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index + 1 == receiptsList.length) {
                          return Column(
                            children: [
                              buildContistantCard(
                                context,
                                receiptsList[index],
                                "",
                                userData,
                              ),
                              const SizedBox(height: 80),
                            ],
                          );
                        } else {
                          return buildContistantCard(
                            context,
                            receiptsList[index],
                            "",
                            userData,
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// "\u20B9 " + courseInfo.inrAmount.toString()
Widget buildContistantCard(BuildContext context, course, pageType, userData) {
  final courseInfo = PaymentDetails.fromMap(course);
  return generateCard(
    "icon",
    Icons.receipt,
    courseInfo.courseName.toString(),
    "View Receipt",
    () {
      Map<String, String> pathParams = {
        'eventID': courseInfo.courseId.toString(),
      };

      context.goNamed('receiptDetails', pathParameters: pathParams);
    },
    'next',
  );
}
