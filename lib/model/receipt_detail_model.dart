import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentDetails {
  final String aadharOrPan;
  final String address;
  final String amount;
  final String cityOrDist;
  final String courseId;
  final String courseName;
  final String leaderName;
  final String leaderCity;
  final String email;
  final String emailphone;
  final String bankName;
  final String name;
  final String orderId;
  final String paymentDate;
  final String participantName;
  final String participantPhone;
  final String paymentStatus;
  final String absentPhone;
  final String phone;
  final String pincode;
  final String state;
  final String country;
  final Timestamp updatedDate;
  final String upiID;
  final String pancardNumber;
  final String screenshot;
  final String screenshotName;

  // Constructor to initialize all the fields
  PaymentDetails({
    required this.aadharOrPan,
    required this.address,
    required this.amount,
    required this.cityOrDist,
    required this.courseId,
    required this.courseName,
    required this.leaderName,
    required this.leaderCity,
    required this.email,
    required this.emailphone,
    required this.bankName,
    required this.name,
    required this.orderId,
    required this.paymentDate,
    required this.participantName,
    required this.participantPhone,
    required this.paymentStatus,
    required this.absentPhone,
    required this.phone,
    required this.pincode,
    required this.state,
    required this.country,
    required this.updatedDate,
    required this.upiID,
    required this.pancardNumber,
    required this.screenshot,
    required this.screenshotName,
  });

  // Method to convert JSON to PaymentDetails object
  factory PaymentDetails.fromMap(json) {
    return PaymentDetails(
      aadharOrPan: json['aadharOrPan'],
      address: json['address'],
      amount: json['amount'],
      cityOrDist: json['cityOrDist'],
      courseId: json['courseId'],
      courseName: json['courseName'],
      leaderName: json['leaderName'],
      leaderCity: json['leaderCity'],
      email: json['email'],
      emailphone: json['emailphone'],
      bankName: json['bankName'],
      name: json['name'],
      orderId: json['orderId'],
      paymentDate: json['paymentDate'],
      participantName: json['participantName'],
      participantPhone: json['participantPhone'],
      paymentStatus: json['paymentStatus'],
      absentPhone: json['absentPhone'],
      phone: json['phone'],
      pincode: json['pincode'],
      state: json['state'],
      country: json['country'],
      updatedDate: json['updatedDate'],
      upiID: json['upiID'],
      pancardNumber: json['pancardNumber'],
      screenshot: json['screenshot'],
      screenshotName: json['screenshot_name'],
    );
  }
}
