import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import '../constants/color_constant.dart';
import '../constants/constants.dart';
import '../utilities/common_widgets.dart';
import '../utilities/dialog_widget.dart';
import '../utilities/mobile_design_widget.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  const OTPScreen(this.phone, {super.key});

  @override
  State<OTPScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<OTPScreen> {
  late String _verificationCode;
  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              await FirebaseFirestore.instance
                  .collection(Constants.users)
                  .doc(FirebaseAuth.instance.currentUser?.uid)
                  .get()
                  .then((doc) async {
                if (doc.exists) {
                  if (!mounted) return;
                  context.goNamed('dashboard');
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const HomeScreen()),
                  //     (route) => false);
                } else {
                  if (!mounted) return;
                  context.goNamed('login');
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             EditProfile(sourceFrom: 'login')),
                  //     (route) => false);
                }
              });
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            showErrorDialog(context, 'The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          setState(() {
            _verificationCode = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }

  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    //color: ,
    borderRadius: BorderRadius.circular(8.0),
    border: Border.all(
      color: bgColorPinkDark,
    ),
  );
  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final loginButton = createButton("SUBMIT", () async {
      signIn(_pinPutController.text);
    });

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20, color: mCardTitleColor, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: bgColorPinkDark),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        key: _scaffoldkey,
        appBar: createAppBar("OTP Verification"),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'Please type the verification \n code sent to ${widget.phone}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, height: 1.5, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Pinput(
                defaultPinTheme: defaultPinTheme,
                showCursor: true,
                length: 6,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                pinAnimationType: PinAnimationType.fade,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginButton,
                ],
              ),
            ),
            const SizedBox(height: 25),
            TextButton(
              onPressed: () {
                _verifyPhone();
              },
              child: const Text(
                'Did not recieve OTP? Resend OTP',
                style: TextStyle(color: mCardTitleColor, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signIn(pin) async {
    showProcessDialog(context);
    if (pin.length == 6) {
      try {
        await FirebaseAuth.instance
            .signInWithCredential(PhoneAuthProvider.credential(
                verificationId: _verificationCode, smsCode: pin))
            .then((value) async {
          if (value.user != null) {
            await FirebaseFirestore.instance
                .collection(Constants.users)
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .get()
                .then((doc) async {
              if (doc.exists) {
                if (!mounted) return;
                Navigator.pop(context);
                context.goNamed('dashboard');
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (context) => const HomeScreen()),
                //     (route) => false);
              } else {
                if (!mounted) return;
                Navigator.pop(context);
                context.goNamed('login');
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => EditProfile(sourceFrom: 'login')),
                //     (route) => false);
              }
            });
          }
        });
      } catch (e) {
        if (!mounted) return;
        Navigator.pop(context);
        FocusScope.of(context).unfocus();
        showErrorDialog(context, 'Invalid OTP');
      }
    } else {
      Navigator.pop(context);
      showErrorDialog(context, 'Enter valid OTP');
    }
  }
}
