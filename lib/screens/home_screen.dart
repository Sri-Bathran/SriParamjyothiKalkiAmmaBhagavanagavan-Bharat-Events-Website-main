import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/color_constant.dart';
import '../model/user_model.dart';
import '../providers/user_provider.dart';
import '../utilities/mobile_design_widget.dart';
import 'dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<HomeScreen> {
  bool isloggedin = false;

  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // your code in here
      _loadUserProvider(context);
    });
    super.initState();
  }

  _loadUserProvider(BuildContext context) async {
    Provider.of<UserProvider>(context, listen: false).getUserData();
  }

  void fcmMessageHandler(msg) {}

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    final apiService = Provider.of<UserProvider>(context);
    // Provider.of<UserProvider>(context, listen: false).checkNewVersion(context);
    if (apiService.isLoading == false) {
      return MobileDesignWidget(
        child: Scaffold(
          backgroundColor: bgColorLightGold,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20), // Sets the radius for rounded corners
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/splash_screen.jpeg",
                          fit: BoxFit.fill),
                    )),
                const Padding(padding: EdgeInsets.only(top: 20.0)),
                const Padding(padding: EdgeInsets.only(top: 120.0)),
                const CircularProgressIndicator(
                  backgroundColor: mBlackColor,
                  color: bgColorLightGold,
                  strokeWidth: 3,
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return const Dashboard();
    }
  }
}
