import 'package:go_router/go_router.dart';

import '../constants/color_constant.dart';
import 'package:flutter/material.dart';

import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<PaymentSuccess> {
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
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar("Registration Success"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 230, 255, 218),
                  radius: 60,
                  child: Icon(
                    Icons.check_circle,
                    color: Color.fromARGB(255, 48, 155, 6),
                    size: 80.0,
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  "Thank You!",
                  style: TextStyle(
                    color: mCardTitleColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                //const SizedBox(height: 50.0),
                const Text(
                  "Registration done Successfully",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 50.0),
                const Text(
                  "Click here to return to home page",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(
                        color: bgColorPinkDark,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        context.goNamed('dashboard');
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (c) => const HomeScreen()),
                        //     (route) => false);
                      },
                      //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: const Text("Go To Home",
                          style: TextStyle(color: Colors.white, fontSize: 16)),

                      //  color: Color(0xff0f194a),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // // login function
  // void signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     showProcessDialog(context);
  //     try {
  //       await FireAuth.signInUsingEmailPassword(
  //           email: email, password: password);
  //       Navigator.pop(context);
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(builder: (c) => const HomeScreen()),
  //           (route) => false);
  //     } on HttpException catch (e) {
  //       Navigator.pop(context);
  //       showErrorDialog(context, e.toString());
  //     }
  //   }
  // }
}
