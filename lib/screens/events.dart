// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:go_router/go_router.dart';

import '../constants/color_constant.dart';
import '../constants/constants.dart';
import '../model/course_detail_model.dart';
import '../providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';

// ignore: must_be_immutable
class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _ContistantsState();
}

class _ContistantsState extends State<Events> {
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
    if (userData.userId == null) {
      return Scaffold(
        body: Center(
          child:
              CircularProgressIndicator(), // Show loading spinner until data is available
        ),
      );
    }
    Stream<QuerySnapshot<Map<String, dynamic>>> streamQuery;
    var userCourses = userData.bharatCourses;
    if (userCourses != null && userCourses.isNotEmpty) {
      streamQuery =
          FirebaseFirestore.instance
              .collection(Constants.courses)
              .where("active", isEqualTo: true)
              //.where(FieldPath.documentId, whereNotIn: userData.courses)
              .snapshots();
    } else {
      streamQuery =
          FirebaseFirestore.instance
              .collection(Constants.courses)
              .where("active", isEqualTo: true)
              .snapshots();
    }

    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar("Unregistered Payments"),
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
                            return const Text("No Events Found.");
                          },
                        ),
                      ),
                    );
                  }
                  // print(snapshot.data!.docs.length);
                  var eventsList = snapshot.data!.docs;

                  // step - 1 remove the course which user already registered

                  eventsList =
                      eventsList.where((event) {
                        // Assuming the course ID in Firestore is stored in 'courseId' field.
                        String courseId =
                            event
                                .id; // Modify this to match your Firestore field.

                        // Return true for events that are NOT in the userCourses list.
                        return !userCourses!.contains(courseId);
                      }).toList();
                  List<Map<String, dynamic>> updatedEventsList = [];
                  List<QueryDocumentSnapshot<Map>> otherEvents;
                  otherEvents = eventsList.toList();
                  for (var doc in otherEvents) {
                    var currentEvent = doc.data() as Map<String, dynamic>;
                    currentEvent['id'] = doc.id;
                    updatedEventsList.add(currentEvent);
                  }
                  /******************* OLD Logic ***** 
                    // // Separate out silver badge category events
                    var silverEvents = eventsList.where((doc) {
                      var event = doc.data() as Map<String,
                          dynamic>; // Cast data to Map<String, dynamic>
                      return event['badgeCategory'] == 'SILVER';
                    }).toList();

                    // var bronzeEvents = eventsList.where((doc) {
                    //   var event = doc.data() as Map<String,
                    //       dynamic>; // Cast data to Map<String, dynamic>
                    //   return event['badgeCategory'] == 'BRONZE';
                    // }).toList();

                    // var familyEvents = eventsList.where((doc) {
                    //   var event = doc.data() as Map<String,
                    //       dynamic>; // Cast data to Map<String, dynamic>
                    //   return event['badgeCategory'] == 'FAMILY';
                    // }).toList();

                    // var onlineEvents = eventsList.where((doc) {
                    //   var event = doc.data() as Map<String,
                    //       dynamic>; // Cast data to Map<String, dynamic>
                    //   return event['badgeCategory'] == 'ONLINE';
                    // }).toList();

                    // var singleEvents = eventsList.where((doc) {
                    //   var event = doc.data() as Map<String,
                    //       dynamic>; // Cast data to Map<String, dynamic>
                    //   return event['badgeCategory'] == 'SINGLE';
                    // }).toList();

                    // var upgradeEvents = eventsList.where((doc) {
                    //   var event = doc.data() as Map<String,
                    //       dynamic>; // Cast data to Map<String, dynamic>
                    //   return event['badgeCategory'] == 'UPGRADE';
                    // }).toList();
                    // String userBelongsTo = "New";

// Now, check payment status and adjust visibility

                    if (userCourses != null && userCourses.isNotEmpty) {
                      //print(userCourses);
                      // checking silver course count
                      int countSilverCourses = userCourses
                          .where((course) =>
                              Constants.silverEventIds.contains(course))
                          .length;

                      // print(countSilverCourses);

                      // checking bronze course count
                      int countBronzeCourses = userCourses
                          .where((course) =>
                              Constants.bronzeEventIds.contains(course))
                          .length;

                      // checking upgrade course count
                      int countUpgradeCourses = userCourses
                          .where((course) =>
                              Constants.upgradeEventIds.contains(course))
                          .length;

                      // checking online course count
                      int countOnlineCourses = userCourses
                          .where((course) =>
                              Constants.onlineEventIds.contains(course))
                          .length;

                      // checking family course count
                      int countFamilyCourses = userCourses
                          .where((course) =>
                              Constants.familyEventIds.contains(course))
                          .length;
                      // checking single course count
                      int countSingleCourses = userCourses
                          .where((course) =>
                              Constants.singleEventIds.contains(course))
                          .length;
                      // print(countSingleCourses);
                      if (countSilverCourses == 0 &&
                          silverEvents.isEmpty &&
                          (countOnlineCourses == 0 &&
                              countFamilyCourses == 0 &&
                              countSingleCourses == 0)) {
                        otherEvents = eventsList.toList();
                        // print("case -1");
                      }
                      if (countSilverCourses == 0 &&
                          silverEvents.isNotEmpty &&
                          (countOnlineCourses == 0 &&
                              countFamilyCourses == 0 &&
                              countSingleCourses == 0 &&
                              countBronzeCourses == 0 &&
                              countUpgradeCourses == 0)) {
                        // print("case -2");
                        silverEvents.sort((a, b) {
                          var eventA = a.data() as Map<String, dynamic>;
                          var eventB = b.data() as Map<String, dynamic>;
                          return eventA['badgeID'].compareTo(eventB['badgeID']);
                        });

                        var firstEvent =
                            silverEvents[0].data() as Map<String, dynamic>;
                        firstEvent['id'] = silverEvents[0].id;
                        updatedEventsList.add(firstEvent);

                        otherEvents = eventsList.where((doc) {
                          var event = doc.data() as Map<String,
                              dynamic>; // Cast data to Map<String, dynamic>
                          return (event['badgeCategory'] != 'SILVER');
                        }).toList();
                      } else if (countSilverCourses == 1 &&
                          silverEvents.isNotEmpty) {
                        // print("case -3");
                        var firstEvent =
                            silverEvents[0].data() as Map<String, dynamic>;
                        firstEvent['id'] = silverEvents[0].id;
                        updatedEventsList.add(firstEvent);

                        otherEvents = eventsList.where((doc) {
                          var event = doc.data() as Map<String,
                              dynamic>; // Cast data to Map<String, dynamic>
                          return (event['badgeCategory'] != 'SILVER' &&
                              event['badgeCategory'] != 'BRONZE' &&
                              event['badgeCategory'] != 'FAMILY' &&
                              event['badgeCategory'] != 'ONLINE' &&
                              event['badgeCategory'] != 'SINGLE' &&
                              event['badgeCategory'] != 'UPGRADE');
                        }).toList();
                      } else if (countSilverCourses == 2) {
                        // print("case -4");
                        otherEvents = eventsList.where((doc) {
                          var event = doc.data() as Map<String,
                              dynamic>; // Cast data to Map<String, dynamic>
                          return (event['badgeCategory'] != 'SILVER' &&
                              event['badgeCategory'] != 'BRONZE' &&
                              event['badgeCategory'] != 'FAMILY' &&
                              event['badgeCategory'] != 'ONLINE' &&
                              event['badgeCategory'] != 'SINGLE' &&
                              event['badgeCategory'] != 'UPGRADE');
                        }).toList();
                      } else if (countBronzeCourses == 0 &&
                          countUpgradeCourses == 1) {
                        // print("case -5");
                        otherEvents = eventsList.where((doc) {
                          var event = doc.data() as Map<String,
                              dynamic>; // Cast data to Map<String, dynamic>
                          return (event['badgeCategory'] != 'SILVER' &&
                              event['badgeCategory'] != 'BRONZE' &&
                              event['badgeCategory'] != 'FAMILY' &&
                              event['badgeCategory'] != 'ONLINE' &&
                              event['badgeCategory'] != 'SINGLE');
                        }).toList();
                      } else if (countUpgradeCourses == 0 &&
                          countBronzeCourses == 1) {
                        // print("case -6");
                        otherEvents = eventsList.where((doc) {
                          var event = doc.data() as Map<String,
                              dynamic>; // Cast data to Map<String, dynamic>
                          return (event['badgeCategory'] != 'SILVER' &&
                              event['badgeCategory'] != 'BRONZE' &&
                              event['badgeCategory'] != 'FAMILY' &&
                              event['badgeCategory'] != 'ONLINE' &&
                              event['badgeCategory'] != 'SINGLE');
                        }).toList();
                      } else if (countFamilyCourses == 1) {
                        // print("case -6");
                        otherEvents = eventsList.where((doc) {
                          var event = doc.data() as Map<String,
                              dynamic>; // Cast data to Map<String, dynamic>
                          return (event['badgeCategory'] != 'SILVER' &&
                              event['badgeCategory'] != 'BRONZE' &&
                              event['badgeCategory'] != 'ONLINE' &&
                              event['badgeCategory'] != 'SINGLE');
                        }).toList();
                      } else {
                        // print("case - 8");
                        otherEvents = eventsList.where((doc) {
                          var event = doc.data() as Map<String,
                              dynamic>; // Cast data to Map<String, dynamic>
                          return (event['badgeCategory'] != 'SILVER' &&
                              event['badgeCategory'] != 'BRONZE' &&
                              event['badgeCategory'] != 'FAMILY' &&
                              event['badgeCategory'] != 'ONLINE' &&
                              event['badgeCategory'] != 'SINGLE' &&
                              event['badgeCategory'] != 'UPGRADE');
                        }).toList();
                      }
                      //otherEvents = [];
                    } else {
                      if (silverEvents.isEmpty) {
                        // no active silver events
                        otherEvents = eventsList.toList();
                      } else {
                        // Sort silver events by badgeID (should be -1 and -2)
                        silverEvents.sort((a, b) {
                          var eventA = a.data() as Map<String, dynamic>;
                          var eventB = b.data() as Map<String, dynamic>;
                          return eventA['badgeID'].compareTo(eventB['badgeID']);
                        });

                        var firstEvent =
                            silverEvents[0].data() as Map<String, dynamic>;
                        firstEvent['id'] = silverEvents[0].id;
                        updatedEventsList.add(firstEvent);

                        otherEvents = eventsList.where((doc) {
                          var event = doc.data() as Map<String,
                              dynamic>; // Cast data to Map<String, dynamic>
                          return (event['badgeCategory'] != 'SILVER');
                        }).toList();
                      }
                    }

                    // if (silverEvents.isNotEmpty &&
                    //     singleEvents.length == 1 &&
                    //     familyEvents.length == 1 &&
                    //     onlineEvents.length == 1 &&
                    //     bronzeEvents.length == 1 &&
                    //     upgradeEvents.isNotEmpty) {
                    //   // Sort silver events by badgeID (should be -1 and -2)
                    //   silverEvents.sort((a, b) {
                    //     var eventA = a.data() as Map<String, dynamic>;
                    //     var eventB = b.data() as Map<String, dynamic>;
                    //     return eventA['badgeID'].compareTo(eventB['badgeID']);
                    //   });

                    // } else if (bronzeEvents.isEmpty &&
                    //     upgradeEvents.isNotEmpty) {
                    //   otherEvents = eventsList.where((doc) {
                    //     var event = doc.data() as Map<String,
                    //         dynamic>; // Cast data to Map<String, dynamic>
                    //     return (event['badgeCategory'] != 'SILVER' &&
                    //         event['badgeCategory'] != 'BRONZE' &&
                    //         event['badgeCategory'] != 'FAMILY' &&
                    //         event['badgeCategory'] != 'ONLINE' &&
                    //         event['badgeCategory'] != 'SINGLE');
                    //   }).toList();
                    // } else if (upgradeEvents.isEmpty) {
                    //   otherEvents = eventsList.where((doc) {
                    //     var event = doc.data() as Map<String,
                    //         dynamic>; // Cast data to Map<String, dynamic>
                    //     return (event['badgeCategory'] != 'SILVER' &&
                    //         event['badgeCategory'] != 'BRONZE' &&
                    //         event['badgeCategory'] != 'FAMILY' &&
                    //         event['badgeCategory'] != 'ONLINE' &&
                    //         event['badgeCategory'] != 'SINGLE');
                    //   }).toList();
                    // } else {
                    //   otherEvents = eventsList.where((doc) {
                    //     var event = doc.data() as Map<String,
                    //         dynamic>; // Cast data to Map<String, dynamic>
                    //     return (event['badgeCategory'] != 'SILVER' &&
                    //         event['badgeCategory'] != 'BRONZE' &&
                    //         event['badgeCategory'] != 'FAMILY' &&
                    //         event['badgeCategory'] != 'ONLINE' &&
                    //         event['badgeCategory'] != 'SINGLE' &&
                    //         event['badgeCategory'] != 'UPGRADE');
                    //   }).toList();
                    // }

                    for (var doc in otherEvents) {
                      var currentEvent = doc.data() as Map<String, dynamic>;
                      currentEvent['id'] = doc.id;
                      updatedEventsList.add(currentEvent);
                    }
                    //print(updatedEventsList.length);
*/
                  if (updatedEventsList.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Builder(
                          builder: (context) {
                            return const Text("No Events Found.");
                          },
                        ),
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(), // new line
                      itemCount: updatedEventsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index + 1 == updatedEventsList.length) {
                          return Column(
                            children: [
                              buildContistantCard(
                                context,
                                updatedEventsList[index],
                                "",
                                userData,
                              ),
                              const SizedBox(height: 80),
                            ],
                          );
                        } else {
                          return buildContistantCard(
                            context,
                            updatedEventsList[index],
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
  final courseInfo = CourseDetailModel.fromMapNew(course);
  var listIcon = Icons.event;
  if (course['badgeCategory'] == 'SILVER') {
    listIcon = Icons.family_restroom;
  }
  if (course['badgeCategory'] == 'BRONZE') {
    listIcon = Icons.fluorescent;
  }
  if (course['badgeCategory'] == 'FAMILY') {
    listIcon = Icons.group;
  }
  if (course['badgeCategory'] == 'ONLINE') {
    listIcon = Icons.online_prediction;
  }
  if (course['badgeCategory'] == 'SINGLE') {
    listIcon = Icons.person;
  }
  if (course['badgeCategory'] == 'UPGRADE') {
    listIcon = Icons.upgrade;
  }
  return generateCard(
    "icon",
    listIcon,
    courseInfo.name.toString(),
    "Register Now",
    () {
      Map<String, String> pathParams = {
        'eventID': courseInfo.courseId.toString(),
      };

      context.goNamed('eventDetails', pathParameters: pathParams);
    },
    'next',
  );
}
