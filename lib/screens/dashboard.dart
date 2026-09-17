import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import '../constants/style_constant.dart';
import '../providers/user_provider.dart';
import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';

class Dashboard extends StatefulWidget {
  final String? loggedInUserRole;
  const Dashboard({super.key, this.loggedInUserRole});
  @override
  State<Dashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // final loggedInUser = context.watch<UserProvider>().loggedInUser;
    //var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final userData = context.watch<UserProvider>().loggedInUser;
    //    var headImageSrc = "assets/ekam_mithras.png";

    //  }

    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('Dashboard', style: mAppBarStyle)],
          ),
          // actions: [
          //   //_buildLogoutButton(context),
          //   refreshSession(context),
          // ],
          backgroundColor: appBarColor,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                headerImage(context, "assets/login_home.jpeg"),
                const SizedBox(height: 20.0),
                centerHeadingWithSubTitle("Welcome ${userData.name}", ""),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 130,
                        child: Card(
                          elevation: 2.9,
                          color: Color.fromARGB(255, 250, 163, 119),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            onTap: () => context.goNamed("events"),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 5),
                                Image.asset(
                                  "assets/agni-pooja.png",
                                  height: 60,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Unregistered Payments",
                                  textAlign: TextAlign.center,
                                  style: mGridTitle,
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 120,
                        height: 130,
                        child: Card(
                          elevation: 2.9,
                          color: Color.fromARGB(255, 168, 243, 167),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            onTap: () => context.goNamed("receipts"),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 5),
                                Image.asset("assets/bill.png", height: 60),
                                const SizedBox(height: 5),
                                Text(
                                  "Registered Payments",
                                  textAlign: TextAlign.center,
                                  style: mGridTitle,
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      SizedBox(
                        width: 110,
                        height: 130,
                        child: Card(
                          elevation: 2.9,
                          color: Color.fromARGB(255, 254, 167, 167),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Logout',
                                      style: pageTitleStyle,
                                    ),
                                    content: Text(
                                      'Are you sure you want to logout?',
                                      style: pageSubTitleStyle,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: mSubHeading,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await Provider.of<UserProvider>(
                                            context,
                                            listen: false,
                                          ).logout(context);
                                          // context.read<LoginInfo>().logout();
                                          //if (context.mounted) return;
                                          // ignore: use_build_context_synchronously
                                          context.goNamed('home');
                                        },
                                        child: Text(
                                          'Logout',
                                          style: mSubHeading,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 5),
                                Image.asset("assets/logout.png", height: 60),
                                const SizedBox(height: 5),
                                Text(
                                  "Logout",
                                  textAlign: TextAlign.center,
                                  style: mGridTitle,
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget refreshSession(BuildContext context) {
  return Center(
    child: Container(
      width: 150,
      decoration: BoxDecoration(
        color: bgColorPinkDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () async {
          Provider.of<UserProvider>(context, listen: false).getUserData();
        },
        //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Text(
          "Refresh User",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),

        //  color: Color(0xff0f194a),
      ),
    ),
  );
}

// Widget _buildLogoutButton(BuildContext context) {
//   return Center(
//     child: Container(
//       width: 150,
//       decoration: BoxDecoration(
//           color: bgColorPinkDark, borderRadius: BorderRadius.circular(20)),
//       child: TextButton(
//         onPressed: () async {
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   title: const Text('Logout'),
//                   content: const Text('Are you sure you want to logout?'),
//                   actions: [
//                     TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('Cancel')),
//                     TextButton(
//                         onPressed: () async {
//                           await Provider.of<UserProvider>(context,
//                                   listen: false)
//                               .logout(context);
//                           // context.read<LoginInfo>().logout();
//                           //if (context.mounted) return;
//                           // ignore: use_build_context_synchronously
//                           context.goNamed('home');
//                         },
//                         child: const Text('Logout'))
//                   ],
//                 );
//               });
//         },
//         //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: const Text("Logout",
//             style: TextStyle(color: Colors.white, fontSize: 16)),

//         //  color: Color(0xff0f194a),
//       ),
//     ),
//   );
// }
