import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';
import 'otp_screen.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class LoginPhoneScreen extends StatefulWidget {
  const LoginPhoneScreen({super.key});

  @override
  State<LoginPhoneScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPhoneScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Phone");
        }
        // reg expression for email validation
        if (!RegExp(r'(^[0-9]{10}$)').hasMatch(value)) {
          return ("Please Enter a valid Phone Number");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true, // Make the box filled with color
        fillColor: Colors.white,
        hoverColor: Colors.white,
        prefixIcon: const Icon(Icons.phone),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Indian Phone Number",
        label: const Text("Indian Phone Number"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final loginButton = createButton("GET OTP", () async {
      if (_formKey.currentState!.validate()) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OTPScreen(emailController.text),
          ),
        );
      }
    });

    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar("Kalki Bharat Events"),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                headerImage(context, "assets/phon_number.jpeg"),
                const SizedBox(height: 20.0),
                centerHeadingWithSubTitle(
                  "Sign-In with Phone Number",
                  "Only Indian Phone Numbers",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: emailField,
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [loginButton],
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
