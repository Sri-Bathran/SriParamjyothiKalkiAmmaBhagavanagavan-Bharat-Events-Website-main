import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:kbevents/utilities/http_exception.dart';

import '../constants/constants.dart';

class FireAuth {
  // For registering a new user
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String country,
    required String state,
    required String city,
  }) async {
    User? user;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    String? errorMessage;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await firebaseFirestore.collection(Constants.users).doc(user?.uid).set({
        'name': name,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'country': country,
        'state': state,
        'city': city,
        'createdDate': DateFormat('yyyy/MM/d').format(DateTime.now()),
        'courses': FieldValue.arrayUnion(['free']),
      });

      return user;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your Email appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this Email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this Email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "email-already-in-use":
          errorMessage = "The account already exists for that email.";
          break;
        case "weak-password":
          errorMessage = "The password provided is too weak.";
          break;
        default:
          errorMessage = "An undefined Error happened. Please try again.";
      }
      throw HttpException(errorMessage);
    } catch (e) {
      errorMessage = "An undefined Error happened. Please try again.";
      throw HttpException(errorMessage);
    }
  }

  // For signing in an user (have already registered)
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    String? errorMessage;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          errorMessage = "Your Email appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this Email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this Email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        case "unknown":
          errorMessage = "Invalid Email or Password. Please try again.";
          break;
        default:
          errorMessage = "An undefined Error happened. Please try again.";
          break;
      }
      throw HttpException(errorMessage);
    } catch (e) {
      errorMessage = "An undefined Error happened. Please try again.";
      throw HttpException(errorMessage);
    }
  }

  // Forgot Password

  static Future<String> resetPassword({required String email}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? errorMessage;
    try {
      await auth.sendPasswordResetEmail(email: email);
      return 'Email Sent';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "This Email does not exist.";
          break;
        case "user-not-found":
          errorMessage = "This Email does not exist.";
          break;
        default:
          errorMessage = "An undefined Error happened.  Please try again.";
      }
      throw HttpException(errorMessage);
    } catch (e) {
      errorMessage = "An undefined Error happened.  Please try again.";
      throw HttpException(errorMessage);
    }
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  // change Email Account Function
  static Future<String> changeUserEmail({required String email}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? errorMessage;
    try {
      // ignore: deprecated_member_use
      await auth.currentUser!.updateEmail(email);
      return 'Email has been updated.';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          errorMessage = "This email used is invalid.";
          break;
        case "email-already-in-use":
          errorMessage = "This email is already used by another user.";
          break;
        case "requires-recent-login":
          errorMessage =
              "Change account requires recent login, Please log out and log in again.";
          break;
        default:
          errorMessage = "An undefined Error happened. Please try again.";
      }
      throw HttpException(errorMessage);
    } catch (e) {
      errorMessage = "An undefined Error happened. Please try again.";
      throw HttpException(errorMessage);
    }
  }

  // change Phone Account Function
  static Future<String> changeUserPhone({phoneAuthCredential}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? errorMessage;
    try {
      await auth.currentUser!.updatePhoneNumber(phoneAuthCredential);
      return 'Email has been updated.';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-verification-code":
          errorMessage = "Invalid OTP.";
          break;
        case "credential-already-in-use":
          errorMessage = "This Phone Number is already exist.";
          break;
        case "invalid-verification-id":
          errorMessage = "Invalid OTP.";
          break;
        default:
          errorMessage = "An undefined Error happened. Please try again.";
      }
      throw HttpException(errorMessage);
    } catch (e) {
      errorMessage = "An undefined Error happened. Please try again.";
      throw HttpException(errorMessage);
    }
  }
}
