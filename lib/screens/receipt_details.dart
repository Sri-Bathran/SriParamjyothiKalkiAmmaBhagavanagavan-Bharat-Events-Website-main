// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../constants/color_constant.dart';
import '../constants/constants.dart';
import '../model/course_detail_model.dart';
import '../model/receipt_detail_model.dart';
import '../model/user_model.dart';
import '../providers/user_provider.dart';
import 'package:flutter/material.dart';
import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';

class ReceiptDetailes extends StatefulWidget {
  final String eventID;
  final CourseDetailModel? course;
  const ReceiptDetailes({super.key, required this.eventID, this.course});

  @override
  VideoDetailViewState createState() => VideoDetailViewState();
}

class VideoDetailViewState extends State<ReceiptDetailes> {
  List<String> dasajiNamesList = <String>[];
  // ignore: prefer_typing_uninitialized_variables
  // form key
  final _formKey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  var userMap;
  bool isLoading = false;
  late UserModel loggedInUser;
  // editing controller

  @override
  void initState() {
    super.initState();

    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eventID = widget.eventID;
    final userData = context.watch<UserProvider>().loggedInUser;
    var streamQuery =
        FirebaseFirestore.instance
            .collection(Constants.users)
            .doc(userData.userId)
            .collection(Constants.userHomaPayments)
            .doc(eventID)
            .get();

    // final loginButton =
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar("View Receipt"),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // headerNetworkImage(context, courseInfo.image!),
                const SizedBox(height: 2.0),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: streamQuery,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    // final availableCoursesList =
                    //     CourseModel.fromMap(snapshot.data);
                    // List<CourseDetailModel>? ucCoursesList = [];
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Builder(
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                      );
                    }
                    final courseInfo = PaymentDetails.fromMap(snapshot.data);
                    // print(courseInfo.screenshot);
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: createContainer(
                        context,
                        Column(
                          children: [
                            buildSubHeading(context, 'Payment Information'),
                            buildRecordData(
                              "Payee Name",
                              courseInfo.name.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Payee Phone",
                              courseInfo.phone.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Email",
                              courseInfo.email.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Address",
                              courseInfo.address.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "City",
                              courseInfo.cityOrDist.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "State",
                              courseInfo.state.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Country",
                              courseInfo.country.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Pincode",
                              courseInfo.pincode.toString(),
                            ),

                            buildHorizantalLine(),
                            buildRecordData(
                              "Aadhaar",
                              courseInfo.aadharOrPan.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Pancard",
                              courseInfo.pancardNumber.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Leader's Name",
                              courseInfo.leaderName.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Leader's City",
                              courseInfo.leaderCity.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Phone Number (for family absent)",
                              courseInfo.absentPhone.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Participant Name",
                              courseInfo.participantName.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Participant Phone",
                              courseInfo.participantPhone.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordDataFull(
                              "Event Name",
                              courseInfo.courseName.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Amount",
                              '\u{20B9} ${courseInfo.amount}',
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Payment On",
                              courseInfo.paymentDate.toString(),
                            ),

                            buildHorizantalLine(),
                            buildRecordData(
                              "Transaction ID /UPI ID",
                              courseInfo.upiID.toString(),
                            ),
                            buildHorizantalLine(),
                            buildRecordData(
                              "Bank Name",
                              courseInfo.bankName.toString(),
                            ),
                            SizedBox(height: 20),
                            // Image.network(
                            //   'https://picsum.photos/536/354',
                            //   width: 150,
                            //   height: 150,
                            //   fit: BoxFit.cover,
                            // ),
                            GestureDetector(
                              onTap: () {
                                // Show the full image in a popup when the thumbnail is tapped
                                _showFullImage(
                                  context,
                                  courseInfo.screenshot.toString(),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      courseInfo.screenshot
                                          .toString(), //'https://picsum.photos/1000/600',
                                  width: 300,
                                  height: 200,
                                  fit: BoxFit.fill,
                                  placeholder:
                                      (context, url) =>
                                          Container(color: Colors.grey),
                                  errorWidget: (context, url, error) {
                                    //  print(error);
                                    return SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Color(0xffE6E6E6),
                                        ),
                                        child: Icon(
                                          Icons.image,
                                          color: Color(0xffCCCCCC),
                                          size: 80.0,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text('Tap the image to view it in full size'),
                            SizedBox(height: 20),
                            createButton("Edit Details", () {
                              // _generateAndDownloadInvoice(context);
                              // _generateAndDownloadInvoice(context, courseInfo);
                              Map<String, String> pathParams = {
                                'eventID': courseInfo.courseId.toString(),
                              };

                              context.goNamed(
                                'updateDetails',
                                pathParameters: pathParams,
                              );
                            }),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // commonCourseInfo(
                //     context, courseInfo, userData, widget.sourceFrom),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to show the full image in a popup
  void _showFullImage(BuildContext context, imageUrl) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allow tapping outside to close
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            color: Colors.black,
            child: Image.network(
              imageUrl, // Display full-size image
              fit: BoxFit.contain, // Fit the image within the dialog
            ),
          ),
        );
      },
    );
  }

  Future<void> downloadReceipt(fileName) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      // Reference to the file in Firebase Storage
      Reference fileRef = storage.ref().child('pjeReceipts/$fileName');

      // Get the download URL for the file
      String downloadUrl = await fileRef.getDownloadURL();

      // Trigger the download in the browser using the `html` package
      html.AnchorElement(href: downloadUrl)
        ..setAttribute('download', fileName) // Set the file name with user ID
        ..click(); // Programmatically trigger the download

      // print("Download initiated for: $fileName");
    } catch (e) {
      // print("Error downloading receipt: $e");
    }
  }
}
