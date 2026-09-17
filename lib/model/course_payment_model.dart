import 'package:cloud_firestore/cloud_firestore.dart';

class CoursePaymentModel {
  String? paymentDate;
  String? paymentId;
  String? paymentStatus;
  Timestamp? updatedDate;
  CoursePaymentModel(
      {this.paymentDate, this.paymentId, this.paymentStatus, this.updatedDate});

  // receiving data from server
  // factory CoursePaymentModel.fromMap(map) {
  //   return CoursePaymentModel(
  //       paymentDate: map['paymentDate'],
  //       paymentId: map['paymentId'],
  //       paymentStatus: map['paymentStatus'],
  //       dateTime:
  //           (map.containsKey("dateTime")) ? map['dateTime'] : "20/01/2022");
  // }

  CoursePaymentModel.fromSnapshot(snapshot)
      : paymentDate = (snapshot.data().containsKey("paymentDate"))
            ? snapshot.data()['paymentDate']
            : "NA",
        paymentId = (snapshot.data().containsKey("paymentId") &&
                snapshot.data()['paymentId'] != null)
            ? snapshot.data()['paymentId']
            : "NA",
        paymentStatus = (snapshot.data().containsKey("paymentStatus"))
            ? snapshot.data()['paymentStatus']
            : "NA",
        updatedDate = (snapshot.data().containsKey("updatedDate") &&
                snapshot.data()['updatedDate'].runtimeType == Timestamp)
            ? snapshot.data()['updatedDate']
            : Timestamp.fromDate(DateTime.now());
}
