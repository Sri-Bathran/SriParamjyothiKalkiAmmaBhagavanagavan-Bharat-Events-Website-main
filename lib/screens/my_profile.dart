import 'dart:io';
import 'package:flutter/foundation.dart';

import '../constants/color_constant.dart';
import '../model/user_model.dart';
import '../providers/user_provider.dart';
//import '../screens/home_screen_before_login.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';
import 'login.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late UserModel loggedInUser;
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
    loggedInUser = context.watch<UserProvider>().loggedInUser;
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar("Profile"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (loggedInUser.name != null)
                _profileBuilder(context, loggedInUser)
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileBuilder(context, loggedInUser) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 12,
        ),
        _buildProfileImage(context, loggedInUser.profileImgUrl),
        (kIsWeb || Platform.isMacOS || 1 == 1)
            ? const SizedBox(
                height: 14.0,
              )
            : TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const EditProfileImage()));
                },
                child: const Text("Edit Image", style: TextStyle(fontSize: 14)),

                //  color: Color(0xff0f194a),
              ),
        createContainer(
          context,
          Column(
            children: <Widget>[
              //  buildFullName(loggedInUser.name),
              buildSubHeading(context, 'BASIC INFORMATION'),
              buildRecordData(
                  "Name", "${loggedInUser.name} ${loggedInUser.lastName}"),
              buildHorizantalLine(),
              if (loggedInUser.phone != '')
                buildRecordData("Phone Number", loggedInUser.phone),
              if (loggedInUser.phone != '') buildHorizantalLine(),
              if (loggedInUser.email != '')
                buildRecordData("Email", loggedInUser.email),
              if (loggedInUser.email != '') buildHorizantalLine(),

              buildRecordData("City", loggedInUser.city),
              buildHorizantalLine(),
              buildRecordData("State", loggedInUser.state),
              buildHorizantalLine(),
              buildRecordData("Country", loggedInUser.country),

              // buildHorizantalLine(),
              // buildRecordData("Adhaar/PAN No.", loggedInUser.panNumber),
              // buildHorizantalLine(),
              // buildRecordData("Gothram / Star", loggedInUser.gothram),
              // buildHorizantalLine(),
              const SizedBox(
                height: 15,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     _buildEditButton(context),
              //     const SizedBox(width: 50.0),
              //     _buildLogoutButton(context),
              //   ],
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildLogoutButton(context) {
  //   return Center(
  //     child: Container(
  //       width: 120,
  //       decoration: BoxDecoration(
  //           color: bgColorPinkDark, borderRadius: BorderRadius.circular(10)),
  //       child: TextButton(
  //         onPressed: () {
  //           logout(context);
  //         },
  //         //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //         child: const Text("Logout",
  //             style: TextStyle(color: Colors.white, fontSize: 16)),

  //         //  color: Color(0xff0f194a),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildEditButton(context) {
  //   return Center(
  //     child: Container(
  //       width: 120,
  //       decoration: BoxDecoration(
  //           color: bgColorPinkDark, borderRadius: BorderRadius.circular(10)),
  //       child: TextButton(
  //         onPressed: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => EditProfile(sourceFrom: 'homePage')));
  //         },
  //         //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //         child: const Text("Edit Profile",
  //             style: TextStyle(color: Colors.white, fontSize: 16)),

  //         //  color: Color(0xff0f194a),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildProfileImage(context, profileImgUrl) {
    if (profileImgUrl == null) {
      return const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color(0xffE6E6E6),
              radius: 80,
              child: Icon(
                Icons.person,
                color: Color(0xffCCCCCC),
                size: 80.0,
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: const Color(0xffE6E6E6),
              radius: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: CachedNetworkImage(
                    imageUrl: profileImgUrl!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Container(
                          color: Colors.grey,
                        ),
                    errorWidget: (context, url, error) {
                      return headerImage(context, "assets/profile.png");
                    }),
              ),
            ),
          ],
        ),
      );
    }
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (c) => const LoginScreen()),
        (route) => false);
    //Navigator.of(context).pushReplacementNamed('/loginhome');
  }
}
