import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kbevents/screens/forgot_password.dart';
import 'package:kbevents/screens/receipt_details.dart';
import 'package:kbevents/screens/receipts.dart';
import 'package:kbevents/screens/signup.dart';
import 'package:kbevents/screens/upcoming_event_detail.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'screens/about_app.dart';
import 'screens/cookies_policy.dart';
import 'screens/edit_profile.dart';
import 'screens/events.dart';
import 'screens/home_screen.dart';
import 'screens/home_screen_before_login.dart';
import 'screens/login.dart';
import 'screens/my_profile.dart';
import 'screens/payment_success.dart';
import 'screens/privacy_policy.dart';
import 'screens/splash_screen.dart';
import 'screens/terms_of_use.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const firebaseConfig = FirebaseOptions(
    // apiKey: "AIzaSyDm4fOBOoLmdMz9tjAtB8m2h7fvG2FiqrQ",
    // authDomain: "abeventsdev.firebaseapp.com",
    // projectId: "abeventsdev",
    // storageBucket: "abeventsdev.appspot.com",
    // messagingSenderId: "377555664615",
    // appId: "1:377555664615:web:fec8cbc171597f9c9cac42",
    // measurementId: "G-6VL6L3GD5Y",
    apiKey: "AIzaSyBEPO27fpsRENZldiA2hyGEwSx9hkn3AAs",
    authDomain: "ammabhagavan-events-test.firebaseapp.com",
    databaseURL:
        "https://ammabhagavan-events-test-default-rtdb.asia-southeast1.firebasedatabase.app",
    projectId: "ammabhagavan-events-test",
    storageBucket: "ammabhagavan-events-test.appspot.com",
    messagingSenderId: "318048652696",
    appId: "1:318048652696:web:9de061348c74f6c3a8afed",
    measurementId: "G-V0YW41KGWR",
  );
  if (kIsWeb) {
    await Firebase.initializeApp(options: firebaseConfig);
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final UserProvider _loginInfo = UserProvider();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>.value(
      value: _loginInfo,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: _router,
          title: "Kalki Bharat Events",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.amber),
        ),
      ),
    );
  }

  late final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder:
            (BuildContext context, GoRouterState state) => const SplashScreen(),
      ),
      GoRoute(
        name: "home",
        path: "/home",
        builder:
            (BuildContext context, GoRouterState state) =>
                const HomeScreenBeforeLogin(),
        routes: [
          GoRoute(
            name: "login",
            path: "login",
            builder:
                (BuildContext context, GoRouterState state) =>
                    const LoginScreen(),
            routes: [
              GoRoute(
                name: "forgotPassword",
                path: "forgotPassword",
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const ForgotPassword(),
              ),
              GoRoute(
                name: "signUp",
                path: "signUp",
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const Signup(),
              ),
            ],
          ),
          GoRoute(
            name: "aboutAPP",
            path: "aboutAPP",
            builder:
                (BuildContext context, GoRouterState state) =>
                    AboutApp(sourceFrom: 'login'),
            routes: [
              GoRoute(
                name: "privacyPolicy",
                path: "privacyPolicy",
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const PrivacyPolicy(),
              ),
              GoRoute(
                name: "TermsofUse",
                path: "TermsofUse",
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const TermsOfUse(),
              ),
              GoRoute(
                name: "CookiesPolicy",
                path: "CookiesPolicy",
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const CookiesPolicy(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        redirect: (BuildContext context, GoRouterState state) {
          return checkGuard(context, state);
        },
        name: "dashboard",
        path: "/dashboard",
        builder:
            (BuildContext context, GoRouterState state) => const HomeScreen(),
        routes: [
          GoRoute(
            name: "events",
            path: "events",
            builder:
                (BuildContext context, GoRouterState state) => const Events(),
            routes: [
              GoRoute(
                name: "eventDetails",
                path: "e-:eventID/eventDetails",
                builder: (BuildContext context, GoRouterState state) {
                  final eventID = state.pathParameters['eventID']!;
                  return UpcomingEventDetail(
                    eventID: eventID.toString(),
                    formType: "add",
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: "receipts",
            path: "receipts",
            builder:
                (BuildContext context, GoRouterState state) => const Receipts(),
            routes: [
              GoRoute(
                name: "receiptDetails",
                path: "e-:eventID/receiptDetails",
                builder: (BuildContext context, GoRouterState state) {
                  final eventID = state.pathParameters['eventID']!;
                  return ReceiptDetailes(eventID: eventID.toString());
                },
              ),
              GoRoute(
                name: "updateDetails",
                path: "e-:eventID/updateDetails",
                builder: (BuildContext context, GoRouterState state) {
                  final eventID = state.pathParameters['eventID']!;
                  return UpcomingEventDetail(
                    eventID: eventID.toString(),
                    formType: "edit",
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: "profile",
            path: "profile",
            builder:
                (BuildContext context, GoRouterState state) =>
                    const MyProfile(),
          ),
          GoRoute(
            name: "paymentSuccess",
            path: "paymentSuccess",
            builder:
                (BuildContext context, GoRouterState state) =>
                    const PaymentSuccess(),
          ),
          GoRoute(
            name: "editProfile",
            path: "editProfile",
            builder:
                (BuildContext context, GoRouterState state) =>
                    EditProfile(sourceFrom: "homePage"),
          ),
          GoRoute(
            name: "about",
            path: "about",
            builder:
                (BuildContext context, GoRouterState state) =>
                    AboutApp(sourceFrom: 'home'),
            routes: [
              GoRoute(
                name: "privacyPolicyInfo",
                path: "privacyPolicy",
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const PrivacyPolicy(),
              ),
              GoRoute(
                name: "TermsofUseInfo",
                path: "TermsofUse",
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const TermsOfUse(),
              ),
              GoRoute(
                name: "CookiesPolicyInfo",
                path: "CookiesPolicy",
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const CookiesPolicy(),
              ),
            ],
          ),
        ],
      ),
    ],
    refreshListenable: _loginInfo,
  );

  checkGuard(context, state) {
    // if the user is not logged in, they need to login
    final bool loggedIn = _loginInfo.loggedIn;
    final bool loggingIn = state.matchedLocation == '/home';
    if (!loggedIn) {
      return '/home';
    }
    // if the user is logged in but still on the login page, send them to
    // the home page
    if (loggingIn) {
      return '/';
    }

    // no need to redirect at all
    return null;
  }
}
