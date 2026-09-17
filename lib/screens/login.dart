import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import '../constants/style_constant.dart';
import '../providers/user_provider.dart';
import '../utilities/dialog_widget.dart';
import '../utilities/fire_auth.dart';
import '../utilities/http_exception.dart';
import 'package:flutter/material.dart';

import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool _passwordVisible = false;

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
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
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp(
                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
              .hasMatch(value)) {
            return ("Please Enter a valid Email");
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
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          label: const Text("Email"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: !_passwordVisible,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            filled: true, // Make the box filled with color
            fillColor: Colors.white,
            hoverColor: Colors.white,
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            label: const Text("Password"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            )));

    final loginButton = createButton("SUBMIT", () async {
      signIn(emailController.text.trim(), passwordController.text.trim());
    });

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
                centerHeadingWithSubTitle("Sign-In with Email",
                    "Sign-in with your Email and Password"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: emailField,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: passwordField,
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.goNamed('forgotPassword');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: mLinkTextStyle,
                        ),
                      ),
                      loginButton,
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                // TextButton(
                //   onPressed: () {
                //     context.goNamed('signUp');
                //   },
                //   child: Text(
                //     'Not a Member? Sign up now',
                //     style: mLinkTextStyle,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      showProcessDialog(context);
      try {
        await FireAuth.signInUsingEmailPassword(
            email: email, password: password);
        if (!mounted) return;
        Provider.of<UserProvider>(context, listen: false).getUserData();
        Navigator.pop(context);
        context.goNamed('dashboard');
      } on HttpException catch (e) {
        Navigator.pop(context);
        showErrorDialog(context, e.toString());
      }
    }
  }
}
