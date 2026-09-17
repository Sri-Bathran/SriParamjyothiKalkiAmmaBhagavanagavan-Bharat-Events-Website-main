import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class UserProvider with ChangeNotifier {
  /// The username of login.
  String get userName => _userName;
  String _userName = '';
  UserModel loggedInUser = UserModel();
  bool isLoading = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;

  Future<void> checkAuthenticate() async {
    auth.authStateChanges().listen((userInfo) {
      if (userInfo != null) {
        _userName = 'Valid';
        notifyListeners();
      }
    });
  }

  /// Whether a user has logged in.
  bool get loggedIn {
    if (_userName == '') {
      checkAuthenticate();
    }
    return _userName.isNotEmpty;
  }

  void getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value);
      _userName = "Valid";
      isLoading = true;
      notifyListeners();
    });
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    _userName = '';
    notifyListeners();
  }
}
