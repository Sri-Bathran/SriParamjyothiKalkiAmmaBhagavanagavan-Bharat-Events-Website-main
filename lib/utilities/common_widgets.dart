import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:pdf/widgets.dart' as pw;
import '../constants/color_constant.dart';
import '../constants/constants.dart';
import '../constants/style_constant.dart';
import '../providers/user_provider.dart';
import 'dialog_widget.dart';

Container headerImage(context, imageFile) {
  return Container(
    // height: MediaQuery.of(context).size.height * .35,
    height: 240.0,
    decoration: BoxDecoration(
      color: bgColorLightGold,
      image: DecorationImage(image: AssetImage(imageFile), fit: BoxFit.fill),
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20.0)),
    ),
  );
}

headerNetworkImage(context, imageFile) {
  return SizedBox(
    // height: MediaQuery.of(context).size.height * .35,
    height: 200.0,
    child: CachedNetworkImage(
      imageUrl: imageFile,
      imageBuilder:
          (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(0.0),
              ),
            ),
          ),
      placeholder:
          (context, url) => Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40.0),
              ),
              color: bgColorLightYellow,
            ),
          ),
      errorWidget: (context, url, error) {
        return headerImage(context, "assets/notifications.png");
      },
    ),
  );
  // return Container(
  //   height: 240.0,
  //   decoration: BoxDecoration(
  //     color: bgColorLightGold,
  //     image: DecorationImage(
  //       image: NetworkImage(imageFile),
  //       fit: BoxFit.fill,
  //     ),
  //     borderRadius: const BorderRadius.vertical(
  //       bottom: Radius.circular(40.0),
  //     ),
  //   ),
  // );
}

centerHeadingWithSubTitle(title, subTitle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(title, style: pageTitleStyle),
      if (subTitle != "") const SizedBox(height: 10.0),
      if (subTitle != "")
        Padding(
          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(subTitle, style: pageSubTitleStyle),
        ),
      const SizedBox(height: 15.0),
      Container(
        height: 2,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColorPinkDark,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      const SizedBox(height: 20.0),
    ],
  );
}

createButton(buttonLabelName, onPressedFunction) {
  return Material(
    elevation: 2,
    borderRadius: BorderRadius.circular(15.0),
    color: appBarColor,
    child: MaterialButton(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
      //minWidth: 200.0,
      onPressed: onPressedFunction,
      child: Text(
        buttonLabelName,
        textAlign: TextAlign.center,
        style: pageButtonStyle,
      ),
    ),
  );
}

createAppBar(appBarTitle) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Text(appBarTitle, style: mAppBarStyle)],
    ),
    backgroundColor: appBarColor,
    foregroundColor: mBackgroundColor,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}

buildServiceItem(
  BuildContext context,
  serviceName,
  serviceText,
  serviceIcon,
  serviceLink,
  marginLeftValue,
  marginRightValue,
  isNewCourseAdded,
) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(left: marginLeftValue, right: marginRightValue),
      padding: const EdgeInsets.only(left: 10),
      height: 75,
      decoration: BoxDecoration(
        color: cFigma,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: mBorderColor, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 153, 142, 133),
            blurRadius: 0.5, // soften the shadow
            spreadRadius: 0.5, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              0.8, // Move to bottom 5 Vertically
            ),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          if (serviceLink.runtimeType == String) {
            context.goNamed(serviceLink);
          } else {
            context.goNamed(
              serviceLink['name'],
              pathParameters: <String, String>{
                'newCatIds': serviceLink['queryParameters'].toString(),
              },
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: <Widget>[
                Icon(serviceIcon, size: 36, color: bgColorPinkDark),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(serviceName, style: mServiceTitleStyle),
                      if (serviceText != "") const SizedBox(height: 0.8),
                      if (serviceText != "")
                        Text(serviceText, style: mServiceTitleStyle),
                    ],
                  ),
                ),
              ],
            ),
            if (isNewCourseAdded == 1)
              Text('New Event Added', style: mNewCourseAdded),
          ],
        ),
      ),
    ),
  );
}

Widget generateCard(
  leadingType,
  serviceicon,
  mainTitle,
  subTitle,
  actionFunction,
  iconType,
) {
  return Card(
    margin: const EdgeInsets.only(bottom: 15),
    elevation: 5,
    clipBehavior: Clip.antiAlias,
    color: cFigma,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: actionFunction,
        child: ListTile(
          contentPadding: const EdgeInsets.all(4.0),
          leading:
              (leadingType == 'image')
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: CachedNetworkImage(
                      imageUrl: serviceicon,
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Container(color: cAdobeAF),
                      errorWidget: (context, url, error) {
                        return headerImage(context, "assets/notifications.png");
                      },
                    ),
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: CircleAvatar(
                      backgroundColor: cAdobeAF,
                      radius: 30,
                      child: Icon(
                        serviceicon,
                        color: bgColorPinkDark,
                        size: 40.0,
                      ),
                    ),
                  ),
          title: Text(mainTitle.toString(), maxLines: 2, style: mListTitle),
          subtitle:
              (subTitle.toString() == "newEventAdded" ||
                      subTitle.toString() == "newEvent")
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (subTitle.toString() == "newEventAdded")
                            ? 'New Event Added'
                            : 'New Event',
                        maxLines: 1,
                        style: mNewCourseAdded,
                      ),
                      Text('View Details', maxLines: 1, style: mListText),
                    ],
                  )
                  : Text(subTitle.toString(), maxLines: 2, style: mListText),
          // trailing: const Icon(
          //   Icons.keyboard_arrow_right,
          // ),
          trailing:
              (iconType == 'play')
                  ? CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 20,
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: const Icon(Icons.play_arrow, color: Colors.white),
                      //color: Colors.white,
                      // onPressed: () {},
                    ),
                  )
                  : const Icon(Icons.keyboard_arrow_right),
        ),
      ),
    ),
  );
}

Widget buildSubHeading(context, headingName) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.all(10.0),
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(color: containerColor),
    child: Text(headingName, style: mSubHeading),
  );
}

Widget buildHorizantalLine() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(height: 0.5, color: Colors.grey),
  );
}

Widget buildRecordData(fieldName, fieldValue) {
  if (fieldValue != 'null') {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(flex: 4, child: Text(fieldName, style: mFieldName)),
          Expanded(flex: 8, child: Text(fieldValue, style: mFieldValue)),
        ],
      ),
    );
  } else {
    return Container();
  }
}

Widget buildRecordDataHeading(fieldName) {
  if (fieldName != 'null') {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 15.0, bottom: 0.0, left: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(fieldName, style: mFieldName)],
      ),
    );
  } else {
    return Container();
  }
}

Widget buildRecordDataFull(fieldName, fieldValue) {
  if (fieldValue != 'null') {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fieldName, style: mFieldName),
          Text(fieldValue, style: mFieldValue),
        ],
      ),
    );
  } else {
    return Container();
  }
}

Container createContainer(context, additionWidgets) {
  return Container(
    decoration: BoxDecoration(
      color: mWhiteColor,
      border: Border.all(color: containerColor, width: 3),
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
    ),
    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
    child: additionWidgets,
  );
}

commonCourseInfo(BuildContext context, courseInfo, userData, sourceFrom) {
  // DateTime orderedDate = courseInfo.eventDateTime!.toDate();
  // DateTime endDate = courseInfo.endDateTime!.toDate();
  //Uri zoomURL = Uri.parse(courseInfo.zoomLink.toString());
  //var pageCatTitle = "";
  return createContainer(
    context,
    Column(
      children: [
        // buildSubHeading(context, 'Event Information'),
        buildRecordDataFull("Event Name", courseInfo.name.toString()),
        // buildRecordDataFull(
        //     "Amount", "\u20B9 " + courseInfo.inrAmount.toString()),
        buildHorizantalLine(),
        buildRecordDataFull("Description", courseInfo.description.toString()),
        buildHorizantalLine(),
        buildRecordData("Amount", '\u{20B9} ${courseInfo.inrAmount}'),
        // buildRecordDataFull("End Date",
        //     DateFormat('dd-MMM-yyy hh:mm a').format(endDate).toString()),
        const SizedBox(height: 15.0),
        // if (sourceFrom == 'registered') buildHorizantalLine(),
        if (sourceFrom == 'registered')
          buildRecordDataFull(
            "${courseInfo.linkType} Link",
            courseInfo.zoomLink.toString(),
          ),
        if (sourceFrom == 'registered' && courseInfo.linkType == 'Registration')
          buildHorizantalLine(),
        if (sourceFrom == 'registered' && courseInfo.linkType == 'Registration')
          buildRecordDataFull(
            'Registration Info',
            courseInfo.registrationText.toString(),
          ),
        if (sourceFrom == 'registered')
          Center(
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: bgColorPinkDark,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () async {
                  //await launchUrl(zoomURL);
                },
                //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "test",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),

                //  color: Color(0xff0f194a),
              ),
            ),
          ),
        if (sourceFrom == 'upcoming')
          createPayCards(
            "Get ZOOM Link",
            "will share you the Meeting details",
            "Register",
            () async {
              showProcessDialog(context);
              await FirebaseFirestore.instance
                  .collection(Constants.users)
                  .doc(userData.userId)
                  .update({
                    'courses': FieldValue.arrayUnion([courseInfo.courseId]),
                  });
              await FirebaseFirestore.instance
                  .collection(Constants.users)
                  .doc(userData.userId)
                  .collection('user_payments')
                  .doc(courseInfo.courseId)
                  .set({
                    'courseId': courseInfo.courseId,
                    'email': userData.email,
                    'phone': userData.phone,
                    'userId': userData.userId,
                    'paymentStatus': "Approved",
                    'updatedDate': Timestamp.fromDate(DateTime.now()),
                    'createdOn': Timestamp.fromDate(DateTime.now()),
                    'amount': courseInfo.inrAmount,
                    "paymentType": "Free",
                  });
              // ignore: use_build_context_synchronously
              Provider.of<UserProvider>(context, listen: false).getUserData();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
              // ignore: use_build_context_synchronously
              context.goNamed('paymentSuccess');
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (c) => const PaymentSuccess()),
              //     (route) => false);
            },
          ),

        const SizedBox(height: 20.0),
      ],
    ),
  );
}

createPayCards(tilte, subTitle, buttonText, onTapFunction) {
  return Card(
    margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
    color: bgColorLightYellow,
    child: ListTile(
      contentPadding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      title: Text(tilte, maxLines: 1, style: mListTitle),
      subtitle: Text(subTitle, style: mSubHeading),
      trailing: InkWell(
        onTap: onTapFunction,
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            color: bgColorPinkDark,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

const _chars = 'AaBbCcDdEeFfGgHhKkLMmNnPpQqRrTtUuVvWwXxYyZz123456789';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
  Iterable.generate(
    length,
    (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
  ),
);

Future<Uint8List> generateInvoicePdf(courseInfo) async {
  final String productName = courseInfo['courseName'];
  final int productPrice = courseInfo['amount'];
  final String logoHeaderPath =
      'assets/invoice_header.png'; // Path to your logo image
  final String logoFooterPath = 'assets/invoice_footer.png';
  final String userName = courseInfo['name'];
  final String userAddress =
      '${courseInfo['address']}\n${courseInfo['cityOrDist']}, ${courseInfo['state']}\n${courseInfo['pincode']}';

  // Invoice Number and Date
  final String invoiceNumber = courseInfo['receiptNumber'];
  final String invoiceDate = courseInfo['paymentDate'];
  final String transactionID = courseInfo['paymentId'];
  final String phone = courseInfo['phone'];
  final String email = courseInfo['email'];
  String badgeCategory = "NA";
  if (courseInfo['badgeCategory'] != null &&
      courseInfo['badgeCategory'].toString().isNotEmpty) {
    badgeCategory = courseInfo['badgeCategory'];
  }

  final int noOfparticipants = courseInfo['noOfparticipants'];
  Map<String, dynamic> additionalFields = courseInfo['additionalFields'];
  // final DateFormat dateFormat = DateFormat('dd MMMM yyyy');

  final pdf = pw.Document();

  // Load logo image from assets
  final logoHeaderImage = pw.MemoryImage(
    (await rootBundle.load(logoHeaderPath)).buffer.asUint8List(),
  );

  final logoFooterImage = pw.MemoryImage(
    (await rootBundle.load(logoFooterPath)).buffer.asUint8List(),
  );

  // Convert price to words
  final currencyInWords = NumberToWordsEnglish.convert(productPrice);

  final font = await loadFont('assets/Alexandria.ttf');

  // Add a page to the document
  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.all(0),
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Background design (e.g., a colored box)
            pw.Container(
              width: double.infinity, // Full width
              height: 80, // Height for the background
              color: PdfColor.fromHex("#143343"), // Light gray background color
              child: pw.Padding(
                padding: const pw.EdgeInsets.only(left: 60.0, top: 25),
                child: pw.Text(
                  'INVOICE',
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 50,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromHex("#b8954d"), // Text color
                  ),
                ),
              ),
            ),
            //Header: Logo and Company Details
            pw.Container(
              width: double.infinity, // Set full width
              height:
                  60, // Set a specific height if necessary (adjust as needed)
              child: pw.Image(
                logoHeaderImage,
                fit:
                    pw
                        .BoxFit
                        .fill, // Ensure the image covers the full container area
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Padding(
              padding: pw.EdgeInsets.only(left: 20.0),
              child: pw.Column(
                crossAxisAlignment:
                    pw.CrossAxisAlignment.start, // Aligning text to the left
                children: [
                  pw.SizedBox(height: 10),
                  pw.Text(
                    "Sacred Rituals",
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 35,
                      color: PdfColor.fromHex("#b8954d"),
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                  pw.SizedBox(height: 3),
                  pw.Text(
                    "No. 525, Thiruvallur High Road,\nSri Amma Bhagavan Temple,\nAndersonpet, Nemam,\nThiruvallur - 600124",
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 14,
                      lineSpacing: 4,
                      color: PdfColor.fromHex("#6d6055"),
                    ),
                  ),
                ],
              ),
            ),

            pw.SizedBox(height: 6),
            pw.Padding(
              padding: pw.EdgeInsets.all(10),
              child: pw.Column(
                children: [
                  pw.TableHelper.fromTextArray(
                    tableWidth: pw.TableWidth.max,
                    headers: ['Invoice No.', 'Date', 'Event', 'Amt'],
                    data: [
                      [
                        invoiceNumber,
                        invoiceDate,
                        productName,
                        'Rs.${productPrice.toStringAsFixed(2)}',
                      ],
                    ],
                    cellAlignment: pw.Alignment.centerLeft,
                    border: pw.TableBorder.all(
                      width: 0.5,
                      color: PdfColor.fromHex("#b7944f"),
                    ),
                    headerStyle: pw.TextStyle(
                      font: font,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white,
                    ),
                    headerDecoration: pw.BoxDecoration(
                      border: null,
                      color: PdfColor.fromHex("#b7944f"),
                      borderRadius: pw.BorderRadius.all(pw.Radius.circular(0)),
                    ),
                    cellStyle: pw.TextStyle(
                      font: font,
                      fontSize: 11,
                      color: PdfColor.fromHex("#28211b"),
                    ),
                    cellPadding: pw.EdgeInsets.all(8),
                  ),

                  pw.SizedBox(height: 10),

                  // Total Section with Shadow and Rounded Borders
                  pw.Container(
                    padding: pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                      color: PdfColor.fromHex("#fff"),
                      border: pw.Border.all(color: PdfColor.fromHex("#b7944f")),
                      borderRadius: pw.BorderRadius.circular(10),
                      boxShadow: [
                        pw.BoxShadow(
                          color: PdfColors.white,
                          blurRadius: 6,
                          // offset: pw.Offset(0, 3)
                        ),
                      ],
                    ),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Amount in Words: $currencyInWords rupees only',
                          style: pw.TextStyle(
                            font: font,
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 10),

                  // Row with 50% empty and 50% with data and border radius
                  pw.Row(
                    children: [
                      // Empty 50%
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          child: pw.Text(
                            "UPI Transaction ID: $transactionID",
                            textAlign: pw.TextAlign.left,
                            style: pw.TextStyle(
                              font: font,
                              fontSize: 13,
                              color: PdfColor.fromHex("#2a1e0e"),
                            ),
                          ),
                        ),
                      ),
                      // Data 50% with border radius
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          padding: pw.EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: pw.BoxDecoration(
                            color: PdfColor.fromHex("#b7944f"),
                            //border: pw.Border.all(color: PdfColors.blueGrey800),
                            borderRadius: pw.BorderRadius.circular(15),
                            boxShadow: [
                              pw.BoxShadow(
                                color: PdfColors.white,
                                blurRadius: 6,
                                // offset: pw.Offset(0, 3)
                              ),
                            ],
                          ),
                          child: pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(
                                'TOTAL',
                                style: pw.TextStyle(
                                  font: font,
                                  color: PdfColors.white,
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                'Rs.${productPrice.toStringAsFixed(2)}',
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 11,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Column(
                          crossAxisAlignment:
                              pw
                                  .CrossAxisAlignment
                                  .start, // Aligning text to the left
                          children: [
                            pw.SizedBox(height: 10),
                            pw.Text(
                              userName,
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 15,
                                color: PdfColor.fromHex("#b8954d"),
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.SizedBox(height: 3),
                            pw.Text(
                              userAddress,
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 11,
                                lineSpacing: 3,
                                color: PdfColor.fromHex("#6d6055"),
                              ),
                            ),
                            pw.Text(
                              "Email: $email",
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 11,
                                color: PdfColor.fromHex("#6d6055"),
                              ),
                            ),
                            pw.Text(
                              "Phone: $phone",
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 11,
                                color: PdfColor.fromHex("#6d6055"),
                              ),
                            ),
                            pw.SizedBox(height: 6),
                          ],
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Column(
                          crossAxisAlignment:
                              pw
                                  .CrossAxisAlignment
                                  .start, // Aligning text to the left
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.SizedBox(height: 10),
                            if (badgeCategory == "MULTIPLE" &&
                                noOfparticipants > 0) ...[
                              pw.Text(
                                "Participants",
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 15,
                                  color: PdfColor.fromHex("#b8954d"),
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.SizedBox(height: 3),
                              for (int i = 1; i <= noOfparticipants; i++)
                                pw.Text(
                                  "$i. ${additionalFields['participant_name_$i'] ?? ''}",
                                  style: pw.TextStyle(
                                    font: font,
                                    fontSize: 11,
                                    lineSpacing: 3,
                                    color: PdfColor.fromHex("#6d6055"),
                                  ),
                                ),
                            ],
                            pw.SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment:
                        pw
                            .CrossAxisAlignment
                            .start, // Aligning text to the left
                    children: [
                      // Footer with Dark Background and Contact Info
                      pw.Divider(color: PdfColor.fromHex("#eee")),
                      pw.Container(
                        padding: pw.EdgeInsets.all(10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            // Heading: Terms and Conditions (Bold and Larger Font)
                            pw.Text(
                              'Declaration:',
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 12, // Larger font size for heading
                                fontWeight: pw.FontWeight.bold, // Bold heading
                                color: PdfColors.grey,
                              ),
                            ),
                            pw.SizedBox(
                              height: 5,
                            ), // Space between heading and content
                            // Points: Normal text, smaller size
                            pw.Text(
                              '1. We declare that the amount charged is for the services provided or to be provided as mentioned in the invoice and contents in the invoice are true and correct.\n'
                              '2. Services rendered above are exempted from GST vide Notification No.12 / 2017 of Central Tax(Rate) under Chapter 99\n'
                              '3. This is computer generated invoice signature not required',
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 10, // Smaller font size for points
                                fontWeight:
                                    pw.FontWeight.normal, // Regular weight
                                color: PdfColors.grey,
                                lineSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            pw.Container(
              width: double.infinity, // Set full width
              height:
                  134, // Set a specific height if necessary (adjust as needed)
              child: pw.Image(
                logoFooterImage,
                fit:
                    pw
                        .BoxFit
                        .fill, // Ensure the image covers the full container area
              ),
            ),

            // Footer with Oval Background
          ],
        );
      },
    ),
  );
  // pdf.save();
  // Save the generated PDF to a file
  // await Printing.layoutPdf(onLayout: (format) => pdf.save());
  //return pdf.save();

  return pdf.save();
}

// Function to load the custom font from assets
Future<pw.Font> loadFont(String path) async {
  final fontData = await rootBundle.load(path);
  final fontBytes = fontData.buffer.asUint8List();
  return pw.Font.ttf(fontBytes.buffer.asByteData());
}

// Upload PDF to Firebase Storage
Future<String> uploadInvoiceToFirebase(
  Uint8List invoiceData,
  userPaymentInfo,
) async {
  try {
    final storageRef = FirebaseStorage.instance.ref().child(
      "pjeReceipts/${userPaymentInfo['subMerchantId']}_invoice.pdf",
    );
    await storageRef.putData(invoiceData);
    String downloadURL = await storageRef.getDownloadURL();
    return downloadURL;
  } catch (e) {
    // print("Error uploading invoice: $e");
    throw Exception("Failed to upload invoice");
  }
}
