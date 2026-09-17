import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/color_constant.dart';
import '../constants/style_constant.dart';
import '../utilities/common_widgets.dart';
import '../utilities/dialog_widget.dart';
import '../utilities/fire_auth.dart';
import '../utilities/http_exception.dart';
import '../utilities/mobile_design_widget.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = "/ForgotPassword";

  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  Future _submit() async {
    if (_formKey.currentState!.validate()) {
      showProcessDialog(context);
      try {
        await FireAuth.resetPassword(email: emailController.text.trim());
        if (!mounted) return;
        Navigator.pop(context);
        showSuccessDialog(context, "Password has been sent.", () {
          Navigator.of(context).pop();
          context.goNamed('login');
        });
      } on HttpException catch (e) {
        Navigator.pop(context);
        showErrorDialog(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar(""),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                headerImage(context, "assets/forgot_pwd.jpeg"),
                const SizedBox(height: 20.0),
                centerHeadingWithSubTitle(
                    "Forgot Password", "Enter your valid Email"),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        filled: true, // Make the box filled with color
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid Email'),
                    validator: (value) {
                      var pattern =
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?)*$";
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value!) || value.isEmpty) {
                        return 'Enter valid Email ID';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      emailController.text = value!;
                    },
                  ),
                ),
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Back to Login',
                          style: mLinkTextStyle,
                        ),
                      ),
                      createButton("SUBMIT", () {
                        _submit();
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
